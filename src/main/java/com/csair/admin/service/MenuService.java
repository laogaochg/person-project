package com.csair.admin.service;

/**
 * Created by lenovo on 2017/6/27.
 */

import java.util.List;

import com.csair.admin.po.core.Menu;
import com.csair.admin.po.core.MenuVo;
import com.csair.admin.po.core.User;

/**
 * 菜单
 */
public interface MenuService {
    /**
     * 查询用户的菜单
     * 权限关连菜单；
     * 用户的有权限的菜单都查出来；
     */
    List<Menu> queryUserMenu(Long userId );
    /**
     * 得到所有菜单
     */
    List<Menu> getAllMenu();

    /**
     * 根据id查询藤
     * @param mid
     * @return
     */
    Menu queryMenu(Long mid);

    /**
     * 查询子菜单
     * @param parentId
     * @return
     */
    List<Menu> getChildMenu(Long parentId);


    /**
     * 添加菜单 返回新增ID
     * @param menu
     * @param user
     * @return
     */
    Long addMenu(Menu menu,User user);

    /**
     * 修改菜单
     * @param menu
     * @param user
     * @return
     */
    int editMenu(Menu menu,User user);

    /**
     * 删除菜单
     * @param mid
     * @param user
     * @return
     */
    int deleteMenu(Long mid,User user);

    /**
     * 得到所有的菜单
     * @return
     */
    List<MenuVo> queryAllMenuVo(Long parentId);

    /**
     * 得到当前菜单的路径
     * @param url 当前菜单的url
     */
    List<Menu> queryParentMenus(String url);
}
