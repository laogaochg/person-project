package com.csair.admin.core.controller;

import java.util.HashMap;
import java.util.Map;

import com.csair.admin.core.po.core.Menu;
import com.csair.admin.core.po.core.ResponseMessage;
import com.csair.admin.core.po.core.query.UserQueryObject;
import com.csair.admin.core.po.core.resp.DatagridForLayUI;
import com.csair.admin.core.service.PermissionService;
import com.csair.admin.core.service.UserService;
import com.csair.admin.util.ServletUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.csair.admin.core.po.core.Role;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.query.RoleQueryObject;
import com.csair.admin.core.service.RoleService;
import com.csair.admin.util.ParamConstants;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 角色操作
 */
@Controller
@RequestMapping("/RoleManage")
public class RoleManageController {

    @Resource
    private RoleService roleService;
    @Resource
    private UserService userService;
    @Resource
    private PermissionService permissionService;

    //角色
    @RequestMapping(value = "/role", method = RequestMethod.GET)
    @ResponseBody
    public DatagridForLayUI<Role> role(RoleQueryObject qo) {
        PageResult<Role> query = roleService.query(qo);
        return new DatagridForLayUI<>(query);
    }

    //删除角色
    @RequestMapping(value = "/role", method = RequestMethod.DELETE)
    @ResponseBody
    public ResponseMessage<Object> deleteRole(Role qo) {
        ResponseMessage<Object> result = new ResponseMessage<>();
        User user = ServletUtils.getUser();
        int i = roleService.deleteRole(qo.getId(), user);
        if (i != 0) {
            result.setMsg("删除成功");
        } else {
            result.setMsg("删除失败");
        }
        return result;
    }

    //添加或者修改角色
    @RequestMapping(value = "/role", method = RequestMethod.POST)
    @ResponseBody
    public ResponseMessage<Object> addOrUpdataRole(Role role) {
        ResponseMessage<Object> result = new ResponseMessage<>();
        Subject subject = SecurityUtils.getSubject();
        Map<String, Object> map = roleService.add(role, subject);
        result.setMsg(map.get("mes") + "");
        return result;
    }


    /**
     * 编辑角色的权限
     */
    @RequestMapping("/editRolePermission")
    public ModelAndView editRolePermission(Long roleId, Long[] permissionIds, ModelAndView model, HttpServletRequest httpRequest) {
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
        model.addObject("userMenus", ServletUtils.queryUserMenu());
        model.addObject("selectMenuIdForIntropect", ServletUtils.getSelectMenuId(httpRequest));
        model.setViewName("role/updataMsg");
        return model;
    }

    //删除角色成员
    @RequestMapping("/removeRoleUser")
    public ModelAndView removeRoleUser(Long[] userIds, Long roleId, ModelAndView model, HttpServletRequest httpRequest) {
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
        model.addObject("userMenus", ServletUtils.queryUserMenu());
        model.addObject("selectMenuIdForIntropect", ServletUtils.getSelectMenuId(httpRequest));
        return model;
    }

    //返回角色列表
    @RequestMapping("/list")
    public ModelAndView queryRole(RoleQueryObject qo, ModelAndView model, HttpServletRequest httpRequest) {
        model.setViewName("RoleManage/list");
        return model;
    }

    /**
     * 查看角色成员账号
     */
    @RequestMapping("/userList")
    public ModelAndView queryUserByRole(UserQueryObject qo, ModelAndView model, HttpServletRequest httpRequest) {
        model.addObject("role", roleService.queryById(qo.getRoleId()));
//        qo.setPageSize(0);
        PageResult pageResult = userService.query(qo);
        model.addObject("pageResult", pageResult);
        model.setViewName("role/roleUserList");
        model.addObject("userMenus", ServletUtils.queryUserMenu());
        model.addObject("selectMenuIdForIntropect", ServletUtils.getSelectMenuId(httpRequest));
        return model;
    }

    //去编辑角色页面
    @RequestMapping("/inputRole")
    public ModelAndView inputRole(Long roleId, ModelAndView model, HttpServletRequest httpRequest) {
        if (roleId != null) {
            model.addObject("role", roleService.queryById(roleId));
        }
        model.addObject("userMenus", ServletUtils.queryUserMenu());
        model.addObject("selectMenuIdForIntropect", ServletUtils.getSelectMenuId(httpRequest));
        model.setViewName("role/inputRole");
        return model;
    }


}
