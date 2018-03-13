package com.csair.admin.config;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * web 层切面
 */
@Component
@Aspect
public class ControllerAspect {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 环绕通知
     */
    @Around(value = "execution(* com.csair.admin.core.controller.*Controller.*(..))")
    public Object controllerAround(ProceedingJoinPoint joinPoint) {
        Date startDate = new Date();
        Object[] args = joinPoint.getArgs();
        String simpleClassName = joinPoint.getTarget().getClass().getSimpleName();
        String method = joinPoint.getSignature().getName();
        MDC.put("intf", simpleClassName + "." + method);
//        logger.debug("call " + simpleClassName + "." + method + ", PARAMETER: " + getLog(args));
        Object result = null;
        try {
            result = joinPoint.proceed();
        } catch (Exception ex) {
            logger.error("unknow error , ", ex);
        } catch (Throwable throwable) {
            logger.error("call " + simpleClassName + "." + method + " , error: ", throwable);
        } finally {
            Date endDate = new Date();
            Long time = endDate.getTime() - startDate.getTime();
            logger.debug("call " + simpleClassName + "." + method + ", [" + time + "]ms, RESULT: " + result);
        }
        return result;
    }


}
