package com.diyiliu.console.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * Description: GuideController
 * Author: Administrator
 * Update: 2016-12-02 13:28
 */

@Controller
@RequestMapping(value = "/guide", produces = "text/html;charset=UTF-8")
public class GuideController {

    @RequestMapping(value = "/addGoods", method = RequestMethod.POST)
    public String addGoods(MultipartFile file, HttpServletRequest request){
        System.out.println(request instanceof MultipartHttpServletRequest);

        String realPath = request.getSession().getServletContext().getRealPath("/source/upload");
        String fileName = file.getOriginalFilename();

        System.out.println(realPath);
        File targetFile = new File(realPath, fileName);

        if(!targetFile.exists()){
            targetFile.mkdirs();
        }

        try {
            file.transferTo(targetFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "1";
    }

}
