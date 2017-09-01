package com.csair.admin.oldDao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.csair.admin.oldDao.PermissionDao;
import com.csair.admin.oldDao.QueryData;
import com.csair.admin.po.Permission;
import com.csair.admin.po.PermissionQueryObject;
import com.csair.admin.util.DataSourceUtils;
import com.csair.admin.util.StringUtil;

@Repository
public class PermissionDaoImpl implements PermissionDao {

    public static final String baseSelect = "select p.id ,p.name ,p.url ,p.mid from e_admin_permission p ";
    @Autowired
    private DataSourceUtils dataSourceUtils;

    @Override
    public Long insertPermission(Permission p) {
        String sql = " INSERT INTO e_admin_permission ( name , url ,mid ) values ( ? , ? , ? ) ";
        List<Object> params = new ArrayList<Object>();
        params.add(StringUtil.getString(p.getName()));
        params.add(StringUtil.getString(p.getUrl()));
        params.add(null == p.getMid() ? 0 : p.getMid());
        return dataSourceUtils.insertGetId(sql,params.toArray());
    }

    @Override
    public List<Permission> queryAllPermission() {
        String sql = baseSelect + " where p.type IS NULL ";
        return dataSourceUtils.doSelectForList(sql,new BeanPropertyRowMapper<>(Permission.class));
    }

    @Override
    public int updatePermisssionByPid(Permission p) {
        String sql = " update e_admin_permission set url = ? ,  name = ? , mid = ? where id = ? ";
        return dataSourceUtils.update(sql,p.getUrl(),p.getName(),p.getMid(),p.getId());
    }

    @Override
    public Permission findByNameMid(String mname,Long mid) {
        String sql = baseSelect + " where p.name = ? and p.mid = ? AND p.type IS NULL ";
//        return dataSourceUtils.doSelectForList(getPermissionResultHandle(),sql,mname,mid).get(0);
        return dataSourceUtils.queryOne(new BeanPropertyRowMapper<>(Permission.class),sql,mname,mid);
    }

    @Override
    public int deleteRolePermissionByPid(Long pid) {
        String sql = " delete from e_admin_role_permission where pid = ? ";
        return dataSourceUtils.update(sql,pid);
    }

    @Override
    public Long deleteByMenuId(Long mid,String mname) {
        String sql = " select id from e_admin_permission where mid = ? and name  = ? and type IS NULL ";
        Long pid = dataSourceUtils.queryForObject(sql,Long.class,mid,mname);
        sql = " delete from e_admin_permission where mid = ? and name = ? AND type IS NULL";
        dataSourceUtils.update(sql,mid,mname);
        if (pid != 0) {
            return pid;
        }
        return 0L;
    }

    @Override
    public Long addPermission(Permission p) {
        String sql = "  insert into e_admin_permission ( url ,name , mid) values ( ? , ? , ? )";
        List<Object> l = new ArrayList<Object>();
        if (StringUtils.hasText(p.getUrl())) {
            l.add(p.getUrl());
        } else {
            l.add("");
        }
        if (StringUtils.hasText(p.getName())) {
            l.add(p.getName());
        } else {
            l.add("");
        }
        if (p.getMid() != null) {
            l.add(p.getMid());
        } else {
            l.add("");
        }
        return dataSourceUtils.insertGetId(sql,l.toArray());
    }

    @Override
    public List<Permission> queryPermissionByUserId(Long id) {
        String sql = " select p.id,p.mid,p.`name`,p.url from e_admin_user_role ur " + //
                "join e_admin_role_permission rp on ur.rid = rp.rid " + //
                "join e_admin_permission p on p.id = rp.pid " +//
                "where ur.uid = ? ORDER BY rp.pid ";
        return dataSourceUtils.doSelectForList(sql,new BeanPropertyRowMapper<>(Permission.class),id);
    }

    @Override
    public Integer insertPermissionRole(List<Long> rids,List<Long> ids) {
        StringBuilder sbd = new StringBuilder("       ");
        for (Long rid : rids) {
            for (Long pid : ids) {
                sbd.append(" ( " + rid + " , " + pid + " ) ,");
            }
        }
        String sql = " insert into e_admin_role_permission values " + sbd.substring(0,sbd.length() - 2);
        return dataSourceUtils.update(sql);
    }

    @Override
    public Integer updateMenu(Long menuId,Long permissionId) {
        String sql = " UPDATE  e_admin_permission set  mid  = ? where id =  ? AND type IS NULL ";
        return dataSourceUtils.update(sql,menuId,permissionId);
    }

    @Override
    public List<Permission> selectByMenuId(Long mid) {
        String sql = PermissionDaoImpl.baseSelect + "where p.mid =  ? AND type IS NULL  ";
        if (null == mid) {
            sql = PermissionDaoImpl.baseSelect + " where p.mid is null AND type IS NULL   ";
            return dataSourceUtils.doSelectForList(sql,new BeanPropertyRowMapper<>(Permission.class));
        }
        return dataSourceUtils.doSelectForList(sql,new BeanPropertyRowMapper<>(Permission.class),mid);
    }

    @Override
    public List<Permission> query(PermissionQueryObject qo) {
        QueryData qd = getQueryData(qo);
        String sql = qo.getSqlString() + qd.getConditionString();
        return dataSourceUtils.doSelectForList(sql,new BeanPropertyRowMapper<>(Permission.class),qd.getParamsList().toArray());
    }

    private QueryData getQueryData(PermissionQueryObject qo) {
        QueryData qd = new QueryData();
        List<Object> paramList = qd.getParamsList();
        StringBuilder sb = new StringBuilder(" where 1=1 ");
        if (qo.getRoleId() != null) {
            sb.append(" AND rp.rid = ? ");
            paramList.add(qo.getRoleId());
        }
        qd.setConditionString(sb.toString());
        return qd;
    }

}
