package com.csair.admin.util;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.BeanFactoryUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.mvc.condition.PatternsRequestCondition;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import com.csair.admin.dao.UserDao;
import com.csair.admin.po.UserQuery;
import com.csair.admin.service.PermissionService;

/**
 * laogaochg
 * 2017/7/6.
 */
@Component
public class SpringRefreshListener implements ApplicationListener<ContextRefreshedEvent> {
    @Autowired
    private PermissionService permissionService;
    @Value("${upload-path}")
    private String uploadPath;
    @Autowired
    private UserDao userDao;

    /**
     * springMVC启动加载权限
     *
     * @param event
     */
    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        //给EnvironmentParams.IMG_PATH加载常量
        if (uploadPath.endsWith("/")) {
            uploadPath = uploadPath.substring(0,uploadPath.length() - 1);
        }
        EnvironmentParams.IMG_PATH = uploadPath + EnvironmentParams.IMG_URL_PATH;//D:/tes/html/img
        //重载权限
        UserQuery qo = new UserQuery();
        System.out.println(userDao.selectByExample(qo));
//        reloadPermission(event);
        //配置SpringContextUtil的参数
        SpringContextUtil.applicationContext = event.getApplicationContext();
    }

    private void reloadPermission(ContextRefreshedEvent event) {
        if (event.getApplicationContext() instanceof WebApplicationContext) {
            Map<String,Method> patternMap = new HashMap<String,Method>();
            WebApplicationContext wc = (WebApplicationContext)event.getApplicationContext();
            //扫描所以的RequestMapping对应的方法；
            Map<String,HandlerMapping> requestMappings = BeanFactoryUtils.beansOfTypeIncludingAncestors(wc,HandlerMapping.class,true,false);
            for (HandlerMapping handlerMapping : requestMappings.values()) {
                if (handlerMapping instanceof RequestMappingHandlerMapping) {
                    RequestMappingHandlerMapping rmhm = (RequestMappingHandlerMapping)handlerMapping;
                    Map<RequestMappingInfo,HandlerMethod> handlerMethods = rmhm.getHandlerMethods();
                    for (RequestMappingInfo r : handlerMethods.keySet()) {
                        PatternsRequestCondition p = r.getPatternsCondition();
                        //url
                        Set<String> patterns = p.getPatterns();
                        for (String pattern : patterns) {
                            HandlerMethod m = handlerMethods.get(r);
                            Method method = m.getMethod();
                            patternMap.put(pattern.trim(),method);
                        }
                    }
                }
            }
            permissionService.reloadPermission(patternMap);
        }
    }
}
