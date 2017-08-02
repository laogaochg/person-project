package com.test.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.util.StringUtils;

import com.test.util.StringUtil;
import lombok.Data;

/**
 * laogaochg
 * 2017/7/6.
 * 分析建表语得到的对象
 */
@Data
public class SqlModel {
    private String tableName;//表名
    private String name;//主体名：如品牌、用户
    private String key;//主键
    private String keyFild;//主键
    private List<String> sqlParams = new ArrayList<String>();//sql的字段名
    private List<String> fields = new ArrayList<String>();//类的字段名
    private List<String> fieldsUp = new ArrayList<String>();//类的字段名头一个字母大写
    private String className;
    private String classObj;//类名头字母小写
    private String alias = "";//sql里面表的别名

    public String getAlias() {
        return StringUtils.hasText(alias) ? alias : "";
    }

    public String getClassObj() {
        return className.substring(0,1).toLowerCase() + className.substring(1,className.length());
    }

    public String getUpKey() {
        return keyFild.substring(0,1).toUpperCase() + keyFild.substring(1,keyFild.length());
    }

    /**
     * 类名第一个字母小写
     *
     * @return
     */
    public String getClassNameLower() {
        return className.substring(0,1).toLowerCase() + className.substring(1,className.length());
    }

    public List<String> getNoKeyFields() {
        List<String> list = new ArrayList<>();
        for (String s : fieldsUp) {
            if (!keyFild.equalsIgnoreCase(s)) list.add(s);
        }
        return list;
    }

    public String getInsert() {
//        insert into e_admin_permission ( url ,name , mid) values ( ? , ? , ? )
        String sql = "insert into " + tableName + " ( sqlParams ) values ( *** ) ";
        List<String> ss = new ArrayList<>();
        List<String> sss = new ArrayList<>();
        for (String s : sqlParams) {
            if (!key.equalsIgnoreCase(s)) {
                ss.add(s);
                sss.add("?");
            }
        }
        return sql.replace("sqlParams",StringUtil.join(ss,",")).replace("***",StringUtil.join(sss,","));
    }

    public String getDeleteByKey() {
        String s = "delete from tableName where key = ? ";
        return s.replace("tableName",tableName).replace("key",key);
    }

    public String getUpDateByKey() {
        String sql = "update  tableName set **change** where key =  ? ";
        sql = sql.replace("tableName",tableName);
        sql = sql.replace("key",key);
        StringBuilder sb = new StringBuilder("");
        for (int i = 0;i < sqlParams.size();i++) {
            if (i != sqlParams.size() - 1) {
                sb.append(sqlParams.get(i));
                sb.append(" = ? ,");
            } else {
                sb.append(sqlParams.get(i));
                sb.append(" = ? ");
            }
        }
        return sql.replace("**change**",sb);
    }

    public String getSelectByKey() {
        return getQueryAll() + " where " + key + " = ? ";
    }

    public String getQueryAll() {
        StringBuilder sb = new StringBuilder("select ");
        String s = StringUtils.hasText(alias) ? alias + "." : "";
        for (int i = 0;i < sqlParams.size();i++) {
            sb.append(s + sqlParams.get(i) + " as " + fields.get(i));
            if (i != sqlParams.size() - 1) {
                sb.append(" , ");
            }
        }
        sb.append(" from ");
        sb.append(tableName + " " + alias + " ");
        return sb.toString();
    }
}
