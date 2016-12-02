package com.diyiliu.console.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * Description: GuideController
 * Author: Administrator
 * Update: 2016-12-02 13:28
 */

@Controller
@RequestMapping(path = "/guide", produces = "text/html;charset=UTF-8")
public class GuideController {

    @RequestMapping("/addGoods")
    public String addGoods(MultipartFile file, HttpServletRequest request){

        String realPath = request.getSession().getServletContext().getRealPath("/source/upload");
        File targetFile = new File(realPath + File.separator + file.getName());

        try {
            file.transferTo(targetFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "1";
    }

}
