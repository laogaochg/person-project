package com.csair.admin.po;

import java.util.ArrayList;
import java.util.List;

public abstract class QueryObject {
    protected String sqlString;

    protected String conditionString;

    private Integer currentPage = 1 ;//当前页

    private Integer pageSize = 10 ;//总页数

    protected List<Object> paramList = new ArrayList<>();

    public Integer getStartRow() {
        return (currentPage - 1) * pageSize;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        if (null == currentPage || currentPage == 1) currentPage = 1;
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        if (null == pageSize || pageSize == 1) pageSize = 10;
        this.pageSize = pageSize;
    }
}
