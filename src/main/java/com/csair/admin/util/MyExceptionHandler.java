package com.csair.admin.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.UnauthorizedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * 异常统一处理
 *
 * @author liuxin
 */
@Component
public class MyExceptionHandler implements HandlerExceptionResolver, EmbeddedServletContainerCustomizer {

    private static Logger logger = LoggerFactory.getLogger(MyExceptionHandler.class);

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        Map<String, Object> dataMap = new HashMap<String, Object>();
        if (ex instanceof PlatformException) {
            int code = ((PlatformException) ex).getReturnCode();
            String mes = ((PlatformException) ex).getReturnMsg();
            logger.info("错误代码：  " + code + " 错误信息：" + mes);
            dataMap.put("code", code);
            dataMap.put("mes", mes);
        } else if (ex instanceof UnauthorizedException) {
            String code = "000001";
            String mes = "您无权进行下列操作";
            logger.info("错误代码：  " + code + " 错误信息：" + mes + ex.getMessage());
            dataMap.put("code", code);
            dataMap.put("mes", mes);
        } else {
            ex.printStackTrace();
            logger.info("服务器异常信息：  " + ex.getMessage());
            dataMap.put("code", ParamConstants.SYSTEM_ERROR_CODE);
            dataMap.put("mes", ParamConstants.SYSTEM_ERROR_MSG);
        }
        ModelAndView model = new ModelAndView();
        model.setViewName("/404");
        String msg = dataMap.get("mes") + "";
        model.addObject("msg", msg);
        model.addObject("code", dataMap.get("code"));
        return model;
    }

    @Override
    public void customize(ConfigurableEmbeddedServletContainer container) {
        container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/404"));
        container.addErrorPages(new ErrorPage(HttpStatus.BAD_REQUEST, "/404"));
        container.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/404"));
    }
}
