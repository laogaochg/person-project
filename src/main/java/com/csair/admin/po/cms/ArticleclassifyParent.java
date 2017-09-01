package com.csair.admin.po.cms;

import java.io.Serializable;

/**
 * 文章分类父类pojo
 */
public class ArticleclassifyParent implements Serializable {
    /**
     * 父级分类id
     */
    private Long flId;

    /**
     * 父类分类名称
     */
    private String flName;

    /**
     * 排序
     */
    private Integer sortOrder;

    private static final long serialVersionUID = 1L;

    public Long getFlId() {
        return flId;
    }

    public void setFlId(Long flId) {
        this.flId = flId;
    }

    public String getFlName() {
        return flName;
    }

    public void setFlName(String flName) {
        this.flName = flName == null ? null : flName.trim();
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", flId=").append(flId);
        sb.append(", flName=").append(flName);
        sb.append(", sortOrder=").append(sortOrder);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}