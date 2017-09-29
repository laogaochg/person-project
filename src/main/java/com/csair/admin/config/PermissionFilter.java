package com.csair.admin.config;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.csair.admin.core.po.core.Role;
import com.csair.admin.core.service.impl.PermissionServiceImpl;
import org.springframework.util.StringUtils;

/**
 * 权限校验 Filter
 */
public class PermissionFilter extends AccessControlFilter {
    private static Logger logger = LoggerFactory.getLogger(PermissionFilter.class);

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {

        //先判断带参数的权限判断
        Subject subject = getSubject(request, response);
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
        HttpServletRequest httpRequest = ((HttpServletRequest) request);
        //处理选中的菜单         selectMenuIdForIntropect
        String menuId = httpRequest.getParameter("selectMenuIdForIntropect");
        if (StringUtils.hasText(menuId)) {
            httpRequest.getSession().setAttribute("selectMenuIdForIntropect", new Long(menuId));
        } else {
            if (httpRequest.getSession().getAttribute("selectMenuIdForIntropect") == null) {
                httpRequest.getSession().setAttribute("selectMenuIdForIntropect", 0);
            }
        }
        /**
         * 此处是改版后，为了兼容项目不需要部署到root下，也可以正常运行，但是权限没设置目前必须到root 的URI，
         * 原因：如果你把这个项目叫 ShiroDemo，那么路径就是 /ShiroDemo/xxxx.shtml ，那另外一个人使用，又叫Shiro_Demo,那么就要这么控制/Shiro_Demo/xxxx.shtml
         * 理解了吗？
         * 所以这里替换了一下，使用根目录开始的URI
         */
        String uri = httpRequest.getRequestURI();//获取URI
        String basePath = httpRequest.getContextPath();//获取basePath
        //编写不用授权的url
        if ("/404".equals(uri) || "/unauthorizedException".equals(uri)) {
            return Boolean.TRUE;
        }
        if (null != uri && uri.startsWith(basePath)) {
            uri = uri.replace(basePath, "");
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
            throw new UnauthorizedException();
        }
        return Boolean.FALSE;
    }

}
