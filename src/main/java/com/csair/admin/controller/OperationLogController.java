package com.csair.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.csair.admin.po.OperationLogQueryObject;
import com.csair.admin.service.OperationLogService;

/**
 * laogaochg
 * 2017/7/11.
 */
@Controller
@RequestMapping("log")
public class OperationLogController {
    @Autowired
    private OperationLogService operationLogService;

    @RequestMapping("list")
    public String list(OperationLogQueryObject qo,Model model) {
        model.addAttribute("pageResult",operationLogService.pageQuery(qo));
        model.addAttribute("qo",qo);
        return "log/list";
    }
}


