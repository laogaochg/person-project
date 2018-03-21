package com.csair.admin.config;

import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.springframework.aop.aspectj.AspectJExpressionPointcutAdvisor;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.interceptor.NameMatchTransactionAttributeSource;
import org.springframework.transaction.interceptor.RollbackRuleAttribute;
import org.springframework.transaction.interceptor.RuleBasedTransactionAttribute;
import org.springframework.transaction.interceptor.TransactionAttribute;
import org.springframework.transaction.interceptor.TransactionAttributeSource;
import org.springframework.transaction.interceptor.TransactionInterceptor;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * laogaochg
 * 2017/7/1.
 */
@Configuration
public class BeanConfig {



    @Bean
    public EmbeddedServletContainerCustomizer containerCustomizer() {
        return container -> {
            container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/404"));
            container.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/404"));
            container.addErrorPages(new ErrorPage(Throwable.class, "/404"));
        };
    }


}
