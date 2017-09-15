package com.csair.admin.core.po.setting;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class GoodCategoryPropertyTemplet implements Serializable {
    private Long categoryId;
    private String goodCateoryName;//三级类目的名字
    private List<GoodCategoryPropertyTempletName> property = new ArrayList<>();
    private Date update;
    private String templetName;

    public String getTempletName() {
        return templetName;
    }

    public void setTempletName(String templetName) {
        this.templetName = templetName;
    }

    public Date getUpdate() {
        return update;
    }

    public void setUpdate(Date update) {
        this.update = update;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public String getGoodCateoryName() {
        return goodCateoryName;
    }

    public void setGoodCateoryName(String goodCateoryName) {
        this.goodCateoryName = goodCateoryName;
    }

    public List<GoodCategoryPropertyTempletName> getProperty() {
        return property;
    }

    public void setProperty(List<GoodCategoryPropertyTempletName> property) {
        this.property = property;
    }
}