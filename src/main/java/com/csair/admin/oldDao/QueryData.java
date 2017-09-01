package com.csair.admin.oldDao;

import java.util.ArrayList;
import java.util.List;

/**
 * laogaochg
 * 查询数据辅助类
 * 2017/7/18.
 */
public class QueryData {
    private String conditionString;//条件语句不包括分页
    private List<Object> paramsList = new ArrayList<>();//条件语句的参数 不包括分布

    public String getConditionString() {
        return conditionString;
    }

    public void setConditionString(String conditionString) {
        this.conditionString = conditionString;
    }

    public List<Object> getParamsList() {
        return paramsList;
    }

    public void setParamsList(List<Object> paramsList) {
        this.paramsList = paramsList;
    }
}
