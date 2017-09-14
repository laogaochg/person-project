package com.csair.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExceptionController {

    private static Logger logger = LoggerFactory.getLogger(ExceptionController.class);

    @RequestMapping("/404")
    @ResponseBody
    public ModelAndView testNoFound(HttpServletRequest request,ModelAndView mode) {
        logger.debug(request.toString());
        mode.setViewName("404");
        return mode;
    }

    /**
     * 没有权限的重定向
     *1
     * @param request
     * @param mode
     * @return
     */
    @RequestMapping("/unauthorizedException")
    public ModelAndView unauthorizedException(HttpServletRequest request,ModelAndView mode) {
        Map<String,Object> dataMap = new HashMap<String,Object>();
        String code = "000001";
        String mes = "您无权进行下列操作";
        logger.info("错误代码：  " + code + " 错误信息：" + mes);
        dataMap.put("code",code);
        dataMap.put("mes",mes);
        ModelAndView model = new ModelAndView();
        model.setViewName("/404");
        String msg = dataMap.get("mes") + "";
        model.addObject("msg",msg);
        model.addObject("code",dataMap.get("code"));
        return model;
    }
}
