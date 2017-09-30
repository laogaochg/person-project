package com.thread.threadTest;

import com.test.domain.User;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;

/**
 * laogaochg
 * 2017/8/12.
 */
public class MyBlockListTest {
    public static void main(String[] args) throws Exception {
        User u1 = new User();
        u1.setId(1L);
        MyBlockList<User> list = new MyBlockList<>(5,new User[]{u1});
        addValue(list);
        new Thread(() -> {
            try {
                List<User> users = pickUser(list);
                System.out.println(users);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }).start();
    }

    private static List<User> pickUser(MyBlockList<User> list) throws Exception {
        List<User> users = new ArrayList<>();
        final CountDownLatch latch = new CountDownLatch(5);
        for (int i = 0;i < 5;i++) {
            new Thread(() -> {
                try {
                    User pick = list.pick();
                    users.add(pick);
                    latch.countDown();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }).start();
        }
        latch.await();
        return users;
    }

    /**
     * CountDownLatch 用法
     * 等所有线程执行完再执行后面的代码
     */
    public static void addValue(MyBlockList<User> list) throws Exception {
//        final CountDownLatch latch = new CountDownLatch(100);
        for (int i = 0;i < 5;i++) {
            final long l = i;
            new Thread(() -> {
                User u3 = new User();
                u3.setId(l);
                try {
                    list.put(u3);
//                    latch.countDown();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }).start();
        }
//        latch.await();
    }

}
