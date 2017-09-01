package com.csair.admin.util;

import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

/**
 * laogaochg
 * 2017/7/26.
 */
@Component("workExecutorFactory")
public class WorkExecutorService {
    public final static WorkExecutorRepository wr = WorkExecutorRepository.getInstance();
    public final static String LOG_EXECUTOR_SERVICE = "WorkExecutorService";

    @PostConstruct
    private void initWorkExecutors() {
        ThreadPoolExecutor tpe = new ThreadPoolExecutor(2,3,0L,TimeUnit.SECONDS,//
                new LinkedBlockingQueue<>());
        wr.bind(WorkExecutorService.LOG_EXECUTOR_SERVICE,tpe);
    }

}
