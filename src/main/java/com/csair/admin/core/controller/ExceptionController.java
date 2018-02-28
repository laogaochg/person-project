package com.csair.admin.core.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    public ModelAndView testNoFound(HttpServletRequest request, ModelAndView mode) {
        logger.debug(request.toString());
        mode.setViewName("404");
        return mode;
    }


    /**
     * 没有权限的重定向
     * 1
     *
     * @param request
     * @param mode
     * @return
     */
    @RequestMapping("/unauthorizedException")
    public ModelAndView unauthorizedException(HttpServletRequest request, HttpServletResponse response, ModelAndView mode) {
        Map<String, Object> dataMap = new HashMap<String, Object>();
        ModelAndView model = new ModelAndView();
        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            response.setStatus(300);
            response.setHeader("Error-Json", "{code:2001,script:''}");
            // response.setContentType("text/html;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=utf-8");
            try {
                final String str = "{\"code\":\"000001\",\"msg\":\"您无权进行下列操作\"}";
                response.getWriter().append(str);
                response.getWriter().flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return model;
        } else {
            String code = "000001";
            String mes = "您无权进行下列操作";
            logger.info("错误代码：  " + code + " 错误信息：" + mes);
            dataMap.put("code", code);
            dataMap.put("mes", mes);
            model.setViewName("/404");
            String msg = dataMap.get("msg") + "";
            model.addObject("msg", msg);
            model.addObject("code", dataMap.get("code"));
        }

        return model;
    }
}
