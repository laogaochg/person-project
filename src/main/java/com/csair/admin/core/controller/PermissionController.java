package com.csair.admin.core.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.csair.admin.core.po.Brand;
import com.csair.admin.core.po.core.resp.DatagridForLayUI;
import com.csair.admin.util.ServletUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csair.admin.config.PlatformException;
import com.csair.admin.core.po.core.Menu;
import com.csair.admin.core.po.core.Permission;
import com.csair.admin.core.po.core.ResponseMessage;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.query.PermissionQueryObject;
import com.csair.admin.core.service.MenuService;
import com.csair.admin.core.service.PermissionService;
import com.csair.admin.core.service.RoleService;
import com.csair.admin.util.ParamConstants;

@Controller
@RequestMapping("/permission")
public class PermissionController {
    @Resource
    private PermissionService permissionService;
    @Resource
    private RoleService roleService;
    @Resource
    private MenuService menuService;

    @RequestMapping("/batchDelete")
    @ResponseBody
    public ResponseMessage batchDelete(Model model, Long[] ids, HttpServletRequest request) {
        ResponseMessage re = new ResponseMessage();
        User u = (User) request.getSession().getAttribute(ParamConstants.USER_SESSION);
        if (ids == null || ids.length == 0) {
            re.setCode(1);
            re.setMsg("请选择要操作的数据");
        }
        permissionService.batchDelete(ids, u);
        re.setCode(200);
        re.setMsg("删除成功");
        return re;
    }

    @RequestMapping("/editPermission")
    @ResponseBody
    public ResponseMessage editPermission(Model model, Permission permission, HttpServletRequest request) {
        ResponseMessage re = new ResponseMessage();
        User u = (User) request.getSession().getAttribute(ParamConstants.USER_SESSION);
        if (permission == null) {
            re.setCode(1);
            re.setMsg("请选择要操作的数据");
        }
        permissionService.editPermission(permission, u);
        re.setCode(200);
        re.setMsg("删除成功");
        return re;
    }

    @RequestMapping("/toEditPermission")
    public String toEditBrand(Model model, Long id, HttpServletRequest httpRequest) {
        if (id != null) model.addAttribute("item", permissionService.queryById(id));
        model.addAttribute("userMenus", ServletUtils.queryUserMenu());
        model.addAttribute("selectMenuIdForIntropect", ServletUtils.getSelectMenuId(httpRequest));
        return "setting/permission/editPermission";
    }

    @RequestMapping("/list")
    @ResponseBody
    public DatagridForLayUI<Permission> brandList(PermissionQueryObject qo) {
        PageResult<Permission> pageResult = permissionService.query(qo);
        return new DatagridForLayUI<>(pageResult);
    }

    /**
     * 去权限添加页面
     */
    @RequestMapping("/edit")
    public String queryPermission(Model model) {
        List<Permission> permissionList = permissionService.findAllPermission();
        model.addAttribute("permissionList", permissionList);
        model.addAttribute("p", permissionService.getNoPermissionRequestMapping());
        return "/role/editPermission";
    }

    /**
     * 权限添加菜单
     */
    @RequestMapping("/addMenu")
    @ResponseBody
    public ResponseMessage addMenu(Permission l, HttpServletRequest request) {
        ResponseMessage re = new ResponseMessage();
        User u = (User) request.getSession().getAttribute(ParamConstants.USER_SESSION);
        if (l.getId() == null) {
            permissionService.addPermission(l, u);
            re.setMsg("添加成功。");
        } else {
            permissionService.updatePermissionByPid(l, u);
            re.setMsg("修改成功。");
        }
        re.setCode(200);
        return re;
    }

    /**
     * 返回菜单权限列表
     */
    @RequestMapping("/menuPermission")
    public String qeuryPremission(Model model, PermissionQueryObject qo, HttpServletRequest httpRequest) {
        if (qo.getRoleId() == null) {
            throw new PlatformException(ParamConstants.ERROR_PARAM, "参数不正确");
        }
        //查询没有菜单的权限
//        List<Permission> permissionList = permissionService.queryNoMenuPermission();
//        model.addObject("permissionList",permissionList);
        //查询权限；按菜单的id归类并且查询菜单权限放在数组的第一个
        Map<String, List<Permission>> map = permissionService.queryAllPermissionSort();
        model.addAttribute("permissionMap", map);
        //查询角色
        model.addAttribute("role", roleService.queryById(qo.getRoleId()));
        //查询角色下的权限
        qo.setLimit(-1);
        PageResult pageResult = permissionService.query(qo);
        List<Permission> permissionList = pageResult.getListData();
        List<Long> ids = new ArrayList<Long>();
        for (Permission p : permissionList) {
            ids.add(p.getId());
        }
        //菜单查询
        List<Menu> menuList = menuService.getAllMenu(true, true);
        model.addAttribute("menuList", menuList);
        model.addAttribute("userMenus", ServletUtils.queryUserMenu());
        model.addAttribute("selectMenuIdForIntropect", ServletUtils.getSelectMenuId(httpRequest));
        model.addAttribute("havingPermissionIds", ids);
        return "role/PermissionList";
    }

}
