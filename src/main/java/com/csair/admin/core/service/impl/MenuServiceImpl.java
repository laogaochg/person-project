package com.csair.admin.core.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.csair.admin.core.dao.MenuDao;
import com.csair.admin.core.po.core.Role;
import com.csair.admin.core.po.core.query.MenuQuery;
import com.csair.admin.core.po.core.query.MenuQueryObject;
import com.csair.admin.core.po.core.resp.DatagridForLayUI;
import com.csair.admin.util.ParamConstants;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.csair.admin.core.service.OperationLogService;
import com.csair.admin.core.po.core.Menu;
import com.csair.admin.core.po.core.resp.MenuVo;
import com.csair.admin.core.po.core.Permission;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.service.MenuService;
import com.csair.admin.core.service.PermissionService;

import javax.annotation.Resource;

/**
 * Created by lenovo on 2017/6/27.
 */
@Service("menuService")
public class MenuServiceImpl implements MenuService {
    private static Logger logger = LoggerFactory.getLogger(MenuServiceImpl.class);
    @Resource
    private MenuDao menuDao;
    @Resource
    private PermissionService permissionService;
    @Resource
    private OperationLogService operationLogService;

    @Override
    public DatagridForLayUI<Menu> pageQueryMenu(MenuQueryObject qo) {
        DatagridForLayUI<Menu> result = new DatagridForLayUI<>();
        MenuQuery ex= new MenuQuery();
        if(StringUtils.hasText(qo.getKeyword())){
            ex.createCriteria().andMnameLike("%"+qo.getKeyword()+"%");
        }
        int i = menuDao.countByExample(ex);
        ex.setLimit(qo.getPageSize());
        ex.setPageNo(qo.getPage());
        List<Menu> menus = menuDao.selectByExample(ex);
        result.setData(menus);
        result.setCount(new Long(i));
        return result;
    }

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
    @Override
    public Menu queryMenuByUrl(String url) {
        MenuQuery ex = new MenuQuery();
        ex.createCriteria().andUrlEqualTo(url);
        List<Menu> menus = menuDao.selectByExample(ex);
        if (menus.size() > 0) {
            return menus.get(0);
        }else{
            return null;
        }
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
    public List<Menu> queryMenuInUrl(List<String> urls) {
        if (urls == null || urls.size() == 0) return null;
        MenuQuery ex = new MenuQuery();
        ex.createCriteria().andUrlIn(urls);
        return menuDao.selectByExample(ex);
    }

    @Override
    public List<MenuVo> queryAllMenuVo(Long selectId) {
        List<Menu> menus = getAllMenu(false, false);
        List<MenuVo> vo = new ArrayList<>();
        //选中节点的父id
        Long id =null;
        for (Menu m : menus) {
            MenuVo v = new MenuVo(m);
            vo.add(v);
            if(selectId!=null && selectId.equals(m.getMid())){
                v.setChecked(true);
                id=m.getPid();
            }
        }
        //选中节点的父父id
        Long ppId=null;
        for (Menu menu : menus) {
            if(id!=null && id.equals(menu.getMid())){
                ppId=menu.getPid();
            }
        }
        //父节点展开处理
        for (MenuVo menuVo : vo) {
//            if(id!=null && menuVo.getId().equals(id)){
//                menuVo.setOpen(true);
//            }
//            if(ppId!=null && menuVo.getId().equals(ppId)){
//                menuVo.setOpen(true);
//            }
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
        operationLogService.log(user.getId(), "删除菜单", "菜单id:" + m.getMid() + "；菜单名：" + m.getMname() + "；菜单的url：" + m.getUrl(), user.getLastIp());
        return i;
    }

    @Override
    public int editMenu(Menu m, User user) {
        logger.info("修改菜单：m" + m + "user:" + user);
        Menu oldMenu = queryMenu(m.getMid());
        oldMenu.setUrl(m.getUrl());
        if (StringUtils.hasText(m.getMname())) oldMenu.setMname(m.getMname());
        if (StringUtils.hasText(m.getLogoFileName())) oldMenu.setLogoFileName(m.getLogoFileName());
        if (null != m.getPid()) oldMenu.setPid(m.getPid());
        if (null != m.getState()) oldMenu.setState(m.getState());
        if (null != m.getSort()) oldMenu.setSort(m.getSort());
        menuDao.updateByPrimaryKeySelective(m);
        operationLogService.log(user.getId(), "修改菜单", "菜单id:" + m.getMid() + "；菜单名：" + m.getMname() + "；菜单的url：" + m.getUrl(), user.getLastIp());
        return 1;
    }

    @Override
    public Long addMenu(Menu m, User user) {
        logger.info("添加菜单：m" + m + "user:" + user);
        menuDao.insert(m);
        operationLogService.log(user.getId(), "添加菜单", "菜单id:" + m.getMid() + "；菜单名：" + m.getMname() + "；菜单的url：" + m.getUrl(), user.getLastIp());
        if(StringUtils.hasText(m.getUrl())){
            Permission p = new Permission();
            p.setName(m.getMname());
            p.setUrl(m.getUrl());
            p.setMid(m.getMid());
            permissionService.addPermission(p,user);
        }
        return m.getMid();
    }

    @Override
    public List<Menu> queryUserMenu() {
        return queryUserMenu(null);
    }

    @Override
    public List<Menu> queryUserMenu(Long userId) {
        if (userId == null) {
            Subject currentUser = SecurityUtils.getSubject();
            User user = (User) currentUser.getSession().getAttribute(ParamConstants.USER_SESSION);
            userId = user.getId();
        }
        //已经去重的菜单 权限直接对应的菜单
        List<Menu> permissionMenuIds = getMenuIds(userId);
        //记录根菜单
        List<Menu> rootMenus = new ArrayList<Menu>();
        Set<Long> midMenu = new HashSet<Long>();
        List<Menu> allMenu = menuDao.selectByExample(new MenuQuery());
        //每一个菜单都找到自己的根菜单；并把找过程的中间菜单记录下来
        for (Menu m : permissionMenuIds) {
            //找到根菜单，并给中间菜单集合添加内容
            Menu rootMenu = findRootMenu(m, midMenu, allMenu);
            boolean canAdd = true;
            for (Menu rm : rootMenus) {
                if (
                        rootMenu != null
                                && rm.getMid() != null
                                && rm.getMid().equals(rootMenu.getMid())) {
                    canAdd = false;
                }
            }
            if (canAdd && rootMenu != null) rootMenus.add(rootMenu);
        }
        //把中间菜单加进来；这样就全部了
        for (Long mid : midMenu) {
            Menu menu = queryShowMenuById(allMenu, mid);
            boolean canAdd = true;
            for (Menu m : permissionMenuIds) {
                if (menu != null && m.getMid().equals(mid)) {
                    canAdd = false;
                }
            }
            if (canAdd) permissionMenuIds.add(menu);
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
            getChildMenuByLimit(m, list);
        }
        return menuList;
    }

    /**
     * 查询子菜单返回排序好的列表
     *
     * @param mid  父菜单ID
     * @param list 限定的范围
     */
    private List<Menu> getChildMenuLimit(Long mid, List<Menu> list) {
        List<Menu> ms = new ArrayList<Menu>();
        for (Menu m : list) {
            if (mid.equals(m.getPid())) ms.add(m);
        }
        sortMenuList(ms);
        return ms;
    }

    private void sortMenuList(List<Menu> list) {
        //对子菜单进行排序
        list.sort(Comparator.comparingInt(Menu::getSort));
    }

    /**
     * 根据权限的url找到对应的菜单和没有url的菜单
     */
    private List<Menu> getMenuIds(Long userId) {
        List<String> urls = new ArrayList<>();
        List<Integer> mids =new ArrayList<>();
        for (Permission p : permissionService.queryPermissionByUserId(userId)) {
            if (StringUtils.hasText(p.getUrl())) {
                //一个权限可能对应多个URL
                Collections.addAll(urls, (p.getUrl().split("\\|\\|")));
            }
            mids.add(p.getId().intValue());
        }
        if (urls.size() == 0) return new ArrayList<>();
        MenuQuery qo = new MenuQuery();
        qo.createCriteria().andUrlIn(urls);
        List<Menu> menuList = menuDao.selectByExample(qo);
        MenuQuery qo1 = new MenuQuery();
        qo1.createCriteria().andMidIn(mids);
        menuList.addAll(menuDao.selectByExample(qo1));
        MenuQuery qos = new MenuQuery();
        qos.createCriteria().andUrlIsNull();
        menuList.addAll(menuDao.selectByExample(qos));
        //-------------去重-------------
        List<Menu> result = new ArrayList<>();
        Set<Long> ids = new HashSet<>();
        for (Menu menu : menuList) {
            if(ids.add(menu.getMid())){
                result.add(menu);
            }
        }
        return result;
    }

    /**
     * 每一个菜单都找到自己的根菜单；并把找过程的中间菜单记录下来
     *
     * @param midMenuIds 中间菜单
     */
    private Menu findRootMenu(Menu m, Set<Long> midMenuIds, List<Menu> allMenu) {
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

    /**
     * @param isTree 是否要树状结构
     */
    @Override
    public List<Menu> getAllMenu(boolean isTree, boolean getPermission) {
        MenuQuery ex = new MenuQuery();
        List<Menu> menus = menuDao.selectByExample(ex);
        ex.createCriteria().andPidIsNull();
        List<Menu> root = menuDao.selectByExample(ex);
        List<Permission> allPermission = getPermission ? permissionService.findAllPermission() : null;
        //排序
        sortMenuList(root);
        List<Menu> result = new ArrayList<>();
        for (Menu m : root) {
            getChildMenu(m, menus, allPermission, result);
        }
        if (isTree) {
            return root;
        } else {
            result.addAll(root);
            return result;
        }
    }

    /**
     * 递归得到所有子菜单
     * 给父菜单的子菜单赋值
     *
     * @param pm            父菜单 会给这个菜单的子菜单赋值
     * @param allMenu       所有菜单（缓存）
     * @param allPermission 所有权限可以为NULL
     */
    private void getChildMenu(Menu pm, List<Menu> allMenu, List<Permission> allPermission, List<Menu> addMenu) {
        List<Menu> menuList = new ArrayList<>();
        for (Menu m : allMenu) {
            if (pm.getMid().equals(m.getPid())) menuList.add(m);
        }
        sortMenuList(menuList);
        pm.getMenuList().addAll(menuList);
        addMenu.addAll(menuList);
        if (allPermission != null) {
            for (Permission p : allPermission) {
                if (pm.getMid().equals(p.getMid())) pm.getPermissionList().add(p);
            }
        }
        for (Menu m : menuList) {
            getChildMenu(m, allMenu, allPermission, addMenu);
        }
    }

}
