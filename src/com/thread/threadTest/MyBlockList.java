package com.thread.threadTest;

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
    private final ReentrantLock lock;
    private Condition isEmpty;
    private Condition isFull;
    private int border;//队列边界
    private int index;

    public MyBlockList(int border,T[] values) {
        if (values.length > border) throw new NullPointerException("长度不对。");
        this.values = values;
        this.border = border;
        this.lock = new ReentrantLock();
        this.isEmpty = lock.newCondition();
        this.isFull = lock.newCondition();
        this.index = values.length - 1;
    }

    /**
     * 去掉最后一个元素
     */
    public T pick() throws Exception {
        T t;
        lock.lockInterruptibly();
        try {
            for (t = pickValue();t == null;t = pickValue()) {
                System.out.println("队列已经空，取元素线程等待");
                isEmpty.await();
                System.out.println("取元素线程被叫起");
            }
        } finally {
            lock.unlock();
        }
        return t;
    }

    private T pickValue() {
        T t;
        if (index == -1) {
            return null;
        } else {
            t = (T)values[index];
            values[index] = null;
            values = Arrays.copyOf(values,values.length - 1);
            index--;
            isFull.signal();
            return t;
        }
    }

    /**
     * 存进去一个元素
     * 如果队列满了就等
     */
    public void put(T t) throws Exception {
        //如果队列没有满
        lock.lockInterruptibly();
        try {
            while (!putValue(t)) {
                System.out.println("队列已满，放元素线程阻塞");
                System.out.println("已经叫醒存元素的线程。");
            }
        } finally {
            lock.unlock();
        }
    }

    private boolean putValue(T t) {
        if (values.length < border) {
            values = Arrays.copyOf(values,values.length + 1);
            values[values.length - 1] = t;
            index++;
            isEmpty.signal();
            return true;
        } else {
            return false;
        }
    }

    public int size() {
        return values.length;
    }

    @Override
    public String toString() {
        return Arrays.toString(values) + "长度：" + values.length;
    }
}
