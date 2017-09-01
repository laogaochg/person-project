package com.csair.admin.po.cms;

/**
 * 文章搜索pojo
 */
public class ArticleSearch {
    /**
     * 查询名称
     */
    private String arName;
    /**
     * 查询的文章分类id
     */
    private Integer acId;
    /**
     * 查询的开始时间
     */
    private String create_time;
    /**
     * 查询的结束时间
     */
    private String end_time;

    public String getArName() {
        return arName;
    }

    public void setArName(String arName) {
        this.arName = arName;
    }

    public Integer getAcId() {
        return acId;
    }

    public void setAcId(Integer acId) {
        this.acId = acId;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }
}
