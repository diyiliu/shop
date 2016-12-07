package com.diyiliu.console.controller;

import com.diyiliu.console.controller.form.GoodsForm;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Description: GuideController
 * Author: Administrator
 * Update: 2016-12-02 13:28
 */

@Controller
@RequestMapping(value = "/guide", produces = "text/html;charset=UTF-8")
public class GuideController {

    @ResponseBody
    @RequestMapping(value = "/addGoods")
    public String addGoods(MultipartFile file, GoodsForm goodsForm, HttpServletRequest request) {

        if (!file.isEmpty()) {
            String realPath = request.getSession().getServletContext().getRealPath("/source/upload");
            String fileName = file.getOriginalFilename();

            File targetFile = new File(realPath, fileName);

            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }

            try {
                file.transferTo(targetFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return "1";
    }


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        CustomDateEditor dateEditor = new CustomDateEditor(format, true);

        binder.registerCustomEditor(Date.class, dateEditor);
    }
}
