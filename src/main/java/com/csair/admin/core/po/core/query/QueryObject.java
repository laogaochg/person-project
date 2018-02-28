package com.csair.admin.core.po.core.query;

public class QueryObject {


    protected Integer page = 1;//当前页



    protected Integer limit = 10;//总页数


    public Integer getStartRow() {
        return (page - 1) * limit;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer currentPage) {
        if (null == currentPage || currentPage == 1) currentPage = 1;
        this.page = currentPage;
    }

    public Integer getPageSize() {
        return limit;
    }

    public void setLimit(Integer pageSize) {
        if (null == pageSize || pageSize == 1) pageSize = 10;
        this.limit = pageSize;
    }
}
