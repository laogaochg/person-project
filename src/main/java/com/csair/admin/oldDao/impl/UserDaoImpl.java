package com.csair.admin.oldDao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.csair.admin.oldDao.QueryData;
import com.csair.admin.oldDao.UserDao1;
import com.csair.admin.po.User;
import com.csair.admin.po.UserQueryObject;
import com.csair.admin.util.DataSourceUtils;

@Repository
public class UserDaoImpl implements UserDao1 {
    @Autowired
    private DataSourceUtils dataSourceUtils;

    public static final String BASE_SELECT = "select u.id as id , u.nickname as nickname , u.email as email ," +//
            " u.pswd as pswd , u.create_time as create_time , u.last_login_time as last_login_time ," +//
            " u.status as status , u.mobile as mobile , u.wx_unionid as wxUnionId ," +//
            " u.last_ip as lastIp , u.remark as remark , u.type as type , u.shop_id as shopId ," +//
            " u.platform_flag as platFormFlag ,u.hash_code as hashCode from e_admin_user u ";

    public int updateByKey(User obj) {
        String sql = "update  e_admin_user set nickname = ? " +//
                ",email = ? ,pswd = ? ,create_time = ? ,last_login_time = ? " +//
                ",status = ? ,mobile = ? ,wx_unionid = ? ,last_ip = ? " +//
                ",remark = ? ,type = ? ,shop_id = ? ,platform_flag = ? , hash_code = ?  " +//
                "where id =  ? ";
        List<Object> params = new ArrayList<Object>();
        params.add(obj.getNickname());
        params.add(obj.getEmail());
        params.add(obj.getPswd());
        params.add(obj.getCreateTime());
        params.add(obj.getLastLoginTime());
        params.add(obj.getStatus());
        params.add(obj.getMobile());
        params.add(obj.getWxUnionid());
        params.add(obj.getLastIp());
        params.add(obj.getRemark());
        params.add(obj.getType());
        params.add(obj.getShopId());
        params.add(obj.getPlatformFlag());
        params.add(obj.getHashCode());
        params.add(obj.getId());
        return dataSourceUtils.update(sql,params.toArray());
    }

    @Override
    public int upDateSelect(User vo) {
        StringBuilder sb = new StringBuilder("UPDATE e_admin_user SET ");
        List<Object> params = new ArrayList<Object>();
        if (StringUtils.hasText(vo.getNickname())) {
            sb.append(" nickname = ? ,");
            params.add(vo.getNickname());
        }
        if (StringUtils.hasText(vo.getPswd())) {
            sb.append(" pswd = ? ,");
            params.add(vo.getPswd());
        }
        if (vo.getStatus() != null) {
            sb.append(" status = ? ,");
            params.add(vo.getStatus());
        }
        if (StringUtils.hasText(vo.getEmail())) {
            sb.append(" email = ? ");
            params.add(vo.getEmail());
        }
        if (StringUtils.hasText(vo.getRemark())) {
            params.add(vo.getRemark());
            sb.append(" remark = ? ");
        }
        sb.append(" WHERE ID = ? ");
        params.add(vo.getId());
        return dataSourceUtils.update(sb.toString(),params.toArray());
    }

    @Override
    public Long insertUser(User obj) {
        String sql = "insert into e_admin_user ( nickname,email,pswd,create_time," +//
                "last_login_time,status,mobile,wx_unionid,last_ip," +//
                "remark,type,shop_id,platform_flag ,hash_code )" + " values ( ?,?,?,?,?,?,?,?,?,?,?,?,? , ? ) ";
        List<Object> params = new ArrayList<Object>();
        params.add(obj.getNickname());
        params.add(obj.getEmail());
        params.add(obj.getPswd());
        params.add(obj.getCreateTime());
        params.add(obj.getLastLoginTime());
        params.add(obj.getStatus());
        params.add(obj.getMobile());
        params.add(obj.getWxUnionid());
        params.add(obj.getLastIp());
        params.add(obj.getRemark());
        params.add(obj.getType());
        params.add(obj.getShopId());
        params.add(obj.getPlatformFlag());
        params.add(obj.getHashCode());
        return dataSourceUtils.insertGetId(sql,params.toArray());
    }

    @Override
    public List<User> queryUserForLogin(String email,String platFormFlag) {
        String sql = BASE_SELECT + " where u.email = ? and u.platform_flag = ? ";
        return dataSourceUtils.query(sql,User.class,email,platFormFlag);
    }

    @Override
    public List<User> pageQueryUser(UserQueryObject qo) {
        QueryData qd = getQueryData(qo);
        List<Object> paramList = qd.getParamsList();
        if (qo.getPageSize() > 0) {
            List<Object> params = new ArrayList<>(paramList);
            params.add(qo.getStartRow());
            params.add(qo.getPageSize());
            return dataSourceUtils.query(BASE_SELECT + qd.getConditionString() + " LIMIT ? , ? ",User.class,params.toArray());
        } else {
            return dataSourceUtils.query(BASE_SELECT + qd.getConditionString(),User.class,paramList.toArray());
        }
    }

    private QueryData getQueryData(UserQueryObject qo) {
        QueryData qd = new QueryData();
        List<Object> paramList = qd.getParamsList();
        StringBuilder sb = new StringBuilder(" where 1=1 AND u.platform_flag = '" + User.PLATFORMFLAG+"'");
        if (qo.getId() != null) {
            sb.append(" AND u.id = ? ");
            paramList.add(qo.getId());
        }
        if (StringUtils.hasText(qo.getName())) {
            sb.append(" AND u.name = ? ");
            paramList.add(qo.getName());
        }
        if (StringUtils.hasText(qo.getEmail())) {
            sb.append(" AND u.email = ? ");
            paramList.add(qo.getEmail());
        }
        if (StringUtils.hasText(qo.getType())) {
            sb.append(" AND u.type = ? ");
            paramList.add(qo.getType());
        }
        if (StringUtils.hasText(qo.getKeyWord())) {
            sb.append(" AND ( u.nickname LIKE CONCAT('%',?,'%') " + "OR u.email LIKE CONCAT('%',?,'%') ) ");
            paramList.add(qo.getKeyWord());
            paramList.add(qo.getKeyWord());
        }
        qd.setConditionString(sb.toString());
        return qd;
    }

    @Override
    public int countPageQueryUser(UserQueryObject qo) {
        String sql = "select count(1) from e_admin_user u ";
        QueryData qd = getQueryData(qo);
        return dataSourceUtils.getTotalCount(sql + qd.getConditionString(),qd.getParamsList().toArray());

    }

}
