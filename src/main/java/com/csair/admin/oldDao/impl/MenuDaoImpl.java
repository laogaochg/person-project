package com.csair.admin.oldDao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.csair.admin.oldDao.MenuDao;
import com.csair.admin.po.Menu;
import com.csair.admin.util.DataSourceUtils;

@Repository
public class MenuDaoImpl implements MenuDao {
    @Autowired
    private DataSourceUtils dataSourceUtils;

    private static final String baseSelectSql = "select mid as mid , mname as mname , pid as pid , url as url , state as state , sort as sort , rank as rank , logo_file_name as logoFileName from e_admin_menu";

    @Override
    public Menu queryMenuByUrl(String url) {
        String sql = baseSelectSql + " where  url = ? AND type IS NULL ";
        List<Menu> query = dataSourceUtils.query(sql,Menu.class,url);
        if (query.size() > 0) {
            return query.get(0);
        } else {
            return null;
        }
    }

    @Override
    public Menu queryNoHiddenMenu(Long mid) {
        return dataSourceUtils.queryOne(new BeanPropertyRowMapper<>(Menu.class),baseSelectSql + " where mid = ? AND state = ? AND type IS NULL  ",mid,Menu.STATE_SHOW);
    }

    @Override
    public List<Menu> queryAllMenu() {
        String sql = baseSelectSql + " where  type IS NULL ";
        return dataSourceUtils.doSelectForList(sql,new BeanPropertyRowMapper<>(Menu.class));

    }

    @Override
    public int deleteMenu(Long mid) {
        String sql = "delete from e_admin_menu where mid = ? AND type IS NULL  ";
        return dataSourceUtils.update(sql,mid);
    }

    @Override
    public int editMenuSelectByMenuId(Menu m) {
        StringBuilder sb = new StringBuilder(" update  e_admin_menu set ");
        List<Object> param = new ArrayList<Object>();
        if (StringUtils.hasText(m.getMname())) {
            sb.append(" mname = ? ,");
            param.add(m.getMname());
        }
        if (StringUtils.hasText(m.getLogoFileName())) {
            sb.append(" logo_file_name = ? ,");
            param.add(m.getLogoFileName());
        }
        if (StringUtils.hasText(m.getUrl())) {
            sb.append(" url = ? ,");
            param.add(m.getUrl());
        }
        if (null != m.getPid()) {
            sb.append(" pid = ? ,");
            param.add(m.getPid());
        }
        if (null != m.getState()) {
            sb.append(" state = ? ,");
            param.add(m.getState());
        }
        if (null != m.getSort()) {
            sb.append(" sort = ? ,");
            param.add(m.getSort());
        }
        String sql = sb.substring(0,sb.length() - 2) + " where mid = ? AND type IS NULL  ";
        param.add(m.getMid());
        return dataSourceUtils.update(sql,param.toArray());
    }

    @Override
    public Long insert(Menu m) {
        String sql = " insert into e_admin_menu ( * )values ( $ ) ";
        StringBuilder paramName = new StringBuilder(" ");
        List<Object> param = new ArrayList<Object>();
        if (StringUtils.hasText(m.getMname())) {
            paramName.append("  mname ");
            param.add(m.getMname());
        }
        if (StringUtils.hasText(m.getUrl())) {
            paramName.append("  , url ");
            param.add(m.getUrl());
        }
        if (StringUtils.hasText(m.getLogoFileName())) {
            paramName.append("  , logo_file_name ");
            param.add(m.getLogoFileName());
        }
        if (null != m.getPid()) {
            paramName.append(" , pid ");
            param.add(m.getPid());
        }
        if (null != m.getState()) {
            paramName.append(" , state ");
            param.add(m.getState());
        }
        if (null != m.getSort()) {
            paramName.append(" , sort ");
            param.add(m.getSort());
        }
        if (null != m.getRank()) {
            paramName.append(" , rank ");
            param.add(m.getRank());
        }
        List<String> s = new ArrayList<String>();
        for (Object o : param) {
            s.add("?");
        }
        sql = sql.replace("*",paramName).replace("$",StringUtils.collectionToDelimitedString(s," , "));
        return dataSourceUtils.insertGetId(sql,param.toArray());
    }

    @Override
    public List<Menu> queryMenu(Long mid) {
        String sql = baseSelectSql + " where mid = ? AND type IS NULL  ";
        return dataSourceUtils.doSelectForList(sql,new BeanPropertyRowMapper<>(Menu.class),mid);
    }

    public Long addMenu(Long pId,String name,String url) {
        String sql = " insert into e_admin_menu ( mname , pid , url )values ( ? , ? , ? ) ";
        return dataSourceUtils.insertGetId(sql,pId,name,url);
    }

    @Override
    public List<Menu> queryByRootMenu() {
        String sql = baseSelectSql + "  where pid is null AND type IS NULL  ";
        return dataSourceUtils.doSelectForList(sql,new BeanPropertyRowMapper<>(Menu.class));
    }

    @Override
    public List<Menu> queryChildMenuByPid(Long id) {
        String sql = baseSelectSql + "  where pid = ? AND type IS NULL  ";
        return dataSourceUtils.doSelectForList(sql,new BeanPropertyRowMapper<>(Menu.class),id);

    }

}
