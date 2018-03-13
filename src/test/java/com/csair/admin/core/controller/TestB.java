package com.csair.admin.core.controller;

import java.io.IOException;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/9/26 16:26
 */
public class TestB {
    public static void main(String[] args) throws IOException {
        System.out.println("3000020180302000000".length());
        System.out.println((Long.MAX_VALUE+"").length());
    }

    private static class AAAA {
        private String text;
        private String code;

        public String getText() {
            return text;
        }

        public void setText(String text) {
            this.text = text;
        }
    }
}
