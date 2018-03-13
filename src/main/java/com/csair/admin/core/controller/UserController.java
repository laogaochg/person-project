package com.csair.admin.core.controller;

import com.csair.admin.config.PlatformException;
import com.csair.admin.core.po.core.Menu;
import com.csair.admin.core.po.core.ResponseMessage;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.core.query.UserQueryObject;
import com.csair.admin.core.service.MenuService;
import com.csair.admin.core.service.OperationLogService;
import com.csair.admin.core.service.UserService;
import com.csair.admin.util.EnvironmentParams;
import com.csair.admin.util.LoggerUtils;
import com.csair.admin.util.ParamConstants;
import com.csair.admin.util.PasswordUtils;
import com.csair.admin.util.ServletUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {

    @Resource
    private UserService userService;
    private static Logger logger = LoggerFactory.getLogger(UserController.class);
    @Autowired
    private OperationLogService operationLogService;
    @Autowired
    private MenuService menuService;


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginForm(Model model, String returnUrl) {
        model.addAttribute(ParamConstants.USER_SESSION, new User());
        model.addAttribute("returnUrl", returnUrl);
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public ResponseMessage login(String username, String password,String verifyCode, String returnUrl,  HttpServletRequest request) {
        if(!StringUtils.hasText(returnUrl)){
            returnUrl="";
        }
        ResponseMessage msg= new ResponseMessage();
        msg.setData(returnUrl);
        msg.setCode(2);
        //判断验证码是否正确，并在页面提示
        if (!EnvironmentParams.isTestEnvironment()//测试环境不用验证验证码
         ) {
            String code = request.getSession().getAttribute("verifyCode") + "";
            if (!StringUtils.hasText(code) || !code.equalsIgnoreCase(verifyCode)) {
                msg.setMsg("验证码错误");
                return msg;
            }
        }
        boolean rememberMe = true;
        UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
        Subject currentUser = SecurityUtils.getSubject();
        try {
            // 将调用MyShiroRealm.doGetAuthenticationInfo()方法
            currentUser.login(token);
        } catch (Exception e) {
            String message;
            if (e instanceof UnknownAccountException) {
                message = "未知账户";
            } else if (e instanceof IncorrectCredentialsException) {
                message = "密码不正确";
            } else if (e instanceof LockedAccountException) {
                message = "账户已锁定";
            } else if (e instanceof ExcessiveAttemptsException) {
                message = "用户名或密码错误次数超限";
            } else if (e instanceof PlatformException) {
                message = ((PlatformException) e).getReturnMsg();
            } else if (e instanceof AuthenticationException) {
                message = "对不起，你账号已经被禁止登录。";
            } else {
                message = "用户名或密码不正确";
            }
            msg.setMsg(message);
            LoggerUtils.error(this.getClass(), "login.error"+e.getClass());
            token.clear();
            return msg;
        }
        User user = (User) currentUser.getSession().getAttribute(ParamConstants.USER_SESSION);
        user.setLastIp(ServletUtils.getIpAddress(request));
        user.setLastLoginTime(new Date());
        //更新用户的登陆信息
        userService.editUser(user);
        //验证
        if (currentUser.isAuthenticated()) {
            msg.setCode(200);
            return msg;
        } else {
            token.clear();
            return msg;
        }
    }


    @RequestMapping(value = "/toUrl")
    public String toUrl(String url) {
        return url;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(RedirectAttributes attributes) {
        SecurityUtils.getSubject().logout();
        attributes.addFlashAttribute("message", "您已安全退出");
        return "redirect:/login";
    }


    //得到用户权限对应的菜单
    @RequestMapping("/user/getMenus")
    @ResponseBody
    public List<Menu> getMenus() {
        Subject currentUser = SecurityUtils.getSubject();
        User user = (User) currentUser.getSession().getAttribute(ParamConstants.USER_SESSION);
        return menuService.queryUserMenu(user.getId());
    }


    //去修改密码页面
    @RequestMapping("/changePassword")
    public ModelAndView toChangePassword(UserQueryObject qo, ModelAndView model) {
        model.setViewName("user/changePassword");
        model.addObject("userMenus", menuService.queryUserMenu());
        return model;
    }

    //修改密码
    @RequestMapping("/user/changePassword")
    @ResponseBody
    public ResponseMessage changePassword(String oldPassword, String newPassword, HttpServletRequest request) {
        User u = (User) request.getSession().getAttribute(ParamConstants.USER_SESSION);
        ResponseMessage e = new ResponseMessage();
        if (!PasswordUtils.checkPassword(oldPassword, u)) {
            e.setMsg("原密码不正确。");
            return e;
        }
        userService.changePassword(oldPassword, newPassword, u);
        e.setCode(200);
        e.setMsg("修改成功！");
        return e;
    }


}
