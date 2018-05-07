package com.csair.admin.core.service;

/**
 * Created by lenovo on 2017/6/27.
 */

import java.util.List;

import com.csair.admin.core.po.core.Menu;
import com.csair.admin.core.po.core.query.MenuQueryObject;
import com.csair.admin.core.po.core.resp.DatagridForLayUI;
import com.csair.admin.core.po.core.resp.MenuVo;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.vo.MenuZtreeVo;

/**
 * 菜单
 */
public interface MenuService {
    /**
     * 查询用户的菜单
     * 权限关连菜单；
     * 用户的有权限的菜单都查出来；
     * 传null 则通过shiro查出来
     */
    List<Menu> queryUserMenu(Long userId);
    List<Menu> queryUserMenu();

    /**
     * 根据id查询藤
     *
     * @param mid
     * @return
     */
    Menu queryMenu(Long mid);


    /**
     * 添加菜单 返回新增ID
     *
     * @param menu
     * @param user
     * @return
     */
    Long addMenu(Menu menu, User user);

    /**
     * 修改菜单
     *
     * @param menu
     * @param user
     * @return
     */
    int editMenu(Menu menu, User user);

    /**
     * 删除菜单
     *
     * @param mid
     * @param user
     * @return
     */
    int deleteMenu(Long mid, User user);

    /**
     * 得到所有的菜单
     *
     * @return
     */
    List<MenuZtreeVo> queryMenuZtreeVo(Long parentId , boolean onlyMenu,Long roleId);

    Menu queryMenuByUrl(String url);

    /**
     * 根据URL得到对应的菜单
     */
    List<Menu> queryMenuInUrl(List<String> urls);

    /**
     * 得到当前菜单的路径
     *
     * @param url 当前菜单的url
     */
    List<Menu> queryParentMenus(String url);

    /**
     * @param isTree 是否要树状结构
     * @return
     */
    List<Menu> getAllMenu(boolean isTree, boolean getPermission);

    DatagridForLayUI<Menu> pageQueryMenu(MenuQueryObject qo);

    Menu queryById(Long mid);
}
