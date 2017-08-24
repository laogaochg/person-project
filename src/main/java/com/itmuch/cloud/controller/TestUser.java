package com.itmuch.cloud.controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class TestUser {
    private String username;
    private String password;
    private Integer age;

    public static void main(String[] args) {
        DecimalFormat decimalFormat = new DecimalFormat("##.##");
        String s = decimalFormat.format(new BigDecimal("10.00"));
        System.out.println("s = " + s);
        System.out.println(new BigDecimal("10.00"));
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "TestUser{" + "username='" + username + '\'' + ", password='" + password + '\'' + ", age=" + age + '}';
    }
}