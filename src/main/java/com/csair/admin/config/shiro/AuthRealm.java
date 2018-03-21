package com.csair.admin.config.shiro;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.csair.admin.config.PlatformException;
import com.csair.admin.core.dao.PermissionDao;
import com.csair.admin.core.dao.RoleDao;
import com.csair.admin.core.dao.UserDao;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.query.PermissionQuery;
import com.csair.admin.core.po.core.query.UserQuery;
import com.csair.admin.util.EnvironmentParams;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.util.StringUtils;

import com.csair.admin.core.po.core.Permission;
import com.csair.admin.core.po.core.Role;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.core.query.PermissionQueryObject;
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
    private UserDao userDao;
    @Resource
    private PermissionDao permissionDao;
    @Resource
    private RoleDao roleDao;

    //认证.登录
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken utoken = (UsernamePasswordToken) token;//获取用户输入的token
        String username = utoken.getUsername();
        User user = userLogin(username);
        SecurityUtils.getSubject().getSession().setAttribute(ParamConstants.USER_SESSION, user);
        return new SimpleAuthenticationInfo(user, user.getPswd(), this.getClass().getName());//放入shiro.调用 CredentialsMatcher 检验密码
    }

    private User userLogin(String email) {
        String platFormFlag = EnvironmentParams.getParams("PLATFORM_FLAG");
        UserQuery qo = new UserQuery();
        qo.createCriteria().andEmailEqualTo(email).andPlatformFlagEqualTo(platFormFlag);
        List<User> userList = userDao.selectByExample(qo);
        if (userList.size() > 1) {
            throw new AuthenticationException("数据异常");
        } else if (userList.size() == 0) {
            throw new UnknownAccountException("用户不存在");
        } else {
            User user = userList.get(0);
            if (User.STATUS_INVALID.equals(user.getStatus())) {
                throw new PlatformException(ParamConstants.FORDI_LOGIN, "对不起，你账号已经被禁止登录。");
            }
            return user;
        }
    }

    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        User user = (User) super.getAvailablePrincipal(principals);
        Set<String> permissions = new HashSet<String>();
        Set<String> roles = new HashSet<String>();
        List<Role> rolesList = roleDao.queryRoleByUserId(user.getId());
        for (Role role : rolesList) {
            //将用户具有的角色存入Set
            roles.add(role.getType());
            List<Permission> permissionList;
            if (Role.ADMIN.equalsIgnoreCase(role.getType())) {
                permissionList =  permissionDao.selectByExample(new PermissionQuery());
            } else {
                PermissionQueryObject qo = new PermissionQueryObject();
                qo.setRoleId(role.getId());
                qo.setLimit(-1);
                permissionList = new PageResult<Permission>(permissionDao.queryPermission(qo), 1, 1, 1).getListData();
            }
            for (Permission permission : permissionList) {
                //将角色具有的权限存入Set
                String url = permission.getUrl();
                if (StringUtils.hasText(permission.getName())) permissions.add(permission.getName());
                if (StringUtils.hasText(url)) {
                    Collections.addAll(permissions, url.split("\\|\\|"));
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