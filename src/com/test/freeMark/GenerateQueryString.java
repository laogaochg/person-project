package com.test.freeMark;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.test.util.FileUtils;

/**
 * laogaochg
 * 2017/7/14.
 */
public class GenerateQueryString {
    /**
     * 扫描高级查询对象完成拼装sql语句的代码
     * 高级查询类的字段后面有的字段名的说明如
     * private String name ; //a.name  名字
     */
    public static void main(String[] args) throws Exception {
        List<String> list = FileUtils.getList(new File("d:/test/a.txt"));
        List<SqlField> ss = getSqlFields(list);
        if (ss == null) return;
        System.out.println("StringBuilder sb = new StringBuilder(); ");
        for (SqlField s : ss) {
            if ("String".equals(s.getType())) {
                String sq = "if (StringUtils.hasText(qo.get%s())) {\n"//
                        + "sb.append(\" AND %s = ? \");\n"//
                        + "paramList.add(qo.get%s());\n" + "}";
                System.out.println(String.format(sq,s.getUpName(),s.getSqlName(),s.getUpName()));
            } else {
                String sq = "if (qo.get%s() != null) {\n"//
                        + "sb.append(\" AND %s = ? \");\n"//
                        + "paramList.add(qo.get%s());\n" + "}";
                System.out.println(String.format(sq,s.getUpName(),s.getSqlName(),s.getUpName()));
            }
        }
    }

    private static List<SqlField> getSqlFields(List<String> list) {
        List<SqlField> ss = new ArrayList<>();
        for (String s : list) {
            if (s.startsWith("private")) {
                if (!s.contains("//")) {
                    System.out.println("数据不合格式！" + s);
                    return null;
                }
                SqlField field = new SqlField();
                String[] a = s.replace("private","").trim().split(";");
                String[] fields = a[0].trim().split(" ");
                String type = fields[0];
                String name = fields[1];
                field.setType(type);
                field.setName(name);
                name = a[1].replace("//","").split(" ")[0];
                field.setSqlName(name);
                ss.add(field);
            }
        }
        return ss;
    }
}
