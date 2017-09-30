package com.csair.admin.config;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.csair.admin.core.po.core.Permission;
import com.csair.admin.core.po.core.Role;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.core.PermissionQueryObject;
import com.csair.admin.core.service.PermissionService;
import com.csair.admin.core.service.RoleService;
import com.csair.admin.core.service.impl.UserServiceImpl;
import com.csair.admin.util.ParamConstants;

import javax.annotation.Resource;

/**
 * shiro认证，授权
 */
public class AuthRealm extends AuthorizingRealm {
    @Resource
    private UserServiceImpl userService;
    @Resource
    private PermissionService permissionService;
    @Resource
    private RoleService roleService;

    //认证.登录
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken utoken = (UsernamePasswordToken)token;//获取用户输入的token
        String username = utoken.getUsername();
        User user = userService.userLogin(username);
        SecurityUtils.getSubject().getSession().setAttribute(ParamConstants.USER_SESSION,user);
        return new SimpleAuthenticationInfo(user,user.getPswd(),this.getClass().getName());//放入shiro.调用CredentialsMatcher检验密码
    }

    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        User user = (User)super.getAvailablePrincipal(principals);
        Set<String> permissions = new HashSet<String>();
        Set<String> roles = new HashSet<String>();
        List<Role> rolesList = roleService.queryRoleByUserId(user.getId());
        if (rolesList.size() > 0) {
            for (Role role : rolesList) {
                //将用户具有的角色存入Set
                roles.add(role.getType());
                List<Permission> permissionList;
                if (Role.ADMIN.equalsIgnoreCase(role.getType())) {
                    permissionList = permissionService.findAllPermission();
                } else {
                    PermissionQueryObject qo = new PermissionQueryObject();
                    qo.setRoleId(role.getId());
                    permissionList = permissionService.query(qo).getListData();
                }
                if (permissionList.size() > 0) {
                    for (Permission permission : permissionList) {
                        //将角色具有的权限存入Set
                        String url = permission.getUrl();
                        if (StringUtils.hasText(url)) {
                            String[] split = url.split("\\|\\|");
                            Collections.addAll(permissions,split);
                        }
                    }
                }
            }
        }
        //将权限放入shiro中.
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addStringPermissions(permissions);
        info.addRoles(roles);
        return info;
    }

}