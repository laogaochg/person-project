package com.csair.admin.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.csair.admin.oldDao.RoleDao;
import com.csair.admin.oldDao.UserDao1;
import com.csair.admin.po.PageResult;
import com.csair.admin.po.ResponseEntity;
import com.csair.admin.po.ReturnMessage;
import com.csair.admin.po.Role;
import com.csair.admin.po.RoleQueryObject;
import com.csair.admin.po.User;
import com.csair.admin.po.UserQueryObject;
import com.csair.admin.po.UserVo;
import com.csair.admin.service.MenuService;
import com.csair.admin.service.OperationLogService;
import com.csair.admin.service.UserService;
import com.csair.admin.util.EnvironmentParams;
import com.csair.admin.util.ParamConstants;
import com.csair.admin.util.PasswordUtils;
import com.csair.admin.util.PlatformException;
import com.csair.admin.util.VerifyCodeUtils;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao1 userDao;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private MenuService menuService;
    @Autowired
    private OperationLogService operationLogService;

    private static Logger logger = LoggerFactory.getLogger(RoleServiceImpl.class);

    @Override
    public ResponseEntity<Object> cancelForbidUserLogin(Long id,User user) {
        ResponseEntity<Object> re = new ResponseEntity<>();
        User u = queryUserById(id);
        if (u == null) {
            re.setCode(ParamConstants.ERROR_PARAM);
            re.setMes("用户不存在。");
            return re;
        }
        u.setStatus(User.STATUS_VALID);
        userDao.upDateSelect(u);
        operationLogService.log(user.getId(),"开放用户登录","用户ID：" + u.getId(),user.getLastIp());
        re.setMes("开放该用户登录成功。");
        return re;
    }

    @Override
    public ResponseEntity<Object> forbidUserLogin(Long id,User user) {
        List<Role> roles = roleDao.queryRoleByUserId(id);
        ResponseEntity<Object> re = new ResponseEntity<>();
        User u = queryUserById(id);
        if (u == null) {
            re.setCode(ParamConstants.ERROR_PARAM);
            re.setMes("用户不存在。");
            return re;
        }
        for (Role r : roles) {
            //如果禁止的用户有超级管理员的角色那么只有超级管理员才能禁止
            if (Role.ADMIN.equals(r.getType())) {
                boolean operaterHasAdminRole = false;
                for (Role role : user.getRoleList()) {
                    if (Role.ADMIN.equals(role.getType())) {
                        operaterHasAdminRole = true;
                    }
                }
                if (!operaterHasAdminRole) {
                    re.setCode(ParamConstants.ADMIN_ROLE_EDIT_FORBID);
                    re.setMes("禁止的用户有超级管理员的角色，只有超级管理员才能禁止。");
                    return re;
                }
            }
        }
        u.setStatus(User.STATUS_INVALID);
        userDao.upDateSelect(u);
        operationLogService.log(user.getId(),"禁止用户登录","用户ID：" + u.getId(),user.getLastIp());
        re.setMes("禁止用户登录成功。");
        return re;
    }

    @Override
    public int editUser(User user) {
        return userDao.upDateSelect(user);
    }

    @Override
    public int changePassword(String oldPassword,String newPassword,User u) {
        u.setPswd(PasswordUtils.getPassword(newPassword,u.getHashCode()));
        return userDao.upDateSelect(u);
    }

    public PageResult<User> query(UserQueryObject qo) {
        int totalCount = userDao.countPageQueryUser(qo);
        List<User> users = userDao.pageQueryUser(qo);
        return new PageResult<User>(users,totalCount,qo.getCurrentPage(),qo.getPageSize());
    }

    /**
     * 查询本平台的后台用户
     * 用户登陆认证
     */

    public User userLogin(String email) {
        String platFormFlag = EnvironmentParams.PLATFORM_FLAG;
        List<User> userList = userDao.queryUserForLogin(email,platFormFlag);
        if (userList.size() > 1) {
            logger.warn("查出来两个用户；数据出现异常。email:" + email + "platFormFlag:" + platFormFlag);
            throw new AuthenticationException("数据异常");
        } else if (userList.size() == 0) {
            throw new PlatformException(ParamConstants.NO_USER,"用户不存在");
        } else {
            User user = userList.get(0);
            if (User.STATUS_INVALID.equals(user.getStatus())) {
                throw new PlatformException(ParamConstants.FORDI_LOGIN,"对不起，你账号已经被禁止登录。");
            }
            user.setMenus(menuService.queryUserMenu(user.getId()));
            return user;
        }
    }

    public ReturnMessage editUse(UserVo vo,Subject admin) {
        ReturnMessage msg = new ReturnMessage();
        User user = (User)admin.getSession().getAttribute(ParamConstants.USER_SESSION);
        Long[] roleIds = vo.getRoleIds();
        //如果不是超级管理员；检查有没新增超级管理员
        if (!admin.hasRole(Role.ADMIN)) {
            RoleQueryObject qo = new RoleQueryObject();
            for (Long roleId : roleIds) {
                qo.setId(roleId);
                List<Role> listData = roleDao.pageQueryRole(qo);
                if (listData.size() == 0) {
                    msg.setCode(ParamConstants.ERROR_PARAM + "");
                    msg.setMes("输入数据异常");
                    return msg;
                }
                Role role = listData.get(0);
                //如果发现传过来有超级管理员且操作者不是超级管理员
                if (Role.ADMIN.equalsIgnoreCase(role.getType())) {
                    msg.setCode(ParamConstants.ERROR_PARAM + "");
                    msg.setMes("你不是超级管理员；不能新建超级管理员角色");
                    return msg;
                }
            }
        }
        //不是超级管理员不能删除别人的超级管理员的角色
        if (!admin.hasRole(Role.ADMIN)) {
            List<Role> roles = roleDao.queryRoleByUserId(vo.getId());
            for (Role role : roles) {
                if (Role.ADMIN.equals(role.getType())) {
                    msg.setCode(ParamConstants.ERROR_PARAM + "");
                    msg.setMes("你不是超级管理员；不能修改其它超级管理员角色");
                    return msg;
                }
            }
        }
        if (vo.getId() == null) {
            //先查查看有没有邮箱重复
            if (!checkEmailNoRepeat(vo)) {
                msg.setCode(ParamConstants.EMAIL_REPEAT + "");
                msg.setMes("已经有了这个邮箱的用户，请尝试其它邮箱。");
                return msg;
            }
            //新增
            Long id = addUser(vo,roleIds);
            msg.setMes("新增成功");
            String content = "用户邮箱：" + vo.getEmail() + "；用户id：" + id;
            operationLogService.log(user.getId(),"新增用户",content,user.getLastIp());
        } else {//修改
            User u = queryUserById(vo.getId());
            if (u == null) {
                msg.setMes("参数异常！请确保你修改的用户是存在的！");
                return msg;
            }
            if (StringUtils.hasText(vo.getEmail())) u.setEmail(vo.getEmail());
            if (StringUtils.hasText(vo.getNickname())) u.setNickname(vo.getNickname());
            if (StringUtils.hasText(vo.getPswd())) u.setPswd(vo.getPswd());
            if (StringUtils.hasText(vo.getRemark())) u.setRemark(vo.getRemark());
            if (null != vo.getState()) u.setStatus(vo.getState());
            userDao.upDateSelect(u);
            upDateUserRole(vo);
            msg.setMes("编辑成功");
            String content = "用户邮箱：" + vo.getEmail() + "；用户id：" + vo.getId();
            operationLogService.log(user.getId(),"修改用户",content,user.getLastIp());
        }
        msg.setCode("200");
        return msg;
    }

    public User queryUserById(Long id) {
        UserQueryObject qo = new UserQueryObject();
        qo.setId(id);
        List<User> users = userDao.pageQueryUser(qo);
        return users.size() == 0 ? null : users.get(0);
    }

    /**
     * 修改用户时；修改用户的角色
     */
    private int upDateUserRole(UserVo vo) {
        Long[] a = vo.getRoleIds();
        List<Long> newRoleIds;
        if (a == null) {
            newRoleIds = new ArrayList<Long>();
        } else {
            newRoleIds = new ArrayList<Long>(Arrays.asList(a));
        }
        List<Long> oldRoleIds = new ArrayList<Long>();
        List<Role> oldRoles = roleDao.queryRoleByUserId(vo.getId());
        for (Role oldRoleId : oldRoles) {
            oldRoleIds.add(oldRoleId.getId());
        }
        //需要新增的权限的ID集合
        List<Long> addRoleIds = new ArrayList<Long>();
        //需要删除的权限的ID集合
        List<Long> removeRoleIds = new ArrayList<Long>();
        for (Role old : oldRoles) {
            //如果旧的东西在新的里面没有；执行删除操作
            if (!newRoleIds.contains(old.getId())) removeRoleIds.add(old.getId());
        }
        for (Long newRoleId : newRoleIds) {
            //如果旧的东西里面没有新的id；执行添加操作
            if (!oldRoleIds.contains(newRoleId)) addRoleIds.add(newRoleId);
        }
        if (addRoleIds.size() > 0) roleDao.batchInsertUserRole(vo.getId(),addRoleIds);
        if (removeRoleIds.size() > 0) roleDao.removeUserRole(vo.getId(),removeRoleIds);
        return 1;
    }

    private Long addUser(UserVo vo,Long[] roleIds) {
        //插入用户
        User u = new User();
        u.setNickname(vo.getNickname());
        u.setEmail(vo.getEmail());
        String hashCode = VerifyCodeUtils.generateRandomCode(6);
        u.setHashCode(hashCode);
        String password = PasswordUtils.getPassword(vo.getPswd(),hashCode);
        u.setPswd(password);
        u.setCreateTime(new Date());
        u.setStatus(User.STATUS_VALID);
        u.setRemark(vo.getRemark());
        u.setType(User.PLATFORM);
        u.setPlatformFlag(EnvironmentParams.PLATFORM_FLAG);
        Long id = userDao.insertUser(u);
        //设置用户的角色
        if (roleIds != null && roleIds.length > 0) roleDao.batchInsertUserRole(id,Arrays.asList(roleIds));
        return id;
    }

    /**
     * 先查查看有没有邮箱重复
     * 重复返回flase
     * 没有重复返回true
     */
    private boolean checkEmailNoRepeat(UserVo vo) {
        UserQueryObject qo = new UserQueryObject();
        qo.setEmail(vo.getEmail());
        List<User> userList = userDao.pageQueryUser(qo);
        return userList == null || userList.size() == 0;
    }
}
