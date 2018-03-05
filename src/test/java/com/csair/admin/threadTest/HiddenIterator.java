package com.csair.admin.threadTest;

import java.util.HashSet;
import java.util.Random;
import java.util.Set;

/**
 * laogaochg
 * 2017/8/30.
 * 隐藏迭代；
 * 在迭代的过程中其它线程修改了当前线程迭代的内容
 * 那么就会发生 ConcurrentModificationException 异常
 */
public class HiddenIterator {
    private final Set<Integer> set = new HashSet<>();

    public static void main(String[] args) {
        HiddenIterator h = new HiddenIterator();
        for (int i = 0;i < 10;i++) {
            new Thread(() -> {
                h.addTenThings();
            }).start();
        }
//        h.addTenThings();
    }

    public void addTenThings() {
        Random r = new Random();
        for (int i = 0;i < 10;i++) {
            add(r.nextInt());
        }
        System.out.println("added ten elements to HiddenIterator " + set);
    }

    public synchronized void add(Integer i) {set.add(i);}

    public synchronized void remove(Integer i) {set.remove(i);}

}
