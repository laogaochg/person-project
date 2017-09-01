package com.csair.admin.controller;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csair.admin.dao.UserDao;
import com.csair.admin.po.PageResult;
import com.csair.admin.po.ResponseEntity;
import com.csair.admin.po.ReturnMessage;
import com.csair.admin.po.Role;
import com.csair.admin.po.User;
import com.csair.admin.po.UserQuery;
import com.csair.admin.po.UserQueryObject;
import com.csair.admin.po.UserVo;
import com.csair.admin.service.RoleService;
import com.csair.admin.service.UserService;
import com.csair.admin.util.EnvironmentParams;
import com.csair.admin.util.ParamConstants;
import com.csair.admin.util.PasswordUtils;
import com.csair.admin.util.PlatformException;
import com.csair.admin.util.ServletUtils;
import com.csair.admin.util.XlsFileUtil;
import jxl.write.WriteException;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private UserDao userDao;

    @RequestMapping(value = "/login1", method = RequestMethod.GET)
    public Object getAllUser() {
        UserQuery qo = new UserQuery();
        List<User> users = userDao.selectByExample(qo);
        System.out.println(users);
        return null;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginForm(Model model) {
        model.addAttribute(ParamConstants.USER_SESSION,new User());
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam String username,@RequestParam String password,@RequestParam String verifyCode,RedirectAttributes attributes,HttpSession httpSession,ModelAndView model,HttpServletRequest request) {
        //判断验证码是否正确，并在页面提示
        if (!EnvironmentParams.isTestEnvironment()) {//测试环境不用验证验证码
            String code = httpSession.getAttribute("verifyCode") + "";
            if (!StringUtils.hasText(code) || !code.equalsIgnoreCase(verifyCode)) {
                attributes.addFlashAttribute("message","验证码错误");
                return "redirect:/login";
            }
        }
        UsernamePasswordToken token = new UsernamePasswordToken(username,password);
        Subject currentUser = SecurityUtils.getSubject();
        try {
            // 将调用MyShiroRealm.doGetAuthenticationInfo()方法
            currentUser.login(token);
        } catch (Exception e) {
            if (e instanceof UnknownAccountException) {
                attributes.addFlashAttribute("message","未知账户");
            } else if (e instanceof IncorrectCredentialsException) {
                attributes.addFlashAttribute("message","密码不正确");
            } else if (e instanceof LockedAccountException) {
                attributes.addFlashAttribute("message","账户已锁定");
            } else if (e instanceof ExcessiveAttemptsException) {
                attributes.addFlashAttribute("message","用户名或密码错误次数超限");
            } else if (e instanceof PlatformException) {
                attributes.addFlashAttribute("message",((PlatformException)e).getReturnMsg());
            } else if (e instanceof AuthenticationException) {
                attributes.addFlashAttribute("message","对不起，你账号已经被禁止登录。");
            } else {
                attributes.addFlashAttribute("message","用户名或密码不正确");
            }
            e.printStackTrace();
            token.clear();
            return "redirect:/login";
        }
        User user = (User)currentUser.getSession().getAttribute(ParamConstants.USER_SESSION);
        user.setLastIp(ServletUtils.getIpAddress(request));
        user.setLastLoginTime(new Date());
        //更新用户的登陆信息
        userService.editUser(user);
        //验证
        if (currentUser.isAuthenticated()) {
            return "redirect:/index";
        } else {
            token.clear();
            return "redirect:/login";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(RedirectAttributes attributes) {
        SecurityUtils.getSubject().logout();
        attributes.addFlashAttribute("message","您已安全退出");
        return "redirect:/login";
    }

    //返回用户列表
    @RequestMapping("/user/list")
    public ModelAndView queryRole(UserQueryObject qo,ModelAndView model) {
        PageResult pageResult = userService.query(qo);
        model.addObject("pageResult",pageResult);
        model.setViewName("user/UserList");
        return model;
    }

    //去修改密码页面
    @RequestMapping("/changePassword")
    public ModelAndView toChangePassword(UserQueryObject qo,ModelAndView model) {
        model.setViewName("user/changePassword");
        return model;
    }

    //修改密码
    @RequestMapping("/user/changePassword")
    @ResponseBody
    public ResponseEntity changePassword(String oldPassword,String newPassword,HttpServletRequest request) {
        User u = (User)request.getSession().getAttribute(ParamConstants.USER_SESSION);
        ResponseEntity e = new ResponseEntity();
        if (!PasswordUtils.checkPassword(oldPassword,u)) {
            e.setMes("原密码不正确。");
            return e;
        }
        userService.changePassword(oldPassword,newPassword,u);
        e.setCode(200);
        e.setMes("修改成功！");
        return e;
    }

    //返回编辑用户页面roleService
    @RequestMapping("/user/toEditUser")
    public ModelAndView toEditUser(User us,ModelAndView model) {
        model.addObject("roleList",roleService.queryAllRole());
        model.addObject("user",SecurityUtils.getSubject().getSession().getAttribute(ParamConstants.USER_SESSION));
        model.setViewName("user/EditUser");
        if (null != us.getId()) {
            UserQueryObject qo = new UserQueryObject();
            qo.setId(us.getId());
            List<User> listData = userService.query(qo).getListData();
            if (listData.size() == 0) {
                return model;
            }
            User u = listData.get(0);
            model.addObject("editUser",u);
            List<Role> roles = roleService.queryRoleByUserId(u.getId());
            List<Long> roleIds = new ArrayList<Long>();
            for (Role role : roles) {
                roleIds.add(role.getId());
            }
            model.addObject("roleIds",roleIds);
        }
        return model;
    }

    //编辑用户
    @RequestMapping("/user/editUser")
    @ResponseBody
    public ResponseEntity<String> editUser(UserVo user) {
        Subject admin = SecurityUtils.getSubject();
        ResponseEntity<String> re = new ResponseEntity<>();
        //输入数据检查。
        if (user == null) {
            re.setCode(ParamConstants.ERROR_PARAM);
            re.setMes("用户参数不正确。");
            return re;
        }
        if (!StringUtils.hasText(user.getEmail())) {
            re.setCode(ParamConstants.ERROR_PARAM);
            re.setMes("用户邮箱不能为空。");
            return re;
        }
        if (!StringUtils.hasText(user.getPswd())) {
            re.setCode(ParamConstants.ERROR_PARAM);
            re.setMes("用户密码不能为空。");
            return re;
        }
        ReturnMessage message = userService.editUse(user,admin);
        if (!"200".equals(message.getCode())) {
            re.setCode(new Integer(message.getCode()));
            re.setMes(message.getMes());
        }
        return re;
    }

    //下载用户数据
    @RequestMapping("/user/downloadUser")
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
        List<Map<String,Object>> data = new ArrayList<Map<String,Object>>();
        UserQueryObject qo = new UserQueryObject();
        qo.setPageSize(-1);
        PageResult query = userService.query(qo);
        for (Object o : query.getListData()) {
            User u = (User)o;
            data.add(u.getUserData());
        }
        XlsFileUtil.getWorkbook(bos,titles,data);
        byte[] contentBytes = bos.toByteArray();
        String dfileName = new String(String.format("%s.xls","用户数据下载").getBytes("gb2312"),"iso8859-1");
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment",dfileName);
        return new org.springframework.http.ResponseEntity<byte[]>(contentBytes,headers,HttpStatus.CREATED);
    }

    /**
     * 取消禁止用户登陆
     *
     * @param id
     * @return
     */
    @RequestMapping("cancelForbidUserLogin")
    @ResponseBody
    public ResponseEntity<Object> cancelForbidUserLogin(Long id) {
        //前端验证
        ResponseEntity<Object> result = new ResponseEntity<>();
        if (id == null) {
            result.setCode(ParamConstants.ERROR_PARAM);
            result.setMes("id不能为空。");
            return result;
        }
        User user = ServletUtils.getUser();
        return userService.cancelForbidUserLogin(id,user);
    }

    /**
     * 禁止用户登陆
     *
     * @param id
     * @return
     */
    @RequestMapping("forbidUserLogin")
    @ResponseBody
    public ResponseEntity<Object> forbidUserLogin(Long id) {
        //前端验证
        ResponseEntity<Object> result = new ResponseEntity<>();
        if (id == null) {
            result.setCode(ParamConstants.ERROR_PARAM);
            result.setMes("id不能为空。");
            return result;
        }
        User user = ServletUtils.getUser();
        return userService.forbidUserLogin(id,user);
    }
}
