package com.csair.admin.config.shiro;

import com.csair.admin.core.po.core.Role;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.service.UserService;
import com.csair.admin.core.service.impl.PermissionServiceImpl;
import com.csair.admin.util.LoggerUtils;
import com.csair.admin.util.ParamConstants;
import com.csair.admin.util.ServletUtils;
import jdk.nashorn.internal.objects.annotations.Setter;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.servlet.ShiroFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/**
 * 权限校验 Filter
 */
public class PermissionFilter extends AccessControlFilter {

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        //修改过滤的东西
        String uri = ServletUtils.getUserRequestUrl(request);

        //没有登陆就查看记住我功能
        Subject subject = getSubject(request, response);
        if (!subject.isAuthenticated()
                && subject.isRemembered()
                && subject.getSession().getAttribute("user") == null) {
            User user = (User) subject.getPrincipal();
            subject.getSession().setAttribute(ParamConstants.USER_SESSION, user);
        }
        //先判断带参数的权限判断
        if (null != mappedValue) {
            String[] arra = (String[]) mappedValue;
            for (String permission : arra) {
                if (subject.isPermitted(permission)) {
                    return Boolean.TRUE;
                }
            }
        }
        //如果是超级管理员角色就过！
        if (subject.hasRole(Role.ADMIN)) {
            return Boolean.TRUE;
        }
        //检查权限；没有就抛出没有权限的异常；到后面就是通过！
        if (subject.isPermitted(uri)) {
            return Boolean.TRUE;
        }
        //如果当前URL没有对应的权限，认证才能看到
        Map<String, Method> noPermissionRequestMapping = PermissionServiceImpl.noPermissionRequestMapping;
        if (noPermissionRequestMapping.containsKey(uri)) {
            if (subject.isAuthenticated()) {//认证的
                return Boolean.TRUE;
            }
        }
        if (ServletUtils.isAjax(request)) {// ajax请求
            Map<String, Object> resultMap = new HashMap<>();
            resultMap.put("code", "403");
            if (null == subject.getPrincipal()) {
                resultMap.put("msg", "当前用户没有登录");//当前用户没有登录！
            } else {
                resultMap.put("msg", "你无权进行当前操作");//当前用户没有权限！
            }
            ServletUtils.out(response, resultMap);
        }
        return Boolean.FALSE;
    }


    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
        Subject subject = getSubject(request, response);
        String url = "/404";
        if (!subject.isAuthenticated()) {//没有认证，重定向到登录页面
            url = "/login";
        }
        if (null == subject.getPrincipal()) {//表示没有登录，重定向到登录页面
            //修改过滤的东西
            String uri = ServletUtils.getUserRequestUrl(request);
            url = "/login?returnUrl="+uri;
        }
        if (!ServletUtils.isAjax(request)) {
            saveRequest(request);
            WebUtils.issueRedirect(request, response, url);
        }
        return Boolean.FALSE;
    }

}
