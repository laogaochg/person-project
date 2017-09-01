package com.csair.admin.oldDao;

import java.util.List;

import com.csair.admin.po.Menu;

/**
 * laogaochg
 * 2017/6/29.
 */
public interface MenuDao {
    /**
     * MenuDao、queryByRootMenu
     * 查询根菜单；菜单pid为null
     */
    List<Menu> queryByRootMenu();

    /**
     * 查询父菜单id为指定参数的菜单
     *
     * @param id
     * @return
     */
    List<Menu> queryChildMenuByPid(Long id);


    /**
     * 根据id查询对应的菜单
     */
    List<Menu> queryMenu(Long mid);

    /**
     * 新增菜单返回id
     * @param menu
     * @return
     */
    Long insert(Menu menu);

    /**
     * 修改菜单；只改有值的
     * @param menu
     * @return
     */
    int editMenuSelectByMenuId(Menu menu);

    /**
     * 删除菜单
     * @param mid
     * @return
     */
    int deleteMenu(Long mid);

    /**
     * 得到所有的菜单
     * @return
     */
    List<Menu> queryAllMenu();

    /**
     * 根据id查询菜单且菜单是可见的
     * @param mid
     * @return
     */
    Menu queryNoHiddenMenu(Long mid);

    /**
     * 根据项目名查询对应的菜单
     * @param url
     * @return
     */
    Menu queryMenuByUrl(String url);
}
