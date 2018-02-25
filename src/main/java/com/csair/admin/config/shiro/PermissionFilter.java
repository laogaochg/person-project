package com.csair.admin.config.shiro;

import com.csair.admin.core.po.core.Role;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.service.UserService;
import com.csair.admin.core.service.impl.PermissionServiceImpl;
import com.csair.admin.util.ParamConstants;
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
import java.util.Map;

/**
 * 权限校验 Filter
 */
public class PermissionFilter extends AccessControlFilter {
    private static Logger logger = LoggerFactory.getLogger(PermissionFilter.class);

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        //修改过滤的东西
        HttpServletRequest httpRequest = ((HttpServletRequest) request);
        String uri = httpRequest.getRequestURI();//获取URI
        String basePath = httpRequest.getContextPath();//获取basePath
        if (null != uri && uri.startsWith(basePath)) {
            uri = uri.replaceFirst(basePath, "");
        }

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
            return subject.isAuthenticated();//认证的
        }
        return Boolean.FALSE;
    }


    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
        Subject subject = getSubject(request, response);
        saveRequest(request);
        String url = "/404";
        if (null == subject.getPrincipal()) {//表示没有登录，重定向到登录页面
            url = "/login";
        }
        if (!subject.isAuthenticated()) {//没有认证，重定向到登录页面
            url = "/login";
        }
        WebUtils.issueRedirect(request, response, url);
        return Boolean.FALSE;
    }

}
