package com.diyiliu.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Description: HomeCotroller
 * Author: DIYILIU
 * Update: 2016-10-10 15:53
 */

@Controller
public class HomeCotroller {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        logger.debug("Home index!");
        String reqHeader = request.getHeader("user-agent");

        return "guide/mobile/index";

/*        if (isMobile(reqHeader)){

            return "/guide/mobile/index";
        }

        return "/guide/index";*/
    }

    @RequestMapping("/hello")
    public String hello() {
        System.out.println("Hello freemarker!");

        return "/hello";
    }

    @RequestMapping("/report")
    public String report() {
        System.out.println("Hello report!");

        return "/WEB-INF/reportJsps/report";
    }

    @RequestMapping("/ireport")
    public String ireport() {
        System.out.println("Hello ireport!");

        return "/WEB-INF/reportJsps/ireport";
    }


    /**
     * 查看终端类型（PC/移动终端）
     *
     * @param header
     * @return
     */
    private boolean isMobile(String header) {
        String[] agents = new String[]{"Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"};

        for (String agent : agents) {
            if (header.indexOf(agent) > -1) {
                return true;
            }
        }

        return false;
    }
}
