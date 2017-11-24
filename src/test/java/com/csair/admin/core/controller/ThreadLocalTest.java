package com.csair.admin.core.controller;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/11/24 15:16
 */
public class ThreadLocalTest {

    private static ExecutorService threadExecutor = Executors.newFixedThreadPool(1);
    private static final ThreadLocalHold threadLocalHold = new ThreadLocalHold();

    public static void main(String[] args) {
        threadLocalHold.getThreadLocal().set("aaaa");
        threadExecutor.submit(new Runnable() {
            @Override
            public void run() {
                System.out.println(threadLocalHold.getThreadLocal().get());
            }
        });
        threadExecutor.submit(new Runnable() {
            @Override
            public void run() {
                System.out.println(threadLocalHold.getThreadLocal().get());
            }
        });
        System.out.println(threadLocalHold.getThreadLocal().get());
        threadExecutor.shutdown();
    }

    public static class ThreadLocalHold {
        private static ThreadLocal<String> threadLocal = new ThreadLocal<>();

        public ThreadLocal<String> getThreadLocal() {
            return threadLocal;
        }

        public void setThreadLocal(ThreadLocal<String> threadLocal) {
            this.threadLocal = threadLocal;
        }
    }
}
