package com.diyiliu.console.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Description: SysController
 * Author: DIYILIU
 * Update: 2016-10-28 15:00
 */

@Controller
@RequestMapping("/sys")
public class SysController {

    @RequestMapping("/role")
    public ModelAndView roleList(){

        ModelAndView mv = new ModelAndView("/console/sys/role");

        return mv;
    }


}
