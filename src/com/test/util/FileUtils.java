package com.test.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

/**
 * laogaochg
 * 2017/7/6.
 * 读小文件返回对应东西
 */
public class FileUtils {
    public static List<String> getList(File f) {
        List<String> list = new ArrayList<>();
        try {
            BufferedReader br = new BufferedReader(new FileReader(f));
            while (br.ready()) {
                list.add(br.readLine().trim());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
