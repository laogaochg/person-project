package com.csair.admin.po.setting;

import java.util.Date;

import com.csair.admin.po.QueryObject;
import com.csair.admin.util.DateUtil;

/**
 * laogaochg
 * 2017/7/31.
 */
public class GoodCategoryPropertyTempletQueryObject extends QueryObject {
    private Long goodCategoryId;
    private Date editBeginDate;
    private Date editEndDate;
    private String keyword;

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Long getGoodCategoryId() {
        return goodCategoryId;
    }

    public void setGoodCategoryId(Long goodCategoryId) {
        this.goodCategoryId = goodCategoryId;
    }

    public Date getEditBeginDate() {
        return editBeginDate;
    }

    public void setEditBeginDate(String editBeginDate) {
        this.editBeginDate = DateUtil.getBeginTime(DateUtil.getDate(editBeginDate));
    }

    public Date getEditEndDate() {
        return editEndDate;
    }

    public void setEditEndDate(String editEndDate) {
        this.editEndDate = DateUtil.getTodayEndTime(DateUtil.getDate(editEndDate));
    }
}
