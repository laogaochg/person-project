package com.csair.admin.oldDao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.csair.admin.oldDao.QueryData;
import com.csair.admin.oldDao.RoleDao;
import com.csair.admin.po.Role;
import com.csair.admin.po.RoleQueryObject;
import com.csair.admin.po.RoleUserQueryObject;
import com.csair.admin.po.User;
import com.csair.admin.util.DataSourceUtils;

@Repository
public class RoleDaoImpl implements RoleDao {

    @Autowired
    private DataSourceUtils dataSourceUtils;

    @Override
    public int batchInsertUserRole(Long userId,List<Long> addRoleIds) {
        for (Long addRoleId : addRoleIds) {
            inserRoleAndUser(userId,addRoleId);
        }
        return 1;
    }

    @Override
    public int removeUserRole(Long userId,List<Long> addRoleIds) {
        String sql = " delete from e_admin_user_role where uid = ? and rid in ( " + StringUtils.collectionToDelimitedString(addRoleIds," , ") + " )";
        return dataSourceUtils.update(sql,userId);
    }

    public Integer inserRoleAndUser(Long id,Long roleId) {
        String sql = " INSERT INTO e_admin_user_role ( uid , rid) values ( ? , ? ) ";
        return dataSourceUtils.update(sql,id,roleId);
    }

    @Override
    public List<Role> queryRoleByUserId(Long id) {
        String sql = "select r.* from e_admin_user_role ur, e_admin_role r where ur.uid = ? and ur.rid = r.id";
        return dataSourceUtils.doSelectForList(sql,new BeanPropertyRowMapper<>(Role.class),id);
    }

    @Override
    public Long addRole(Role role) {
        String sql = " INSERT INTO e_admin_role ( NAME , TYPE , REMARK ) VALUES ( ? , ? , ? )";
        return dataSourceUtils.insertGetId(sql,role.getName(),role.getType(),role.getRemark());

    }

    @Override
    public Integer updateRole(Role role) {
        String sql = " UPDATE e_admin_role SET  name = ?  , type  = ? , remark = ?  where id = ? ";
        return dataSourceUtils.update(sql,role.getName(),role.getType(),role.getRemark(),role.getId());
    }

    @Override
    public Integer deleteRoleUser(Long roleId,List<String> ids) {
        String sql = " DELETE FROM e_admin_user_role WHERE rid = ? AND uid IN ( " + StringUtils.collectionToDelimitedString(ids," , ") + " ) ";
        return dataSourceUtils.update(sql,roleId);
    }

    @Override
    public Integer delete(Long roleId) {
        String sql = " DELETE FROM  e_admin_role  where id = ? ";
        return dataSourceUtils.update(sql,roleId);
    }

    @Override
    public Integer batchRemove(Long roleId,List<Long> removePermissionIds) {
        String sql = " delete from e_admin_role_permission where rid = ? AND pid IN ";
        return dataSourceUtils.update(sql + " ( " + StringUtils.collectionToDelimitedString(removePermissionIds," , ") + " ) ",roleId);
    }

    @Override
    public Integer batchInsert(Long roleId,List<Long> addPermissionIds) {
        String sql = " insert into e_admin_role_permission ( rid , pid ) values ";
        StringBuilder sb = new StringBuilder(sql);
        for (Long addPermissionId : addPermissionIds) {
            sb.append(" ( " + roleId + " , " + addPermissionId + " ) ,");
        }
        String s = sb.substring(0,sb.length() - 2);
        return dataSourceUtils.update(s);
    }

    @Override
    public List<Long> queryPermissionIdByRoleId(Long roleId) {
        String sql = " select pid from e_admin_role_permission where rid = ? ";
        return dataSourceUtils.query(sql,Long.class,roleId);
    }

    @Override
    public List<Role> queryAllRole() {
        String sql = "select id ,name ,type ,remark from e_admin_role where shop_id IS NULL ";
        return dataSourceUtils.doSelectForList(sql,new BeanPropertyRowMapper<>(Role.class));
    }

    @Override
    public Integer countUserByRole(RoleUserQueryObject qo) {
        QueryData qd = getRoleUserQueryData(qo);
        return dataSourceUtils.getTotalCount(qo.getCountSqlString() + qd.getConditionString(),qd.getParamsList().toArray());
    }

    @Override
    public List<User> pageQueryUserByRole(RoleUserQueryObject qo) {
        QueryData qd = getRoleUserQueryData(qo);
        List<Object> params = qd.getParamsList();
        String sql = qo.getSqlString() + qd.getConditionString() + " LIMIT ? , ? ";
        params.add(qo.getStartRow());
        params.add(qo.getPageSize());
        return dataSourceUtils.doSelectForList(sql,new BeanPropertyRowMapper<>(User.class),params.toArray());
    }

    private QueryData getRoleUserQueryData(RoleUserQueryObject qo) {
        StringBuilder sb = new StringBuilder(" where 1=1 ");
        QueryData qd = new QueryData();
        List<Object> paramList = qd.getParamsList();
        if (qo.getId() != null) {
            sb.append(" AND ur.rid = ? ");
            paramList.add(qo.getId());
        }
        if (StringUtils.hasText(qo.getKeyWord())) {
            sb.append(" AND u.name LIKE CONCAT('%',?,'%')");
            paramList.add(qo.getKeyWord());
        }
        qd.setConditionString(sb.toString());
        return qd;
    }

    @Override
    public Integer countPageQueryRole(RoleQueryObject qo) {
        QueryData qd = getRoleQueryOData(qo);
        List<Object> params = qd.getParamsList();
        return dataSourceUtils.getTotalCount(qo.getCountSqlString() + qo.getConditionString(),params.toArray());
    }

    @Override
    public List<Role> pageQueryRole(RoleQueryObject qo) {
        //条件查询所以角色
        QueryData qd = getRoleQueryOData(qo);
        List<Object> params = qd.getParamsList();
        String sql = qo.getSqlString() + qo.getConditionString() + " LIMIT ? , ? ";
        params.add(qo.getStartRow());
        params.add(qo.getPageSize());
        return dataSourceUtils.doSelectForList(sql,new BeanPropertyRowMapper<>(Role.class),params.toArray());
    }

    public QueryData getRoleQueryOData(RoleQueryObject qo) {
        StringBuilder sb = new StringBuilder(" where 1=1 AND r.shop_id IS NULL ");
        QueryData qd = new QueryData();
        List<Object> paramList = qd.getParamsList();

        if (qo.getId() != null) {
            sb.append(" AND r.id = ? ");
            paramList.add(qo.getId());
        }
        if (StringUtils.hasText(qo.getName())) {
            sb.append(" AND r.name = ? ");
            paramList.add(qo.getName());
        }
        if (StringUtils.hasText(qo.getType())) {
            sb.append(" AND r.type = ? ");
            paramList.add(qo.getType());
        }
        qd.setConditionString(sb.toString());
        return qd;
    }

}
