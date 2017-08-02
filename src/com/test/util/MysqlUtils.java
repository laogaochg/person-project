package com.test.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import com.alibaba.druid.pool.DruidDataSourceFactory;

/**
 * laogaochg
 * 2017/7/13.
 * 执行sql工具类
 */
public class MysqlUtils {
    private static DataSource dataSource;
    private static Connection connection;

    static {
        Map<String,String> map = new HashMap<>();
        map.put("url","jdbc:mysql://127.0.0.1:3306/csair_eshop?serverTimezone=UTC&characterEncoding=utf-8&useSSL=true");
        map.put("driverClassName","com.mysql.jdbc.Driver");
        map.put("username","root");
        map.put("password","admin");
        try {
            dataSource = DruidDataSourceFactory.createDataSource(map);
            connection = dataSource.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {

        for (int i = 0;i < 1000;i++) {
            String sql = "INSERT INTO `csair_log_operation` VALUES ('"+(2000+i)+"', '3', '修改菜单', '菜单id:74菜单名：营销中二级菜单', '2016-07-11 15:35:55', '10.108.151.11')";
            doUpdate(sql);
        }

    }

    public static int doUpdate(String sql,Object... params) {
        PreparedStatement ps;
        Connection conn = connection;
        try {
            ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            for (int i = 0;params.length != 0 && i < params.length;i++) {
                ps.setObject(i + 1,params[i]);
            }
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return 0;
    }
}
