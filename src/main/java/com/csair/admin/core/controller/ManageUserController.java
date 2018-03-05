package com.csair.admin.core.controller;

import com.csair.admin.config.PermissionName;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.ResponseMessage;
import com.csair.admin.core.po.core.ReturnMessage;
import com.csair.admin.core.po.core.Role;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.core.query.UserQueryObject;
import com.csair.admin.core.po.core.resp.UserVo;
import com.csair.admin.core.service.RoleService;
import com.csair.admin.core.service.UserService;
import com.csair.admin.util.ParamConstants;
import com.csair.admin.util.ServletUtils;
import com.csair.admin.util.XlsFileUtil;
import jxl.write.WriteException;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/10/18 14:25
 */
@Controller
public class ManageUserController {

    @Resource
    private UserService userService;
    @Resource
    private RoleService roleService;

    //编辑用户
    @RequestMapping("/user/editUser")
    @ResponseBody
    @PermissionName("编辑用户")
    public ResponseMessage<String> editUser(UserVo user) {
        Subject admin = SecurityUtils.getSubject();
        ResponseMessage<String> re = new ResponseMessage<>();
        //输入数据检查。
        if (user == null) {
            re.setCode(ParamConstants.ERROR_PARAM);
            re.setMsg("用户参数不正确。");
            return re;
        }
        if (!StringUtils.hasText(user.getEmail())) {
            re.setCode(ParamConstants.ERROR_PARAM);
            re.setMsg("用户邮箱不能为空。");
            return re;
        }
        if (!StringUtils.hasText(user.getPswd())) {
            re.setCode(ParamConstants.ERROR_PARAM);
            re.setMsg("用户密码不能为空。");
            return re;
        }
        ReturnMessage message = userService.editUse(user, admin);
        if (!"200".equals(message.getCode())) {
            re.setCode(new Integer(message.getCode()));
            re.setMsg(message.getMes());
        }
        return re;
    }

    //下载用户数据
    @RequestMapping("/user/downloadUser")
    @PermissionName("下载用户数据")
    public org.springframework.http.ResponseEntity<byte[]> downloadUser(HttpServletResponse response) throws Exception, WriteException {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        List<String> titles = new ArrayList<String>();
        titles.add("id");
        titles.add("昵称");
        titles.add("邮箱|登录账号");
        titles.add("创建时间");
        titles.add("最后登录时间");
        titles.add("登录IP");
        titles.add("备注");
        titles.add("状态");
        List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
        UserQueryObject qo = new UserQueryObject();
        qo.setLimit(-1);
        PageResult query = userService.query(qo);
        for (Object o : query.getListData()) {
            User u = (User) o;
            data.add(u.getUserData());
        }
        XlsFileUtil.getWorkbook(bos, titles, data);
        byte[] contentBytes = bos.toByteArray();
        String dfileName = new String(String.format("%s.xls", "用户数据下载").getBytes("gb2312"), "iso8859-1");
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", dfileName);
        return new org.springframework.http.ResponseEntity<byte[]>(contentBytes, headers, HttpStatus.CREATED);
    }

    /**
     * 取消禁止用户登陆
     *
     * @param id
     * @return
     */
    @RequestMapping("cancelForbidUserLogin")
    @ResponseBody
    @PermissionName("解禁用户登陆")
    public ResponseMessage<Object> cancelForbidUserLogin(Long id) {
        //前端验证
        ResponseMessage<Object> result = new ResponseMessage<>();
        if (id == null) {
            result.setCode(ParamConstants.ERROR_PARAM);
            result.setMsg("id不能为空。");
            return result;
        }
        User user = ServletUtils.getUser();
        return userService.cancelForbidUserLogin(id, user);
    }

    /**
     * 禁止用户登陆
     *
     * @param id
     * @return
     */
    @RequestMapping("forbidUserLogin")
    @ResponseBody
    @PermissionName("禁止用户登陆")
    public ResponseMessage<Object> forbidUserLogin(Long id) {
        //前端验证
        ResponseMessage<Object> result = new ResponseMessage<>();
        if (id == null) {
            result.setCode(ParamConstants.ERROR_PARAM);
            result.setMsg("id不能为空。");
            return result;
        }
        User user = ServletUtils.getUser();
        return userService.forbidUserLogin(id, user);
    }

    //返回编辑用户页面roleService
    @RequestMapping("/user/toEditUser")
    @PermissionName("新建用户")
    public ModelAndView toEditUser(User us, ModelAndView model) {
        model.addObject("roleList", roleService.queryAllRole());
        model.addObject("user", SecurityUtils.getSubject().getSession().getAttribute(ParamConstants.USER_SESSION));
        model.setViewName("user/EditUser");
        if (null != us.getId()) {
            UserQueryObject qo = new UserQueryObject();
            qo.setId(us.getId());
            List<User> listData = userService.query(qo).getListData();
            if (listData.size() == 0) {
                return model;
            }
            User u = listData.get(0);
            model.addObject("editUser", u);
            List<Role> roles = roleService.queryRoleByUserId(u.getId());
            List<Long> roleIds = new ArrayList<Long>();
            for (Role role : roles) {
                roleIds.add(role.getId());
            }
            model.addObject("roleIds", roleIds);
        }
        return model;
    }

    //返回用户列表
    @RequestMapping("/user/list")
    @PermissionName("查询所有用户")
    public ModelAndView queryRole(UserQueryObject qo, ModelAndView model, HttpServletRequest httpRequest) {
        PageResult pageResult = userService.query(qo);
        model.addObject("pageResult", pageResult);
        model.setViewName("user/UserList");
        model.addObject("userMenus", ServletUtils.queryUserMenu());
        model.addObject("selectMenuIdForIntropect", ServletUtils.getSelectMenuId(httpRequest));
        return model;
    }
}
