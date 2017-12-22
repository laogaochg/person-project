package com.csair.admin.config;

import com.csair.admin.core.po.core.Role;
import com.csair.admin.core.service.impl.PermissionServiceImpl;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 权限校验 Filter
 */
public class PermissionFilter extends AccessControlFilter {
    private static Logger logger = LoggerFactory.getLogger(PermissionFilter.class);
    private ShiroFilter shiroFilter;

    public void setShiroFilter(ShiroFilter shiroFilter) {
        this.shiroFilter = shiroFilter;
    }

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {


        //修改过滤的东西
        HttpServletRequest httpRequest = ((HttpServletRequest) request);
        String uri = httpRequest.getRequestURI();//获取URI
        String basePath = httpRequest.getContextPath();//获取basePath
        if (null != uri && uri.startsWith(basePath)) {
            uri = uri.replace(basePath, "");
        }
        //编写不用授权的url
        if ("/404".equals(uri) || "/unauthorizedException".equals(uri)) {
            return Boolean.TRUE;
        }
        //匿名访问处理
        Map<String, String> filterMap = shiroFilter.getFilterChainDefinitionMap();
        if ("anon".equals(filterMap.get(uri))) {
            return Boolean.TRUE;
        }
        System.out.println("------------------------");


        //先判断带参数的权限判断
        Subject subject = getSubject(request, response);
        //没有登陆就查看记住我功能
        if (!subject.isAuthenticated() && subject.isRemembered() && subject.getSession().getAttribute("user") == null) {
            Object principal = subject.getPrincipal();
            System.out.println("principal = " + principal);
            return Boolean.FALSE;
        }
        //没有登陆就不通过
        if (!subject.isAuthenticated()) {
            return Boolean.FALSE;
        }
        if (null != mappedValue) {
            String[] arra = (String[]) mappedValue;
            for (String permission : arra) {
                if (subject.isPermitted(permission)) {
                    return Boolean.TRUE;
                }
            }
        }

        //处理选中的菜单         selectMenuIdForIntropect
        String menuId = httpRequest.getParameter("selectMenuIdForIntropect");
        if (StringUtils.hasText(menuId)) {
            httpRequest.getSession().setAttribute("selectMenuIdForIntropect", new Long(menuId));
        } else {
            if (httpRequest.getSession().getAttribute("selectMenuIdForIntropect") == null) {
                httpRequest.getSession().setAttribute("selectMenuIdForIntropect", 0);
            }
        }

        try {
            //如果是超级管理员角色就过！
            subject.checkRole(Role.ADMIN);
            return Boolean.TRUE;
        } catch (Exception e) {
            //检查权限；没有就抛出没有权限的异常；到后面就是通过！
            try {
                subject.checkPermission(uri);
                return Boolean.TRUE;
            } catch (Exception e1) {
                //如果当前URL没有对应的权限，登陆就能看到
                if (PermissionServiceImpl.noPermissionRequestMapping.containsKey(uri)) {
                    return Boolean.TRUE;
                }
                return Boolean.FALSE;
            }
        }
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        Subject subject = getSubject(request, response);
        if (null == subject.getPrincipal()) {//表示没有登录，重定向到登录页面
            saveRequest(request);
            WebUtils.issueRedirect(request, response, "/login");
        } else {
            request.getRequestDispatcher("/unauthorizedException").forward(request, response);
//            throw new UnauthorizedException();
        }
        return Boolean.FALSE;
    }

}
