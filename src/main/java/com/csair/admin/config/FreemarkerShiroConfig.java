package com.csair.admin.config;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

import com.jagregory.shiro.freemarker.ShiroTags;
import freemarker.template.Configuration;

/**
 * freemaker集成shiro标签
 */
@Component
public class FreemarkerShiroConfig implements InitializingBean {


    @Qualifier("freeMarkerConfiguration")
    @Autowired
    private Configuration configuration;

    @Autowired
    private FreeMarkerViewResolver resolver;

    @Override
    public void afterPropertiesSet() throws Exception {
        //可以在页面上使用shiro标签
        configuration.setSharedVariable("shiro", new ShiroTags());
        //可以在页面上用${context.contextPath}获取contextPath
        resolver.setRequestContextAttribute("context");
    }
}
