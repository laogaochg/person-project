package com.csair.admin.core.controller;

import java.util.HashMap;
import java.util.Map;

import com.csair.admin.config.PermissionName;
import com.csair.admin.core.po.core.query.UserQueryObject;
import com.csair.admin.core.service.PermissionService;
import com.csair.admin.core.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.csair.admin.core.po.core.Role;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.query.RoleQueryObject;
import com.csair.admin.core.service.RoleService;
import com.csair.admin.util.ParamConstants;

import javax.annotation.Resource;

/**
 * 角色操作
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Resource
    private RoleService roleService;
    @Resource
    private UserService userService;
    @Resource
    private PermissionService permissionService;

    /**
     * 编辑角色的权限
     */
    @RequestMapping("/editRolePermission")
    @PermissionName("角色权限编辑")
    public ModelAndView editRolePermission(Long roleId, Long[] permissionIds, ModelAndView model) {
        Map<String, Object> map = new HashMap<String, Object>();
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getSession().getAttribute(ParamConstants.USER_SESSION);
        if (roleId == null) {
            map.put("code", 200);
            map.put("mes", "参数错误");

        } else {
            map = permissionService.editRolePermission(roleId, permissionIds, user);
        }
        model.addObject("msg", map);
        model.setViewName("role/updataMsg");
        return model;
    }

    //删除角色成员
    @RequestMapping("/removeRoleUser")
    @PermissionName("删除角色成员")
    public ModelAndView removeRoleUser(Long[] userIds, Long roleId, ModelAndView model) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (roleId != null && userIds.length != 0) {
            Subject subject = SecurityUtils.getSubject();
            User user = (User) subject.getSession().getAttribute(ParamConstants.USER_SESSION);
            map = roleService.removeRoleUser(userIds, roleId, user);
        } else {
            map.put("mes", "参数不正确");
        }
        model.addObject("msg", map);
        model.setViewName("role/updataMsg");
        return model;
    }

    //返回角色列表
    @RequestMapping("/list")
    @PermissionName("角色查询")
    public ModelAndView queryRole(RoleQueryObject qo, ModelAndView model) {
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getSession().getAttribute(ParamConstants.USER_SESSION);
        PageResult pageResult = roleService.query(qo);
        model.addObject("pageResult", pageResult);
        model.setViewName("role/roleList");
        return model;
    }

    /**
     * 查看角色成员账号
     */
    @RequestMapping("/userList")
    @PermissionName("角色成员查询")
    public ModelAndView queryUserByRole(UserQueryObject qo, ModelAndView model) {
        model.addObject("role", roleService.queryById(qo.getRoleId()));
//        qo.setPageSize(0);
        PageResult pageResult = userService.query(qo);
        model.addObject("pageResult", pageResult);
        model.setViewName("role/roleUserList");
        return model;
    }

    //去编辑角色页面
    @RequestMapping("/inputRole")
    @PermissionName("角色编辑")
    public ModelAndView inputRole(Long roleId, ModelAndView model) {
        if (roleId != null) {
            model.addObject("role", roleService.queryById(roleId));
        }
        model.setViewName("role/inputRole");
        return model;
    }

    //添加或者修改角色
    @RequestMapping("/addOrUpdataRole")
    @PermissionName("角色编辑")
    public ModelAndView addOrUpdataRole(Role role, ModelAndView model) {
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getSession().getAttribute(ParamConstants.USER_SESSION);
        Map<String, Object> map = roleService.add(role, subject);
        model.addObject("msg", map);
        model.setViewName("role/updataMsg");
        return model;
    }

    //删除角色
    @RequestMapping("/deleteRole")
    @PermissionName("删除角色")
    public ModelAndView deleteRole(Long roleId, ModelAndView model) {
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getSession().getAttribute(ParamConstants.USER_SESSION);
        Map<String, Object> map = roleService.deleteRole(roleId, user);
        model.addObject("msg", map);
        model.setViewName("role/updataMsg");
        return model;
    }

}
