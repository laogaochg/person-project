package com.thread.threadTest;

import org.icepdf.core.pobjects.StringObject;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/9/30 9:35
 */
public class MyBlockMap {
    private final ConcurrentMap<String, Object> map = new ConcurrentHashMap<>();
    final Lock lock = new ReentrantLock();
    final Condition notFull = lock.newCondition();
    final Condition notEmpty = lock.newCondition();

    public void put(String key, Object x) throws InterruptedException {
        lock.lock();
        try {
            while (map.containsKey(key)) {
                //保证安全，等500毫秒还等不到唤醒信号就自己起来
                notFull.await(500L, TimeUnit.MILLISECONDS);
            }
            map.put(key, x);
            notEmpty.signalAll();
        } finally {
            lock.unlock();
        }
    }

    public Object take(String key) throws InterruptedException {
        lock.lock();
        try {
            while (!map.containsKey(key)) {
                //保证安全，等500毫秒还等不到唤醒信号就自己起来
                notEmpty.await(500L, TimeUnit.MILLISECONDS);
            }
            Object x = map.remove(key);
            notFull.signalAll();
            return x;
        } finally {
            lock.unlock();
        }
    }

    public static void main(String[] args) throws InterruptedException {
        MyBlockMap blockMap = new MyBlockMap();
        blockMap.put("1", 1);
        //blockMap.take("1"); //取出来才不会阻塞
        blockMap.put("1", 1);//将会一直阻塞
    }


}
