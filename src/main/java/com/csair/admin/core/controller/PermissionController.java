package com.csair.admin.core.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.csair.admin.util.PlatformException;
import com.csair.admin.core.po.core.Menu;
import com.csair.admin.core.po.core.Permission;
import com.csair.admin.core.po.core.ResponseEntity;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.PermissionQueryObject;
import com.csair.admin.core.service.MenuService;
import com.csair.admin.core.service.PermissionService;
import com.csair.admin.core.service.RoleService;
import com.csair.admin.util.ParamConstants;

@Controller
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private MenuService menuService;

    /**
     * 去权限添加页面
     */
    @RequestMapping("/edit")
    public String queryPermission(Model model) {
        List<Permission> permissionList = permissionService.findAllPermission();
        model.addAttribute("permissionList",permissionList);
        model.addAttribute("p",permissionService.getNoPermissionRequestMapping());
        return "/role/editPermission";
    }

    /**
     * 权限添加菜单
     */
    @RequestMapping("/addMenu")
    @ResponseBody
    public ResponseEntity addMenu(Permission l,HttpServletRequest request) {
        ResponseEntity re = new ResponseEntity();
        User u = (User)request.getSession().getAttribute(ParamConstants.USER_SESSION);
        if (l.getId() == null) {
            Long menusList = permissionService.addPermission(l,u);
            re.setMes("添加成功。");
        } else {
            permissionService.updatePermissByPid(l,u);
            re.setMes("修改成功。");
        }
        re.setCode(200);
        return re;
    }

    /**
     * 返回权限列表
     */
    @RequestMapping("/list")
//    @RequiresPermissions("权限查询")
    public ModelAndView qeuryPremission(ModelAndView model,PermissionQueryObject qo) {
        if (qo.getRoleId() == null) {
            throw new PlatformException(ParamConstants.ERROR_PARAM,"参数不正确");
        }
        //查询没有菜单的权限
        List<Permission> permissionList = permissionService.queryNoMenuPermission();
        model.addObject("permissionList",permissionList);
        //查询权限；按菜单的id归类并且查询菜单权限放在数组的第一个
        Map<String,List<Permission>> map = permissionService.queryAllPermissionSort();
        model.addObject("permissionMap",map);
        //查询角色
        model.addObject("role",roleService.queryById(qo.getRoleId()));
        //查询角色下的权限
        PageResult pageResult = permissionService.query(qo);
        permissionList = pageResult.getListData();
        List<Long> ids = new ArrayList<Long>();
        for (Permission p : permissionList) {
            ids.add(p.getId());
        }
        //菜单查询
        List<Menu> menuList = menuService.getAllMenu();
        model.addObject("menuList",menuList);
        model.addObject("havingPermissionIds",ids);
        model.setViewName("role/PermissionList");
        return model;
    }

}
