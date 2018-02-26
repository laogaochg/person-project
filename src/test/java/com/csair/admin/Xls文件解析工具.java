package com.csair.admin;

import com.csair.admin.util.XlsFileUtil;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.List;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/12/7 16:37
 */
public class Xls文件解析工具 {
    public static void main(String[] args) throws Exception {
        toXml();
        System.out.println("----------------------------------------------------");
        gotoClass();
        System.out.println("----------------------------------------------------");
        toSetMethod();
        System.out.println("----------------------------------------------------");
        outProperties();
        System.out.println("----------------------------------------------------");
        toSet();
    }

    //    生成xml文件里面的东西
    private static void toXml() throws Exception {
//        <!--EntOrderNo	企业电子订单编号-->
//        <EntOrderNo>EntOrderNo</EntOrderNo>
        List<List<String>> maps = getLists();
        for (List<String> list : maps) {
            if (list.size() < 5) {
                System.out.println(list);
                return;
            }
            String name = list.get(0).trim();
            String info = list.get(1);
            String mark = list.get(2);
            String length = list.get(3);
            String note = list.get(4);
            String temp = info + " " + mark + " " + length + " " + note;
            System.out.println("<!--" + name + "\t" + temp + "-->");
            System.out.println("<" + name + ">$!{item." + name + "}</" + name + ">");
        }
    }

    private static void toSet() throws FileNotFoundException {
        List<List<String>> maps = getLists();
        for (List<String> list : maps) {
            if (list.size() < 5) {
                System.out.println(list);
                return;
            }
            String name = list.get(0).trim();
            String info = list.get(1);
            String s = "content.set%s(declaration.element(\"%s\").getText());";
            System.out.println(String.format(s, name,name));
        }
    }

    private static void toSetMethod() throws FileNotFoundException {
        List<List<String>> maps = getLists();
        for (List<String> list : maps) {
            if (list.size() < 5) {
                System.out.println(list);
                return;
            }
            String name = list.get(0).trim();
            String info = list.get(1);
            System.out.println(String.format("result.set%s(\"%s\");", name, info));
        }
    }

    private static List<List<String>> getLists() throws FileNotFoundException {
        if (map != null) return map;
        String file = "d:/test.xls";
        map = XlsFileUtil.parseXlsFile(new FileInputStream(new File(file)));
        return map;
    }

    private static List<List<String>> map = null;

    private static void outProperties() throws FileNotFoundException {
        List<List<String>> listList = getLists();
        for (List<String> list : listList) {
            if (list.size() < 5) {
                System.out.println(list);
                return;
            }
            String name = list.get(0).trim();
            String info = list.get(1);
            String mark = list.get(2);
            String length = list.get(3);
            String note = list.get(4);
            String temp = info + " " + mark + " " + length + " " + note;
            System.out.println("#" + temp);
            System.out.println(name + "=");
        }
    }


    private static void gotoClass() throws FileNotFoundException {
        List<List<String>> listList = getLists();
        for (List<String> list : listList) {
            if (list.size() < 5) {
                System.out.println(list);
                return;
            }
            String name = list.get(0).trim();
            String info = list.get(1);
            String mark = list.get(2);
            String length = list.get(3);
            String note = list.get(4);
            String temp = info + " " + mark + " " + length + " " + note;
            String aa = "    /*** " + temp + "*/\n" +
                    "    private String " + name + ";";
            System.out.println(aa);
        }
    }

}
