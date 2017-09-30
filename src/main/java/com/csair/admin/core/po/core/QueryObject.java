package com.csair.admin.core.po.core;

import java.util.ArrayList;
import java.util.List;

public abstract class QueryObject {

    protected String conditionString;

    protected Integer currentPage = 1;//当前页

    protected Integer pageSize = 10;//总页数


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
