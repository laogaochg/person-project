package com.csair.admin.config;

import com.csair.admin.core.po.core.query.OperationLogQueryObject;
import com.csair.admin.core.service.OperationLogService;
import com.csair.admin.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @Author: LaoGaoChuang
 * @Date : 2018/3/13 16:05
 */
@Component
public class ScheduledWork {
    @Autowired
    private OperationLogService operationLogService;

    @Scheduled(cron = "0 */1 * * * ?")//0 */1 * * * ?
    private void updateBanaerCache() {
        System.out.println("-------------定时任务进行-------------------");
        operationLogService.pageQuery(new OperationLogQueryObject());
    }
}
