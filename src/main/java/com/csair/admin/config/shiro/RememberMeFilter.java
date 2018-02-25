package com.csair.admin.config.shiro;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Component;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/12/29 10:16
 */
public class RememberMeFilter extends FormAuthenticationFilter {

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {

        //先判断带参数的权限判断
        Subject subject = getSubject(request, response);
        //没有登陆就查看记住我功能
        if (!subject.isAuthenticated() && subject.isRemembered() && subject.getSession().getAttribute("user") == null) {
            Object principal = subject.getPrincipal();
            System.out.println("principal = " + principal);
            return Boolean.FALSE;
        }
        return true;
    }
}
