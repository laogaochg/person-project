package com.test.util;

import java.io.File;
import java.util.List;

import org.springframework.util.StringUtils;

import com.test.model.SqlModel;

/**
 * laogaochg
 * 2017/7/6.
 */
public class SqlParseUtils {
    /**
     * 生成最基本的CRUD语句
     */
    public static void main(String[] args) {
        File f = new File("d:/test/a.txt");
        SqlModel s = getSqlModel(f);
        s.setAlias("u");
        s.setClassName("User");
        System.out.println(s.getSelectByKey());
        System.out.println(s.getDeleteByKey());
        System.out.println(s.getUpDateByKey());
        System.out.println(s.getInsert());
        System.out.println(s.getQueryAll());
    }

    public static SqlModel getSqlModel(File f) {
        List<String> list = FileUtils.getList(f);
        SqlModel sql = new SqlModel();
        for (String s : list) {
            s = s.replace("`","").replace("(","").replace(")","");
            //CREATE TABLE `csair_warn_num` (
            if (s.contains("CREATE")) {
                String tableName = s.replace("CREATE","").replace("TABLE","").replace("`","").replace("(","").trim();
                sql.setTableName(tableName);
            } else if (s.contains("PRIMARY KEY")) {
                //  PRIMARY KEY (`id`)
                String key = s.replace("PRIMARY KEY","").trim();
                sql.setKey(key);
                sql.setKeyFild(StringUtil.underline2Camel(key,true));
            } else if (s.contains("ENGINE")) {
                continue;
            } else {
                String sqlParam = s.split(" ")[0];
                if (StringUtils.hasText(sqlParam)) {
                    sql.getSqlParams().add(sqlParam);
                    String field = StringUtil.underline2Camel(sqlParam,true);
                    sql.getFields().add(field);
                    field = StringUtil.underline2Camel(sqlParam,false);
                    sql.getFieldsUp().add(field);
                }

            }
        }
        return sql;
    }
}
