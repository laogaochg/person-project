package com.csair.admin.controller;

import java.util.HashMap;
import java.util.Map;

import com.csair.admin.po.UserQueryObject;
import com.csair.admin.service.PermissionService;
import com.csair.admin.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.csair.admin.po.Role;
import com.csair.admin.po.User;
import com.csair.admin.po.PageResult;
import com.csair.admin.po.RoleQueryObject;
import com.csair.admin.po.RoleUserQueryObject;
import com.csair.admin.service.RoleService;
import com.csair.admin.util.ParamConstants;

/**
 * 角色操作
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;
    @Autowired
    private UserService userService;
    @Autowired
    private PermissionService permissionService;

    /**
     * 编辑角色的权限
     */
    @RequestMapping("/editRolePermission")
//    @RequiresPermissions("角色权限编辑")
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
//    @RequiresPermissions("角色删除")
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
//    @RequiresPermissions("角色查询")
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
//    @RequiresPermissions("角色成员查询")
    public ModelAndView queryUserByRole(UserQueryObject qo, ModelAndView model) {
        model.addObject("role", roleService.queryById(qo.getRoleId()));
        qo.setPageSize(0);
        PageResult pageResult = userService.query(qo);
        model.addObject("pageResult", pageResult);
        model.setViewName("role/roleUserList");
        return model;
    }

    //去编辑角色页面
    @RequestMapping("/inputRole")
//    @RequiresPermissions("角色编辑")
    public ModelAndView inputRole(Long roleId, ModelAndView model) {
        if (roleId != null) {
            model.addObject("role", roleService.queryById(roleId));
        }
        model.setViewName("role/inputRole");
        return model;
    }

    //添加或者修改角色
    @RequestMapping("/addOrUpdataRole")
//    @RequiresPermissions("角色编辑")
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
//    @RequiresPermissions("角色删除")
    public ModelAndView deleteRole(Long roleId, ModelAndView model) {
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getSession().getAttribute(ParamConstants.USER_SESSION);
        Map<String, Object> map = roleService.deleteRole(roleId, user);
        model.addObject("msg", map);
        model.setViewName("role/updataMsg");
        return model;
    }

}
