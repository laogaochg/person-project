package com.csair.admin.core.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.csair.admin.core.dao.MenuDao;
import com.csair.admin.core.po.core.MenuQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.csair.admin.core.service.OperationLogService;
import com.csair.admin.core.po.core.Menu;
import com.csair.admin.core.po.core.MenuVo;
import com.csair.admin.core.po.core.Permission;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.service.MenuService;
import com.csair.admin.core.service.PermissionService;

/**
 * Created by lenovo on 2017/6/27.
 */
@Service
public class MenuServiceImpl implements MenuService {
    private static Logger logger = LoggerFactory.getLogger(MenuServiceImpl.class);
    @Autowired
    private MenuDao menuDao;
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private OperationLogService operationLogService;

    @Override
    public List<Menu> queryParentMenus(String url) {
        Menu menu;
        MenuQuery ex = new MenuQuery();
        ex.createCriteria().andUrlEqualTo(url);
        List<Menu> menus = menuDao.selectByExample(ex);
        if (menus.size() > 0) {
            menu = menus.get(0);
        } else {
            menu = null;
        }
        List<Menu> ms = new ArrayList<>();
        if (menu != null) {
            ms.add(menu);
            queryRootMenu(menu, ms);
        }
        //倒序操作
        Collections.reverse(ms);
        return ms;
    }

    private List<Menu> queryRootMenu(Menu menu, List<Menu> ms) {
        Long pid = menu.getPid();
        if (pid != null && pid != 0) {
            Menu menu1 = queryMenu(pid);
            if (menu1 != null) {
                ms.add(menu1);
                return queryRootMenu(menu1, ms);
            }
        }
        return ms;
    }

    @Override
    public List<MenuVo> queryAllMenuVo(Long parentId) {
        MenuQuery ex = new MenuQuery();
        List<Menu> menus = menuDao.selectByExample(ex);
        List<MenuVo> vo = new ArrayList<MenuVo>();
        for (Menu m : menus) {
            MenuVo v = new MenuVo(m);
            vo.add(v);
            if (v.getId().equals(parentId)) {
                v.setChecked(true);
            }
        }
        return vo;
    }

    @Override
    public int deleteMenu(Long mid, User user) {
        logger.info("删除菜单：mid" + mid + "user:" + user);
        Menu m = queryMenu(mid);
        MenuQuery ex = new MenuQuery();
        ex.createCriteria().andMidEqualTo(mid);
        int i = menuDao.deleteByExample(ex);
        if (i != 0) {
            Long pid = permissionService.queryPermissionByMidAndMname(mid, "查看菜单:" + m.getMname());
            if (pid == null) return 0;
            operationLogService.log(user.getId(), "删除菜单", "菜单id:" + m.getMid() + "；菜单名：" + m.getMname() + "；菜单的url：" + m.getUrl(), user.getLastIp());
            return permissionService.deletePermissionByPid(pid);
        }
        return 0;
    }

    @Override
    public int editMenu(Menu m, User user) {
        logger.info("修改菜单：m" + m + "user:" + user);
        Menu oldMenu = queryMenu(m.getMid());
        Permission p = permissionService.findByNameMid("查看菜单:" + oldMenu.getMname(), oldMenu.getMid());
        if (StringUtils.hasText(m.getMname())) {
            oldMenu.setMname(m.getMname());
        }
        if (StringUtils.hasText(m.getLogoFileName())) {
            oldMenu.setLogoFileName(m.getLogoFileName());
        }
        oldMenu.setUrl(m.getUrl());
        if (null != m.getPid()) {
            oldMenu.setPid(m.getPid());
        }
        if (null != m.getState()) {
            oldMenu.setState(m.getState());
        }
        if (null != m.getSort()) {
            oldMenu.setSort(m.getSort());
        }
        menuDao.updateByPrimaryKeySelective(m);
        if (StringUtils.hasText(m.getMname()) && p != null) {
            p.setName("查看菜单:" + oldMenu.getMname());
            p.setMid(m.getMid());
            p.setUrl(m.getUrl());
            permissionService.updatePermissByPid(p, user);
            operationLogService.log(user.getId(), "修改菜单", "菜单id:" + m.getMid() + "；菜单名：" + m.getMname() + "；菜单的url：" + m.getUrl(), user.getLastIp());
        }
        return 1;
    }

    @Override
    public Long addMenu(Menu m, User user) {
        logger.info("添加菜单：m" + m + "user:" + user);
        menuDao.insert(m);
        Permission p = new Permission();
        p.setMid(m.getMid());
        p.setName("查看菜单:" + m.getMname());
        p.setUrl(m.getUrl());
        //添加权限
        Long pId = permissionService.addPermission(p, user);
        //维护admin角色的权限
        permissionService.addAdminPermission();
        operationLogService.log(user.getId(), "添加菜单", "菜单id:" + m.getMid() + "；菜单名：" + m.getMname() + "；菜单的url：" + m.getUrl(), user.getLastIp());
        return m.getMid();
    }

