package com.diyiliu.web.controller;

import com.diyiliu.other.Constant;
import com.diyiliu.support.util.CommonUtil;
import com.diyiliu.web.controller.form.PurchaseForm;
import com.diyiliu.web.entity.Detail;
import com.diyiliu.web.entity.Purchase;
import com.diyiliu.web.service.DetailService;
import com.diyiliu.web.service.ProductService;
import com.diyiliu.web.service.PurchaseService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Description: PurchaseController
 * Author: DIYILIU
 * Update: 2016-09-30 11:30
 */

@Controller
@RequestMapping(value = "/pur", produces = "text/html;charset=UTF-8")
public class PurchaseController {

    @Resource
    private PurchaseService purchaseService;

    @Resource
    private ProductService productService;

    @Resource
    private DetailService detailService;


    @RequestMapping("/submit")
    public String submit(PurchaseForm purchaseForm, RedirectAttributes attributes) {

        Purchase purchase = new Purchase();

        purchase.setId(CommonUtil.generateSerial());
        purchase.setMoney(new BigDecimal(purchaseForm.getMoney()));
        purchase.setOrderDate(new Date());

        purchaseService.insert(purchase);

        List<String> idList = purchaseForm.getIdList();
        List<Integer> countList = purchaseForm.getCountList();
        List<BigDecimal> priceList = purchaseForm.getPriceList();

        for (int i = 0; i < countList.size(); i++) {
            if (countList.get(i) > 0) {

                Detail detail = new Detail();
                detail.setId(CommonUtil.generateSerial());
                detail.setPurId(purchase.getId());
                detail.setProId(idList.get(i));
                detail.setProCount(countList.get(i));
                detail.setProPrice(priceList.get(i));

                detailService.insert(detail);
            }
        }

        attributes.addFlashAttribute("path", "./pur/list.htm");

        return "redirect:/index.htm";
    }


    @RequestMapping("/list")
    public ModelAndView list() {
        Purchase purchase = new Purchase();
        purchase.setWhere(Constant.QBuilder.ORDER_BY, null, "ORDER_TIME DESC");

        List<Purchase> purList = purchaseService.selectForList(purchase);

        ModelAndView mv = new ModelAndView("/order");
        mv.addObject("list", purList);

        return mv;
    }

    @ResponseBody
    @RequestMapping("/detail")
    public String detail(@RequestParam String purId) {
        String result = "";

        List<Detail> detailList = purchaseService.queryDetails(purId);
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            result = objectMapper.writeValueAsString(detailList);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return result;
    }

}
