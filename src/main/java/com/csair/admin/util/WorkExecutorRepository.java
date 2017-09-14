package com.csair.admin.util;

import java.util.Collection;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * User: DENGQING002
 * Date: 13-12-9
 * Time: 下午3:55
 * 异步调用任务仓库
 */
public class WorkExecutorRepository {

    private final ConcurrentHashMap<String, ThreadPoolExecutor> executors;

    private WorkExecutorRepository() {
        executors = new ConcurrentHashMap<String, ThreadPoolExecutor>();
    }

    /**
     * 延迟初始化单例模式
     */
    private static class SingletonHandler {
        final static WorkExecutorRepository INSTANCE = new WorkExecutorRepository();
    }

    public static WorkExecutorRepository getInstance() {
        return SingletonHandler.INSTANCE;
    }

    /**
     * 查找已创建的Executor
     */
    public ThreadPoolExecutor lookup(String workExecutorName) {
        return executors.get(workExecutorName);
    }

    /**
     *
     */
    public ThreadPoolExecutor bind(String workExecutorName, ThreadPoolExecutor exec) {
        return executors.putIfAbsent(workExecutorName, exec);
    }

    /**
     *
     */
    public ExecutorService unBind(String workExecutorName) {
        return executors.remove(workExecutorName);
    }
    
    public Set<String> getAllWorkExecutorName(){
    	return executors.keySet();
    }
    
    public Collection<ThreadPoolExecutor> getAllExecutor(){
    	return executors.values();
    }
}
