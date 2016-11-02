package com.diyiliu.console.controller;

import com.diyiliu.console.entity.SysResource;
import com.diyiliu.console.service.ResourceService;
import com.diyiliu.other.Constant;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * Description: LoginController
 * Author: DIYILIU
 * Update: 2016-10-24 10:27
 */

@Controller
@RequestMapping("/admin")
public class LoginController {

    @Resource
    private ResourceService resourceService;

    @RequestMapping("/login")
    public String index() {

        return "/login";
    }

    @RequestMapping("/main")
    public ModelAndView home() {
        ModelAndView mv = new ModelAndView("/main");

        List<SysResource> list = resourceService.selectForList(new SysResource().
                setWhere(Constant.QBuilder.EQUAL, "type", "menu").
                setWhere(Constant.QBuilder.EQUAL, "available", true).
                setWhere(Constant.QBuilder.ORDER_BY, null, "SORT"));

        try {
            ObjectMapper objectMapper = new ObjectMapper();
            String result = objectMapper.writeValueAsString(list);

            mv.addObject("list", result);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return mv;
    }
}
