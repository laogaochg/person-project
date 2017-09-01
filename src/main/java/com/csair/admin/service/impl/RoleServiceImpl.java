package com.csair.admin.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.csair.admin.service.OperationLogService;
import com.csair.admin.oldDao.RoleDao;
import com.csair.admin.po.Role;
import com.csair.admin.po.User;
import com.csair.admin.po.PageResult;
import com.csair.admin.po.RoleQueryObject;
import com.csair.admin.po.RoleUserQueryObject;
import com.csair.admin.service.RoleService;
import com.csair.admin.util.ParamConstants;
import com.csair.admin.util.StringUtil;

@Service
public class RoleServiceImpl implements RoleService {
    private static Logger logger = LoggerFactory.getLogger(RoleServiceImpl.class);
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private OperationLogService operationLogService;

    @Override
    public List<Long> queryPermissionIdByRoleId(Long id) {
        return roleDao.queryPermissionIdByRoleId(id);
    }

    @Override
    public List<Role> queryRoleByUserId(Long id) {
        return roleDao.queryRoleByUserId(id);
    }

    @Override
    public Map<String,Object> editRolePermission(Long roleId,Long[] permissionIds,User user) {
        Map<String,Object> resultMap = new HashMap<String,Object>();
        List<Long> newPermissionIds = new ArrayList<Long>();
        Collections.addAll(newPermissionIds,permissionIds);
        logger.debug("操作人修改角色权限:userId:" + user.getId() + "roleId:" + roleId + "permissionIds" + newPermissionIds);
        RoleQueryObject qo = new RoleQueryObject();
        qo.setId(roleId);
        List<Role> query = roleDao.pageQueryRole(qo);
        for (Role role : query) {
            if (Role.ADMIN.equalsIgnoreCase(role.getType())) {
                resultMap.put("mes","超级管理员不能修改其权限。");
                return resultMap;
            }
        }
        List<Long> oldPermissionIds = roleDao.queryPermissionIdByRoleId(roleId);
        //需要新增的权限的ID集合
        List<Long> addPermissionIds = new ArrayList<Long>();
        //需要删除的权限的ID集合
        List<Long> removePermissionIds = new ArrayList<Long>();
        for (Long old : oldPermissionIds) {
            //如果旧的东西在新的里面没有；执行删除操作
            if (!newPermissionIds.contains(old)) {
                removePermissionIds.add(old);
            }
        }
        for (Long newPermissionId : newPermissionIds) {
            //如果旧的东西里面没有新的id；执行添加操作
            if (!oldPermissionIds.contains(newPermissionId)) {
                addPermissionIds.add(newPermissionId);
            }
        }
        if (addPermissionIds.size() > 0) {
            roleDao.batchInsert(roleId,addPermissionIds);
        }
        if (removePermissionIds.size() > 0) {
            roleDao.batchRemove(roleId,removePermissionIds);
        }
        StringBuilder sb = new StringBuilder("角色的id" + roleId);
        if (addPermissionIds.size() > 0) {
            String add = StringUtil.join(addPermissionIds,",");
            if (StringUtils.hasText(add)) {
                add = "；增加角色的id集合：" + add;
                sb.append(add);
            }
        }
        if (removePermissionIds.size() > 0) {
            String add = StringUtil.join(removePermissionIds,",");
            if (StringUtils.hasText(add)) {
                add = "；删除角色的id集合：" + add;
                sb.append(add);
            }
        }
        operationLogService.log(user.getId(),"修改角色权限",sb.toString(),user.getLastIp());
        resultMap.put("mes","保存成功！");
        return resultMap;
    }

    @Override
    public List<Role> queryAllRole() {
        return roleDao.queryAllRole();
    }

    @Override
    public Map<String,Object> removeRoleUser(Long[] userIds,Long roleId,User user) {
        Map<String,Object> resultMap = new HashMap<String,Object>();
        List<String> ids = new ArrayList<String>();
        for (int i = 0;i < userIds.length;i++) {
            ids.add(userIds[i].toString());
        }
        Role role = getRole(roleId);
        int i = roleDao.deleteRoleUser(roleId,ids);
        logger.debug("删除角色下用户:userId :" + user.getId());
        if (i == 0) {
            resultMap.put("mes","删除失败");
        } else {
            String content = "角色名字：" + role.getName() + "；被删除的用户的id" + StringUtil.join(ids,",");
            operationLogService.log(user.getId(),"删除角色下用户",content,user.getLastIp());
            resultMap.put("mes","删除成功");
        }
        return resultMap;
    }

    private Role getRole(Long roleId) {
        RoleQueryObject qo = new RoleQueryObject();
        qo.setId(roleId);
        PageResult l = query(qo);
        if (l.getListData().size() < 1) {
            return null;
        }
        return (Role)l.getListData().get(0);
    }

    @Override
    public PageResult queryUserByRole(RoleUserQueryObject qo) {
        Integer totalCount = roleDao.countUserByRole(qo);
        List<User> listData = roleDao.pageQueryUserByRole(qo);
        return new PageResult<User>(listData,totalCount,qo.getCurrentPage(),qo.getPageSize());
    }

    @Override
    public Map<String,Object> deleteRole(Long roleId,User user) {
        Map<String,Object> map = new HashMap<String,Object>();
        logger.debug(user + "deleteRole ; and roleId = " + roleId);
        int i = roleDao.delete(roleId);
        if (i == 0) {
            map.put("mes","删除失败");
        } else {
            map.put("mes","删除成功");
        }
        return map;
    }

    @Override
    public Map<String,Object> add(Role role,Subject subject) {
        User user = (User)subject.getSession().getAttribute(ParamConstants.USER_SESSION);
        Map<String,Object> map = new HashMap<String,Object>();
        if (Role.ADMIN.equalsIgnoreCase(role.getType()) && !subject.hasRole(Role.ADMIN)) {
            map.put("mes","不能建立类型为admin的用户，你的权限不够！");
            return map;
        }
        if (role.getId() != null) {
            int i = roleDao.updateRole(role);
            if (i == 1) {
                String content = "角色id：" + role.getId() + "角色名字：" + role.getName();
                operationLogService.log(user.getId(),"修改角色",content,user.getLastIp());
                map.put("mes","修改成功");
            } else {
                map.put("mes","修改失败");
            }
        } else {
            //新增
            Long aLong = roleDao.addRole(role);
            map.put("mes","新增成功");
            String content = "角色id：" + aLong + "角色名字：" + role.getName();
            operationLogService.log(user.getId(),"新增角色",content,user.getLastIp());
        }
        map.put("code",0);
        return map;
    }

    @Override
    public PageResult query(RoleQueryObject qo) {
        Integer totalCount = roleDao.countPageQueryRole(qo);
        List<Role> roles = roleDao.pageQueryRole(qo);
        return new PageResult(roles,totalCount,qo.getCurrentPage(),qo.getPageSize());
    }

}
