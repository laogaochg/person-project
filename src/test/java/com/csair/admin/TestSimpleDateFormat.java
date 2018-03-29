package com.csair.admin;

import java.text.SimpleDateFormat;
import java.util.Date;

class MyThread extends Thread {
    private SimpleDateFormat sdf;
    private String dateString;
    public MyThread(SimpleDateFormat sdf, String dateString) {
        this.sdf = sdf;
        this.dateString = dateString;
    }

    @Override
    public void run() {
        try {
            Date date = sdf.parse(dateString);
            String dateStr = sdf.format(date);
            if(!dateStr.equals(dateString)) {
                System.out.println("ThreadName=" + this.getName() + "报错了，日期字符串：" + dateString + ",转换成的日期字符串：" + dateStr);
            } else {
                System.out.println("ThreadName=" + this.getName() + "成功，日期字符串：" + dateString);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

public class TestSimpleDateFormat {

    public static void main(String[] args) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String[] dateString = {"2017-11-05","2017-11-06","2017-11-07","2017-11-08","2017-11-09","2017-11-10","2017-11-11","2017-11-12","2017-11-13","2017-11-14"};
        Thread[] threads = new Thread[10];
        for (int i = 0; i < threads.length; i++) {
            threads[i] = new MyThread(sdf, dateString[i]);
        }
        for (int i = 0; i < threads.length; i++) {
            threads[i].start();
        }
    }
}