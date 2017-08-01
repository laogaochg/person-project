package com.test.freeMark;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import lombok.Data;

/**
 * sql语名的数据
 */
@Data
public class SqlData {
    /**
     * 查询数据；想得到的变量名
     */
    private List<String> data = new ArrayList<>();
    private String queryCondition;
    private String queryOrder;
    private String queryTables;
    private String actionDesc ="";
    private String queryFields;
    private String listName;
    private String outputFields;
    public String getOutputFields(){
        if(data.size()==0) return "";
        return StringUtils.join(data,"||");
    }
}
