package com.csair.admin.po.setting;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * laogaochg
 * 2017/7/24.
 */
public class Certificate {
    /**
     * 用户id
     */
    private Long id;

    /**
     * 用户昵称
     */
    private String name;

    /**
     * 备注
     */
    private String remark;

    /**
     * 创建人
     */
    private Long createId;

    private Date createDate;

    private Date updateDate;
    private List<Long> goodCategoryIds = new ArrayList<>();

    public List<Long> getGoodCategoryIds() {
        return goodCategoryIds;
    }

    public void setGoodCategoryIds(List<Long> goodCategoryIds) {
        this.goodCategoryIds = goodCategoryIds;
    }

    public Long getCreateId() {
        return createId;
    }

    public void setCreateId(Long createId) {
        this.createId = createId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

}
