package com.csair.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.csair.admin.po.OperationLog;
import com.csair.admin.po.OperationLogQueryObject;
import com.csair.admin.service.OperationLogService;
import com.csair.admin.po.PageResult;
import com.csair.admin.po.UserQueryObject;
import com.csair.admin.service.UserService;

/**
 * laogaochg
 * 2017/7/10.
 * 首页
 */
@Controller
public class IndexController {
    @Autowired
    private UserService userService;
    @Autowired
    private OperationLogService operationLogService;

    /**
     * 首页
     *
     * @param qo
     * @param model
     * @return
     */
    @RequestMapping("index")
    public ModelAndView index(UserQueryObject qo,ModelAndView model) {
        PageResult pageResult = userService.query(qo);
        model.addObject("pageResult",pageResult);
        OperationLogQueryObject oqo = new OperationLogQueryObject();
        PageResult<OperationLog> operationLogPageResult = operationLogService.pageQuery(oqo);
        model.addObject("logResult",operationLogPageResult);
        model.setViewName("index");
        return model;
    }
}
