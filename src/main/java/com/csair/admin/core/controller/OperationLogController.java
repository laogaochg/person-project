package com.csair.admin.core.controller;

import com.csair.admin.util.ServletUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.csair.admin.core.po.core.query.OperationLogQueryObject;
import com.csair.admin.core.service.OperationLogService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * laogaochg
 * 2017/7/11.
 */
@Controller
@RequestMapping("log")
public class OperationLogController {
    @Resource
    private OperationLogService operationLogService;

    @RequestMapping("list")
    public String list(OperationLogQueryObject qo, Model model,HttpServletRequest httpRequest) {
        model.addAttribute("pageResult", operationLogService.pageQuery(qo));
        model.addAttribute("qo", qo);
        model.addAttribute("userMenus", ServletUtils.queryUserMenu());
        model.addAttribute("selectMenuIdForIntropect", ServletUtils.getSelectMenuId(httpRequest));
        return "log/list";
    }
}