    @Override
    public List<Menu> queryUserMenu(Long userId) {
        //已经去重的菜单 权限直接对应的菜单
        List<Menu> permissionMenuIds = getMenuIds(userId);
        //记录根菜单
        List<Menu> rootMenus = new ArrayList<Menu>();
        Set<Long> midMenu = new HashSet<Long>();
        List<Menu> allMenu = menuDao.selectByExample(new MenuQuery());
        //每一个菜单都找到自己的根菜单；并把找过程的中间菜单记录下来
        for (Menu m : permissionMenuIds) {
            Menu rootMenu = findRootMenu(m, midMenu, allMenu);
            if (rootMenu != null) {
                boolean canAdd = true;
                for (Menu rm : rootMenus) {
                    if (rm.getMid().equals(rootMenu.getMid())) {
                        canAdd = false;
                    }
                }
                if (canAdd) rootMenus.add(rootMenu);
            }
        }
        //把中间菜单加进来；这样就全部了
        for (Long mid : midMenu) {
            Menu menu = null;
            menu = queryShowMenuById(allMenu, mid);
            if (menu != null) {
                boolean canAdd = true;
                for (Menu m : permissionMenuIds) {
                    if (m.getMid().equals(mid)) {
                        canAdd = false;
                    }
                }
                if (canAdd) permissionMenuIds.add(menu);
            }
        }
        //排序
        sortMenuList(rootMenus);
        //所有的根菜单在范围内找它们的子菜单
        for (Menu rootMenu : rootMenus) {
            getChildMenuByLimit(rootMenu, permissionMenuIds);
        }
        return rootMenus;
    }

    private Menu queryShowMenuById(List<Menu> allMenu, Long mid) {
        Menu menu = null;
        for (Menu m : allMenu) {
            if (Menu.STATE_SHOW.equals(m.getState()) && mid.equals(m.getMid())) {
                menu = m;
            }
        }
        return menu;
    }

    private List<Menu> getChildMenuByLimit(Menu pm, List<Menu> list) {
        List<Menu> menuList = getChildMenuLimit(pm.getMid(), list);
        pm.setMenuList(menuList);
        for (Menu m : menuList) {
            List<Menu> childMenu = getChildMenuByLimit(m, list);
        }
        return menuList;
    }

    /**
     * 查询子菜单返回排序好的列表
     *
     * @param mid  父菜单ID
     * @param list 限定的范围
     * @return
     */
    private List<Menu> getChildMenuLimit(Long mid, List<Menu> list) {
        List<Menu> ms = new ArrayList<Menu>();
        for (Menu m : list) {
            if (mid.equals(m.getPid())) {
                ms.add(m);
            }
        }
        sortMenuList(ms);
        return ms;
    }

    private void sortMenuList(List<Menu> list) {
        //对子菜单进行排序
        Collections.sort(list, Comparator.comparingInt(Menu::getSort));
    }

    private List<Menu> getMenuIds(Long userId) {
        List<Menu> permissionMenus = new ArrayList<Menu>();
        Set<Long> permissionMenuIds = new HashSet<Long>();
        List<Permission> userPermission = permissionService.queryPermissionByUserId(userId);
        for (Permission p : userPermission) {
            if (p.getMid() != null) permissionMenuIds.add(p.getMid());
        }
        List<Menu> allMenu = menuDao.selectByExample(new MenuQuery());
        for (Long id : permissionMenuIds) {
            Menu m = queryShowMenuById(allMenu, id);
            if (m != null) {
                permissionMenus.add(m);
            }
        }
        return permissionMenus;
    }

    /**
     * //每一个菜单都找到自己的根菜单；并把找过程的中间菜单记录下来
     *
     * @param m
     */
    private Menu findRootMenu(Menu m, Set<Long> midMenuIds, List<Menu> allMenu) {
        Menu rootMenu;
        if (m.getPid() == null || m.getPid() == 0L) {
            return m;
        } else {
            Menu midMenu = queryShowMenuById(allMenu, m.getPid());
            if (midMenu != null) {
                midMenuIds.add(midMenu.getMid());
                return findRootMenu(midMenu, midMenuIds, allMenu);
            }
            return null;
        }
    }

    @Override
    public Menu queryMenu(Long mid) {
        return menuDao.selectByPrimaryKey(mid);
    }

    @Override
    public List<Menu> getChildMenu(Long parentId) {
        MenuQuery ex = new MenuQuery();
        ex.createCriteria().andPidEqualTo(parentId);
        return menuDao.selectByExample(ex);
    }

    @Override
    public List<Menu> getAllMenu() {
        MenuQuery ex = new MenuQuery();
        List<Menu> menus = menuDao.selectByExample(ex);
        ex.createCriteria().andPidIsNull();
        List<Menu> root = menuDao.selectByExample(ex);
        List<Permission> allPermission = permissionService.findAllPermission();
        //排序
        sortMenuList(root);
        for (Menu m : root) {
            getChildMenu(m, menus, allPermission);
        }
        return root;
    }

    private List<Menu> getChildMenu(Menu pm, List<Menu> allMenu, List<Permission> allPermission) {
        List<Menu> menuList = new ArrayList<>();
        for (Menu m : allMenu) {
            if (pm.getMid().equals(m.getPid())) {
                menuList.add(m);
            }
        }
        sortMenuList(menuList);
        pm.getMenuList().addAll(menuList);
        for (Permission p : allPermission) {
            if (pm.getMid().equals(p.getMid())) {
                pm.getPermissionList().add(p);
            }
        }
        for (Menu m : menuList) {
            List<Menu> childMenu = getChildMenu(m, allMenu, allPermission);
        }
        return menuList;
    }

}
