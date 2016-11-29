package com.diyiliu.console.controller;

import com.diyiliu.console.entity.SysRole;
import com.diyiliu.console.service.RoleService;
import com.diyiliu.support.util.CommonUtil;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import java.util.Date;

/**
 * Description: RoleController
 * Author: DIYILIU
 * Update: 2016-11-29 15:28
 */

@Controller
@RequestMapping("/role")
public class RoleController {

    @Resource
    private RoleService roleService;

    @ResponseBody
    @RequestMapping("list")
    public String list(int page, int rows){

        return "";
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
