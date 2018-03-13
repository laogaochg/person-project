package com.csair.admin.config;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @Author: LaoGaoChuang
 * @Date : 2018/3/13 16:05
 */
@Component
public class ScheduledWork {

    @Scheduled(cron = "0 */1 * * * ?")//0 */1 * * * ?
    private void updateBanaerCache() {
        System.out.println("-------------定时任务进行-------------------");
    }
}
