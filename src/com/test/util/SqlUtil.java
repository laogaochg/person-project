package com.test.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ifp.core.util.StringUtil;

/**
 * 解析sql语句
 */
public class SqlUtil {
    private SqlUtil() {}

    //select a.companyId , userId as user from applyflow a join batch b  on  a.companyId = b.companyId
    // where a.companyId = '1' order by a.companyId desc limit 1 , 5
    public static void main(String[] args) {
    }

    /**
     * 得到sql的排序字段
     */
    public static String getQueryOrder(String sql) {
        String upperCase = sql.toUpperCase();
        System.out.println(upperCase);
        int order = upperCase.lastIndexOf(" ORDER ");
        if (order == -1) return "";
        int limit = upperCase.lastIndexOf(" LIMIT ");
        if (limit == -1) return sql.substring(order + 7).replace("by ","").replace("BY ","").trim();
        String returnString = sql.substring(order + 7,limit);
        return StringUtil.hasText(returnString) ? returnString.replace("by ","").replace("BY ","").trim() : "";
    }

    /**
     * 得到sql查询条件
     */
    public static String getConditionString(String sql) {
        String upperCase = sql.toUpperCase();
        int whereIndex = upperCase.lastIndexOf(" WHERE ");
        int end = -1;
        int order = upperCase.lastIndexOf(" ORDER ");
        if (order != -1) return sql.substring(whereIndex + 7,order).trim();
        int limit = upperCase.lastIndexOf(" LIMIT ");
        if (limit != -1) return sql.substring(whereIndex + 7,limit).trim();
        String substring = sql.substring(whereIndex + 7);
        return StringUtil.hasText(substring) ? substring.trim() : "";
    }

    /**
     * 分析sql得到要查的字段名
     */
    public static List<String> getQueryField(String sql) {
        String substring = getQueryString(sql);
        String[] split = substring.split(",");
        List<String> getData = new ArrayList<>();
        for (String s : split) {
            if (StringUtil.hasText(s)) {
                s = s.trim();
                int i = s.indexOf(" as ");
                if (i != -1) {
                    s = s.substring(i + 4);
                    getData.add(s.trim());
                    continue;
                }
                i = s.indexOf(".");
                if (i != -1) {
                    s = s.substring(i + 1);
                    getData.add(s.trim());
                    continue;
                }
                getData.add(s.trim());
            }
        }
        return getData;
    }

    /**
     * 分析sql 得到查询部分语句
     */
    public static String getQueryString(String sql) {
        String upperCase = sql.toUpperCase();
        int from = upperCase.indexOf("FROM");//36
        String substring;
        if (from != -1) {
            substring = sql.substring(0,from);
        }else{
            substring = sql.substring(0);
        }
        substring = substring.replace("select","");
        substring = substring.replace("SELECT","");
        return substring.trim();
    }

    /**
     * 分析sql 产生查询多条记录的组件，
     * 输入参数 ：你的组件的描述 ，sql ， 输出数组名字
     */
    public static Map<String,Object> parseMultiResultSql(String actionDesc,String sql,String listName) {
        Map<String,Object> map = new HashMap<>();
        map.put("actionDesc",actionDesc);
        map.put("queryFields","");
        map.put("queryTables","");
        map.put("queryCondition","");
        map.put("queryOrder","");
        map.put("pageNo","pageNo");
        map.put("pageSize","pageSize");
        map.put("totalSize","totalSize");
        map.put("listName","listName");//输出数组的名字
        map.put("outputFields","");
        return map;
    }

}
