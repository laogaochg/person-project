package com.test.domain;

/**
 * laogaochg
 * 2017/8/12.
 */
public class MyBlockListTest {
    public static void main(String[] args) throws Exception {
        User u1 = new User();
        u1.setId(1L);
        User u2 = new User();
        u2.setId(2L);
        MyBlockList<User> userMyBlockList = new MyBlockList<>(2,new User[]{u1,u2});
        User u = new User();
        u.setId(5L);
            userMyBlockList.put(u);
        //        for (int i = 0;i < 100;i++) {
//            final long l = i;
//            new Thread(new Runnable() {
//                @Override
//                public void run() {
//                    User u = new User();
//                    u.setId(l);
//                    try {
//                        userMyBlockList.put(u);
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }
//                }
//            }).start();
//        }
        System.out.println(userMyBlockList);
    }
}
