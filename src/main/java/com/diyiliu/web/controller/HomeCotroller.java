package com.diyiliu.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Description: HomeCotroller
 * Author: DIYILIU
 * Update: 2016-10-10 15:53
 */

@Controller
public class HomeCotroller {

    @RequestMapping("/index")
    public String index(){
        System.out.println("Home index!");

        return "/index";
    }

    @RequestMapping("/hello")
    public String hello(){
        System.out.println("Hello freemarker!");

        return "/hello";
    }
}
