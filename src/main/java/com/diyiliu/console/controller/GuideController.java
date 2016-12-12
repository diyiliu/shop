package com.diyiliu.console.controller;

import com.diyiliu.console.controller.form.GoodsForm;
import com.diyiliu.console.entity.Goods;
import com.diyiliu.console.entity.SysRole;
import com.diyiliu.console.service.GoodsService;
import com.diyiliu.other.PaginationHelper;
import com.diyiliu.support.util.CommonUtil;
import com.diyiliu.support.util.DateUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Description: GuideController
 * Author: Administrator
 * Update: 2016-12-02 13:28
 */

@Controller
@RequestMapping(value = "/guide", produces = "text/html;charset=UTF-8")
public class GuideController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private GoodsService goodsService;


    @ResponseBody
    @RequestMapping("list")
    public String list(int page, int rows){
        String result = "";

        PaginationHelper.page(page - 1, rows);
        List list = goodsService.selectForList(new Goods());

        Map resultMap = new HashedMap();
        resultMap.put("total", PaginationHelper.getTotal());
        resultMap.put("rows", list);
        try {
            result = CommonUtil.toJson(resultMap);

            logger.debug(result);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return result;
    }


    @ResponseBody
    @RequestMapping(value = "/addGoods")
    public String addGoods(MultipartFile file, GoodsForm goodsForm, HttpServletRequest request) {

        String imagePath = "";
        if (!file.isEmpty()) {
            // 项目路径
            String realPath = request.getSession().getServletContext().getRealPath("/source/upload");
            // 文件名
            String fileName = file.getOriginalFilename();
            // 日期时间戳
            String daySerial = DateUtil.dateToString(new Date(), "%1$tY%1$tm%1$td");

            File targetFile = new File(realPath + "/" + daySerial, fileName);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }

            try {
                file.transferTo(targetFile);
                imagePath = targetFile.getPath();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        Goods goods = goodsForm.getGoods();
        // TODO: 2016/12/7  mysql转义特殊符号
        goods.setImagePath(imagePath.substring(imagePath.lastIndexOf("source")).replaceAll("\\\\", "\\\\\\\\"));
        goods.setSerial(CommonUtil.generateDateSerial());
        goods.setCreateTime(new Date());

        goodsService.insert(goods);

        return "1";
    }

    @ResponseBody
    @RequestMapping("/delGoods")
    public String delGoods(@RequestParam("id") Integer id) throws Exception{

        Goods goods = new Goods();
        goods.setId(id);
        goodsService.delete(goods);

        Map result = new HashedMap();
        result.put("success", 1);

        return CommonUtil.toJson(result);
    }




    // TODO: 2016/12/7 时间格式绑定
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        CustomDateEditor dateEditor = new CustomDateEditor(format, true);

        binder.registerCustomEditor(Date.class, dateEditor);
    }
}
