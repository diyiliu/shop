package com.diyiliu.web.controller;

import com.diyiliu.support.util.CommonUtil;
import com.diyiliu.web.controller.form.PurchaseForm;
import com.diyiliu.web.entity.Detail;
import com.diyiliu.web.entity.Purchase;
import com.diyiliu.web.service.DetailService;
import com.diyiliu.web.service.ProductService;
import com.diyiliu.web.service.PurchaseService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
@RequestMapping("/pur")
public class PurchaseController {

    @Resource
    private PurchaseService purchaseService;

    @Resource
    private ProductService productService;

    @Resource
    private DetailService detailService;


    @RequestMapping("/submit")
    public String submit(PurchaseForm purchaseForm){

        Purchase purchase = new Purchase();

        purchase.setId(CommonUtil.generateSerial());
        purchase.setMoney(new BigDecimal(purchaseForm.getMoney()));
        purchase.setOrderDate(new Date());

        purchaseService.insert(purchase);

        List<String> idList = purchaseForm.getIdList();
        List<Integer> countList = purchaseForm.getCountList();

        for (int i = 0; i < countList.size(); i++){
            if (countList.get(i) > 0){

                Detail detail = new Detail();
                detail.setId(CommonUtil.generateSerial());
                detail.setPurId(purchase.getId());
                detail.setProId(idList.get(i));
                detail.setProCount(countList.get(i));

                detailService.insert(detail);
            }
        }


        return "redirect:/index.jsp";
    }

}
