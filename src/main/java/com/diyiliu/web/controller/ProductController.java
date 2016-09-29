package com.diyiliu.web.controller;

import com.diyiliu.other.Constant;
import com.diyiliu.other.DateUtil;
import com.diyiliu.support.util.CommonUtil;
import com.diyiliu.web.entity.Product;
import com.diyiliu.web.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Description: ProductController
 * Author: DIYILIU
 * Update: 2016-09-27 11:08
 */

@Controller
@RequestMapping("/pro")
public class ProductController {

    @Resource
    private ProductService productService;

    @RequestMapping("/add")
    public String add(Product product) {
        product.setId(CommonUtil.makeSerial());
        product.setModified(new Date());
        productService.insert(product);

        return "redirect:/index.jsp";
    }

    @RequestMapping("/today")
    public ModelAndView today() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH, -1);

        Product product = new Product();
        product.setWhere(Constant.QBuilder.GREATER, "modified", calendar.getTime());
        List<Product> list = productService.selectForList(product);

        ModelAndView mv = new ModelAndView("/home");
        mv.addObject("list", list);

        return mv;
    }


    @RequestMapping("/list")
    public ModelAndView list() {
        List<Product> list = productService.selectForList(new Product());

        ModelAndView mv = new ModelAndView("/list");
        mv.addObject("list", list);

        return mv;
    }
}
