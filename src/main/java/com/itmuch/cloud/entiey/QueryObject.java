package com.itmuch.cloud.entiey;

import java.util.ArrayList;
import java.util.List;

import org.springframework.util.StringUtils;

public abstract  class QueryObject {

    protected String sqlString;

    protected String conditionString;

    private Integer currentPage = 1 ;//当前页

    private Integer pageSize = 10 ;//总页数

    protected List<Object> paramList = new ArrayList();

    public Integer getStartRow(){
        return (currentPage-1)*pageSize;
    }

    /**
     *
     * @return 查询的条件sql
     */
    public abstract String getConditionString();
    /**
     *
     * @return 查询的参数
     */
    public  List<Object> getConditionParam(){
        if (!StringUtils.hasText(sqlString)) {
            getConditionString();
        }
        return paramList;
    };

    /**
     * 查询的字段和表
     * @return
     */
//    public abstract String getSqlString();


    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
