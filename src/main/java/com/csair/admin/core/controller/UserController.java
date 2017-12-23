package com.csair.admin.core.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csair.admin.config.PermissionName;
import com.csair.admin.config.PlatformException;
import com.csair.admin.core.po.core.ResponseEntity;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.core.query.UserQueryObject;
import com.csair.admin.core.service.UserService;
import com.csair.admin.util.EnvironmentParams;
import com.csair.admin.util.ParamConstants;
import com.csair.admin.util.PasswordUtils;
import com.csair.admin.util.ServletUtils;

@Controller
public class UserController {

    @Resource
    private UserService userService;
    private static Logger logger = LoggerFactory.getLogger(UserController.class);

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginForm(Model model) {
        model.addAttribute(ParamConstants.USER_SESSION, new User());
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam String username, @RequestParam String password, @RequestParam String verifyCode, RedirectAttributes attributes, HttpSession httpSession, ModelAndView model, HttpServletRequest request) {
        //判断验证码是否正确，并在页面提示
        if (!EnvironmentParams.isTestEnvironment()) {//测试环境不用验证验证码
            String code = httpSession.getAttribute("verifyCode") + "";
            if (!StringUtils.hasText(code) || !code.equalsIgnoreCase(verifyCode)) {
                attributes.addFlashAttribute("message", "验证码错误");
                return "redirect:/login";
            }
        }
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        Subject currentUser = SecurityUtils.getSubject();
        try {
            // 将调用MyShiroRealm.doGetAuthenticationInfo()方法
            currentUser.login(token);
            logger.info("-------------------------com.csair.admin.core.controller.UserController.login-------------------------------------------");
        } catch (Exception e) {
            if (e instanceof UnknownAccountException) {
                attributes.addFlashAttribute("message", "未知账户");
            } else if (e instanceof IncorrectCredentialsException) {
                attributes.addFlashAttribute("message", "密码不正确");
            } else if (e instanceof LockedAccountException) {
                attributes.addFlashAttribute("message", "账户已锁定");
            } else if (e instanceof ExcessiveAttemptsException) {
                attributes.addFlashAttribute("message", "用户名或密码错误次数超限");
            } else if (e instanceof PlatformException) {
                attributes.addFlashAttribute("message", ((PlatformException) e).getReturnMsg());
            } else if (e instanceof AuthenticationException) {
                attributes.addFlashAttribute("message", "对不起，你账号已经被禁止登录。");
            } else {
                attributes.addFlashAttribute("message", "用户名或密码不正确");
            }
            e.printStackTrace();
            token.clear();
            return "redirect:/login";
        }
        User user = (User) currentUser.getSession().getAttribute(ParamConstants.USER_SESSION);
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
        attributes.addFlashAttribute("message", "您已安全退出");
        return "redirect:/login";
    }


    //去修改密码页面
    @RequestMapping("/changePassword")
    @PermissionName("修改密码")
    public ModelAndView toChangePassword(UserQueryObject qo, ModelAndView model) {
        model.setViewName("user/changePassword");
        return model;
    }

    //修改密码
    @RequestMapping("/user/changePassword")
    @ResponseBody
    @PermissionName("修改密码")
    public ResponseEntity changePassword(String oldPassword, String newPassword, HttpServletRequest request) {
        User u = (User) request.getSession().getAttribute(ParamConstants.USER_SESSION);
        ResponseEntity e = new ResponseEntity();
        if (!PasswordUtils.checkPassword(oldPassword, u)) {
            e.setMes("原密码不正确。");
            return e;
        }
        userService.changePassword(oldPassword, newPassword, u);
        e.setCode(200);
        e.setMes("修改成功！");
        return e;
    }


}
