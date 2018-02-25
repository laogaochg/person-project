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

/**
 * 权限校验 Filter
 */
public class PermissionFilter extends AccessControlFilter {
    private static Logger logger = LoggerFactory.getLogger(PermissionFilter.class);
    private ShiroFilter shiroFilter;
    private UserService userService;

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
//        //编写不用授权的url
//        if ("/404".equals(uri) || "/unauthorizedException".equals(uri)) {
//            return Boolean.TRUE;
//        }


        //先判断带参数的权限判断
        Subject subject = getSubject(request, response);
        //没有登陆就查看记住我功能
        if (!subject.isAuthenticated()
                && subject.isRemembered()
                && subject.getSession().getAttribute("user") == null) {
            User user  = (User) subject.getPrincipal();
            UsernamePasswordToken token = new UsernamePasswordToken(user.getEmail(), user.getPswd());
            token.setRememberMe(true);
            subject.login(token);
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
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response)throws IOException {
        Subject subject = getSubject(request, response);
        if (null == subject.getPrincipal()) {//表示没有登录，重定向到登录页面
            saveRequest(request);
            WebUtils.issueRedirect(request, response, "/login");
        } else {
//            request.getRequestDispatcher("/unauthorizedException").forward(request, response);
            throw new UnauthorizedException();
        }
        return Boolean.FALSE;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
