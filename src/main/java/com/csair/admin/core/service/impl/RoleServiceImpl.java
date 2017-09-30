package com.csair.admin.core.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.csair.admin.core.dao.RoleDao;
import com.csair.admin.core.po.core.RoleQuery;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.csair.admin.core.service.OperationLogService;
import com.csair.admin.core.po.core.Role;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.RoleQueryObject;
import com.csair.admin.core.service.RoleService;
import com.csair.admin.util.ParamConstants;
import com.csair.admin.util.StringUtil;

import javax.annotation.Resource;

@Service
public class RoleServiceImpl implements RoleService {
    private static Logger logger = LoggerFactory.getLogger(RoleServiceImpl.class);
    @Resource
    private RoleDao roleDao;
    @Resource
    private OperationLogService operationLogService;

    @Override
    public Role queryById(Long roleId) {
        return roleDao.selectByPrimaryKey(roleId);
    }

    @Override
    public int removeUserRole(Long userId, Long roleId) {
        return roleDao.removeUserRole(userId, roleId);
    }

    @Override
    public int addUserRole(Long userId, Long roleId) {
        return roleDao.addUserRole(userId, roleId);
    }

    @Override
    public List<Role> queryRoleByUserId(Long id) {
        return roleDao.queryRoleByUserId(id);
    }


    @Override
    public List<Role> queryAllRole() {
        RoleQuery e = new RoleQuery();
        return roleDao.selectByExample(e);
    }

    @Override
    public Map<String, Object> removeRoleUser(Long[] userIds, Long roleId, User user) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        List<String> ids = new ArrayList<String>();
        for (int i = 0; i < userIds.length; i++) {
            ids.add(userIds[i].toString());
        }
        Role role = roleDao.selectByPrimaryKey(roleId);
        int i = 1;
        for (Long userId : userIds) {
            removeUserRole(userId, roleId);
        }
        logger.debug("删除角色下用户:userId :" + user.getId());
        String content = "角色名字：" + role.getName() + "；被删除的用户的id" + StringUtil.join(ids, ",");
        operationLogService.log(user.getId(), "删除角色下用户", content, user.getLastIp());
        resultMap.put("mes", "删除成功");
        return resultMap;
    }


    @Override
    public Map<String, Object> deleteRole(Long roleId, User user) {
        Map<String, Object> map = new HashMap<String, Object>();
        logger.debug(user + "deleteRole ; and roleId = " + roleId);
        int i = roleDao.deleteByPrimaryKey(roleId);
        if (i == 0) {
            map.put("mes", "删除失败");
        } else {
            map.put("mes", "删除成功");
        }
        return map;
    }

    @Override
    public Map<String, Object> add(Role role, Subject subject) {
        User user = (User) subject.getSession().getAttribute(ParamConstants.USER_SESSION);
        Map<String, Object> map = new HashMap<String, Object>();
        if (Role.ADMIN.equalsIgnoreCase(role.getType()) && !subject.hasRole(Role.ADMIN)) {
            map.put("mes", "不能建立类型为admin的用户，你的权限不够！");
            return map;
        }
        if (role.getId() != null) {
            int i = roleDao.updateByPrimaryKey(role);
            if (i == 1) {
                String content = "角色id：" + role.getId() + "角色名字：" + role.getName();
                operationLogService.log(user.getId(), "修改角色", content, user.getLastIp());
                map.put("mes", "修改成功");
            } else {
                map.put("mes", "修改失败");
            }
        } else {
            //新增
            roleDao.insert(role);
            Long aLong = role.getId();
            map.put("mes", "新增成功");
            String content = "角色id：" + aLong + "角色名字：" + role.getName();
            operationLogService.log(user.getId(), "新增角色", content, user.getLastIp());
        }
        map.put("code", 0);
        return map;
    }

    @Override
    public PageResult query(RoleQueryObject qo) {
        RoleQuery ex = new RoleQuery();
        RoleQuery.Criteria criteria = ex.createCriteria();
        if (StringUtils.hasText(qo.getName())) {
            criteria.andNameEqualTo(qo.getName());
        }
        if (StringUtils.hasText(qo.getType())) {
            criteria.andTypeEqualTo(qo.getType());
        }
        List<Role> roles = roleDao.selectByExample(ex);
        int totalCount = roleDao.countByExample(ex);
        return new PageResult(roles, totalCount, qo.getCurrentPage(), qo.getPageSize());
    }

}
