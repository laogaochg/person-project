package com.test.domain;

import java.util.Arrays;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * laogaochg
 * 2017/8/12.
 * 阻塞队列
 */
public class MyBlockList<T> {
    private Object[] values;//队列内容
    private ReentrantLock lock;
    private Condition noEmpty;
    private Condition noFull;
    private int border;//队列边界

    public MyBlockList(int border,T[] values) {
        if (values.length > border) throw new NullPointerException("长度不对。");
        this.values = values;
        this.border = border;
        this.lock = new ReentrantLock();
        this.noEmpty = lock.newCondition();
        this.noFull = lock.newCondition();
    }

    /**
     * 存进去一个元素
     * 如果队列满了就等
     */
    public void put(T t) throws Exception {
        //如果队列没有满
        lock.lockInterruptibly();
        try {
            if (values.length < border) {
                putValue(t);
            } else {
                noEmpty.await();
            }
        } finally {
            lock.unlock();
        }
    }

    private void putValue(T t) {
        values = Arrays.copyOf(values,values.length + 1);
        values[values.length - 1] = t;
    }

    @Override
    public String toString() {
        return Arrays.toString(values);
    }
}
