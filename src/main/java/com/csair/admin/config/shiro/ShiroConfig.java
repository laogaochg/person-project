package com.csair.admin.config.shiro;

import java.util.LinkedHashMap;

import javax.servlet.DispatcherType;

import com.csair.admin.config.shiro.AuthRealm;
import com.csair.admin.config.shiro.CredentialsMatcher;
import com.csair.admin.config.shiro.PermissionFilter;
import com.csair.admin.core.service.UserService;
import com.csair.admin.util.ServletUtils;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.DelegatingFilterProxy;

/**
 * Shiro配置
 */

@Configuration
public class ShiroConfig {


    /**
     * 配置核心安全事务管理器
     */
    @Bean(name = "securityManager")
    public DefaultWebSecurityManager defaultWebSecurityManager(AuthRealm authRealm) {
        DefaultWebSecurityManager manager = new DefaultWebSecurityManager();
        manager.setRealm(authRealm);
        manager.setCacheManager(cacheManager());
        //注入记住我管理器
        System.err.println("--------------shiro已经加载----------------");
        manager.setRememberMeManager(rememberMeManager());
        return manager;
    }


    /**
     * cache管理
     */
    @Bean
    public EhCacheManager cacheManager() {
        EhCacheManager cacheManager = new EhCacheManager();
        cacheManager.setCacheManagerConfigFile("classpath:shiro-ehcache.xml");
        ServletUtils.ehCacheManager=cacheManager;
        return cacheManager;
    }

    //配置自定义的权限登录器
    @Bean(name = "authRealm")
    public AuthRealm authRealm(@Qualifier("credentialsMatcher") CredentialsMatcher matcher) {
        AuthRealm authRealm = new AuthRealm();
        authRealm.setCredentialsMatcher(matcher);
        return authRealm;
    }

    //配置自定义的密码比较器
    @Bean(name = "credentialsMatcher")
    public CredentialsMatcher credentialsMatcher() {
        return new CredentialsMatcher();
    }

    @Bean(name = "lifecycleBeanPostProcessor")
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    @Bean
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator creator = new DefaultAdvisorAutoProxyCreator();
        creator.setProxyTargetClass(true);
        return creator;
    }

    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(DefaultWebSecurityManager manager) {
        AuthorizationAttributeSourceAdvisor advisor = new AuthorizationAttributeSourceAdvisor();
        advisor.setSecurityManager(manager);
        return advisor;
    }


    /**
     * 配置哪些需要认证
     */
    @Bean(name = "shiroFilter")
    public ShiroFilterFactoryBean shiroFilter(DefaultWebSecurityManager manager,UserService userService) {
        ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();
        bean.setSecurityManager(manager);
//        //把权限拦截器放进去
        PermissionFilter filter = new PermissionFilter();
        bean.getFilters().put("permissionFilter", filter);
        //配置登录的url和登录成功的url
        bean.setLoginUrl("/login");
        bean.setSuccessUrl("/index");
        bean.setUnauthorizedUrl("/404");
        //配置访问权限
        LinkedHashMap<String, String> filterChainMap = new LinkedHashMap<String, String>();
        /** -------------------静态文件------------------------------------------ */
        filterChainMap.put("/test/**", "anon");
        filterChainMap.put("/js/**", "anon");
        filterChainMap.put("/fonts/**", "anon");
        filterChainMap.put("/image/**", "anon");
        filterChainMap.put("/css/**", "anon");
        /** ------------------------------------------------------------- */
        filterChainMap.put("/login", "anon"); //表示可以匿名访问
        filterChainMap.put("/404", "anon"); //表示可以匿名访问
        filterChainMap.put("/uploadFile", "anon"); //表示可以匿名访问
        filterChainMap.put("/authImage", "anon"); //表示可以匿名访问
        filterChainMap.put("/unauthorizedException", "anon"); //表示可以匿名访问
        filterChainMap.put("/logout**", "anon");
        filterChainMap.put("/error**", "anon");
        filterChainMap.put("/weixing**", "anon");//微信路径可以匿名
        /** ------故我们用 authc 来校验一些关键操作，比如购买，我们可以采用user校验即可。而支付的时候，我们需要认证的用户，那就需要authc了。----------------------------------------------- */
        filterChainMap.put("/toPay**", "authc");//表示需要认证才可以访问
        filterChainMap.put("/**", "permissionFilter,user");//表示需要登陆才可以访问
        bean.setFilterChainDefinitionMap(filterChainMap);
        return bean;
    }


    /**
     * cookie对象;* rememberMeCookie()方法是设置Cookie的生成模版，比如cookie的name，cookie的有效时间等等。
     */
    @Bean
    public SimpleCookie rememberMeCookie() {
        //这个参数是cookie的名称，对应前端的checkbox的name = rememberMe
        SimpleCookie simpleCookie = new SimpleCookie("rememberMe");
        //<!-- 记住我cookie生效时间30天 ,单位秒;-->
        simpleCookie.setMaxAge(2592000);
        simpleCookie.setHttpOnly(true);
        return simpleCookie;
    }


    /**
     * cookie管理对象;
     * rememberMeManager()方法是生成rememberMe管理器，
     * 而且要将这个rememberMe管理器设置到securityManager中
     */
    @Bean(name = "rememberMeManager")
    public CookieRememberMeManager rememberMeManager() {
        //System.out.println("ShiroConfiguration.rememberMeManager()");
        CookieRememberMeManager cookieRememberMeManager = new CookieRememberMeManager();
        cookieRememberMeManager.setCookie(rememberMeCookie());
        //rememberMe cookie加密的密钥 建议每个项目都不一样 默认AES算法 密钥长度(128 256 512 位)
        cookieRememberMeManager.setCipherKey(Base64.decode("2AvVhdsgUs0FSA3SDFAdag=="));
        return cookieRememberMeManager;
    }


    /*** 过滤器配置，相当于web.xml里的过滤器设置 */
    @Bean
    public FilterRegistrationBean filterRegistrationBean() {
        FilterRegistrationBean filterRegistration = new FilterRegistrationBean();
        filterRegistration.setFilter(new DelegatingFilterProxy("shiroFilter"));
        filterRegistration.setEnabled(true);
        filterRegistration.addUrlPatterns("/*");
        filterRegistration.setDispatcherTypes(DispatcherType.REQUEST);
        return filterRegistration;
    }


}
