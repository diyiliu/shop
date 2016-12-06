package com.diyiliu.console.controller;

import com.diyiliu.console.controller.form.GoodsForm;
import com.diyiliu.console.entity.Goods;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
@RequestMapping(value = "/guide", produces = "text/html;charset=UTF-8")
public class GuideController {

    @RequestMapping(value = "/addGoods", method = RequestMethod.POST)
    public String addGoods(MultipartFile file, HttpServletRequest request){
        String realPath = request.getSession().getServletContext().getRealPath("/source/upload");
        String fileName = file.getOriginalFilename();

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
