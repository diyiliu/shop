package com.diyiliu.console.controller;

import com.diyiliu.console.entity.SysRole;
import com.diyiliu.console.service.RoleService;
import com.diyiliu.other.PaginationHelper;
import com.diyiliu.support.util.CommonUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Description: RoleController
 * Author: DIYILIU
 * Update: 2016-11-29 15:28
 */

@Controller
@RequestMapping(path = "/role", produces = "text/html;charset=UTF-8")
public class RoleController {

    @Resource
    private RoleService roleService;

    @ResponseBody
    @RequestMapping("list")
    public String list(int page, int rows){
        String result = "";

        PaginationHelper.page(page - 1, rows);
        List list = roleService.selectForList(new SysRole());

        Map resultMap = new HashedMap();
        resultMap.put("total", PaginationHelper.getTotal());
        resultMap.put("rows", list);
        try {
            result = CommonUtil.toJson(resultMap);

            System.out.println(result);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return result;
    }

    @ResponseBody
    @RequestMapping("/save")
    public String save(SysRole role){
        role.setId(CommonUtil.generateSerial(20));
        role.setCreateDate(new Date());
        roleService.insert(role);

        return "1";
    }



}
