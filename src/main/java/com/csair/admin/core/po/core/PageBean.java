package com.csair.admin.core.po.core;

import java.util.List;

/**
 * 分页工具pojo
 */
public class PageBean<T> {

    private List<T> datas; //页面的数据

    private int firstPage = 1; //首页

    private int prePage; //上一页

    private int nextPage;//下一页

    private int totalPage;  //末页|总页数

    private int curPage;  //当前页

    private int totalRecode; //总记录数

    private int pageSize = 5; //页面的大小

    public List<T> getDatas() {
        return datas;
    }

    public void setDatas(List<T> datas) {
        this.datas = datas;
    }

    public int getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(int firstPage) {
        this.firstPage = firstPage;
    }

    //上一页
    public int getPrePage() {
        int prePage = this.getCurPage() - 1;
        return prePage;
    }

    public void setPrePage(int prePage) {
        this.prePage = prePage;
    }

    public int getNextPage() {
        int nextPage = this.getCurPage() + 1;
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public int getTotalPage() {
        int totalPage = this.getTotalRecode() % this.getPageSize() == 0 ? this.getTotalRecode() / this.getPageSize() : this.getTotalRecode() / this.getPageSize() + 1;
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public int getTotalRecode() {
        return totalRecode;
    }

    public void setTotalRecode(int totalRecode) {
        this.totalRecode = totalRecode;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public PageBean(List<T> datas,int firstPage,int prePage,int nextPage,int totalPage,int curPage,int totalRecode,int pageSize) {
        super();
        this.datas = datas;
        this.firstPage = firstPage;
        this.prePage = prePage;
        this.nextPage = nextPage;
        this.totalPage = totalPage;
        this.curPage = curPage;
        this.totalRecode = totalRecode;
        this.pageSize = pageSize;
    }

    public PageBean() {
        super();
    }

}
