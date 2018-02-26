package com.csair.admin.core.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.csair.admin.config.core.PermissionName;
import com.csair.admin.util.ServletUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.csair.admin.util.FileUploadUtils;
import com.csair.admin.util.ParamConstants;
import com.csair.admin.core.po.core.Menu;
import com.csair.admin.core.po.core.resp.MenuVo;
import com.csair.admin.core.po.core.ReturnMessage;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.service.MenuService;
import com.csair.admin.core.service.PermissionService;
import com.csair.admin.core.service.UserService;

/**
 * laogaochg
 * 2017/6/29.
 * 菜单管理
 */
@Controller
@RequestMapping("menu")
public class MenuController {
    @Resource
    private MenuService menuService;
    @Resource
    private PermissionService permissionService;
    @Resource
    private UserService userService;

    //返回菜单列表
    @RequestMapping("/list")
    @PermissionName("菜单查询")
    public ModelAndView queryMenu(ModelAndView model,HttpServletRequest httpRequest) {
        List<Menu> menusList = menuService.getAllMenu(true,false);
        model.addObject("menuList",menusList);
        model.setViewName("menu/menuList");
        model.addObject("userMenus", ServletUtils.queryUserMenu());
        model.addObject("selectMenuIdForIntropect", ServletUtils.getSelectMenuId(httpRequest));
        return model;
    }

    //返回菜单子列表
    @RequestMapping("/menuChild")
    @ResponseBody
    public List<MenuVo> queryChild(Long selectId,ModelAndView model) {
        List<MenuVo> allMenu = menuService.queryAllMenuVo(selectId);
        return allMenu;
    }
    //返回当前菜单的路径列表
    @RequestMapping("/queryParentMenus")
    @ResponseBody
    public List<Menu> queryParentMenus(String url) {
        List<Menu> allMenu = menuService.queryParentMenus(url);
        return allMenu;
    }

    /**
     * 编辑菜单
     */
    @RequestMapping("/edit")
    @PermissionName("管理菜单")
    public ModelAndView edit(Menu menu,ModelAndView model,HttpServletRequest request) {
        String fileUrl = FileUploadUtils.handlerFile(request);
        menu.setLogoFileName(fileUrl);
        Subject subject = SecurityUtils.getSubject();
        ReturnMessage msg = new ReturnMessage();
        msg.setToUrl("/menu/list");
        User user = (User)subject.getSession().getAttribute(ParamConstants.USER_SESSION);
        if (null == menu.getMid()) {//新建
            Long id = menuService.addMenu(menu,user);
            if (id != null) {
                msg.setMes("添加成功。");
            } else {
                msg.setMes("添加失败。");
            }
        } else {//修改
            int i = menuService.editMenu(menu,user);
            if (i != 0) {
                msg.setMes("修改成功。");
            }
        }
        user.setMenus(menuService.queryUserMenu(user.getId()));
        model.addObject("msg",msg);
        model.setViewName("common/updataMsg");
        return model;
    }


    /**
     * 删除菜单
     */
    @RequestMapping("/delete")
    @PermissionName("删除菜单")
    public ModelAndView deleteMenu(Long mid,ModelAndView model) {
        Subject subject = SecurityUtils.getSubject();
        ReturnMessage msg = new ReturnMessage();
        msg.setToUrl("/menu/list");
        User user = (User)subject.getSession().getAttribute(ParamConstants.USER_SESSION);
        if (null != mid) {
            int id = menuService.deleteMenu(mid,user);
            if (id != 0) {
                msg.setMes("删除成功。");
            } else {
                msg.setMes("删除失败。");
            }
        }
        model.addObject("msg",msg);
        model.setViewName("common/updataMsg");
        user.setMenus(menuService.queryUserMenu(user.getId()));
        return model;
    }

    /**
     * 添加菜单
     */
    @RequestMapping("/toEdit")
    @PermissionName("管理菜单")
    public ModelAndView toEdit(Menu menu,Integer flag,ModelAndView model,HttpServletRequest httpRequest) {
        //flag : 1：修改当前菜单 2:添加下级菜单 null:新修菜单
        if (flag == null) {//新建菜单
            model.addObject("parentMenu",menuService.queryMenu(menu.getMid()));
            model.setViewName("/menu/menuEdit");
        }
        if (flag == 1) {//flag : 1：修改当前菜单
            if (menu.getPid() != null) {
                Menu p = menuService.queryMenu(menu.getPid());
                model.addObject("parentMenu",p);
            }
            Menu c = menuService.queryMenu(menu.getMid());
            model.addObject("currentMenu",c);
            model.setViewName("/menu/menuEdit");
        }
        if (flag == 2) {//flag : 2:添加下级菜单
            model.addObject("parentMenu",menuService.queryMenu(menu.getMid()));
            model.setViewName("/menu/menuEdit");
        }
        Subject subject = SecurityUtils.getSubject();
        User user = (User)subject.getSession().getAttribute(ParamConstants.USER_SESSION);
        user.setMenus(menuService.queryUserMenu(user.getId()));
        model.addObject("userMenus", ServletUtils.queryUserMenu());
        model.addObject("selectMenuIdForIntropect", ServletUtils.getSelectMenuId(httpRequest));
        return model;
    }

}
