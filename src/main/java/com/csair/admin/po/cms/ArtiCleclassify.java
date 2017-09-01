package com.csair.admin.po.cms;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章分类pojo
 */
public class ArtiCleclassify implements Serializable {
    /**
     * 文章分类id
     */
    private Long acId;

    /**
     * 文章分类名称
     */
    private String acName;

    /**
     * 排序
     */
    private Integer sortOrder;

    /**
     * 文章状态 0关闭，1正常,2删除
     */
    private Byte status;

    /**
     * 创建时间
     */
    private Date created;

    /**
     * 父类id
     */
    private Integer flId;

    private static final long serialVersionUID = 1L;

    public Long getAcId() {
        return acId;
    }

    public void setAcId(Long acId) {
        this.acId = acId;
    }

    public String getAcName() {
        return acName;
    }

    public void setAcName(String acName) {
        this.acName = acName == null ? null : acName.trim();
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Integer getFlId() {
        return flId;
    }

    public void setFlId(Integer flId) {
        this.flId = flId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", acId=").append(acId);
        sb.append(", acName=").append(acName);
        sb.append(", sortOrder=").append(sortOrder);
        sb.append(", created=").append(created);
        sb.append(", flId=").append(flId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}