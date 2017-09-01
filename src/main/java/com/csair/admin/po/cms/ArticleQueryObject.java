package com.csair.admin.po.cms;

import java.util.Date;

import com.csair.admin.po.QueryObject;
import com.csair.admin.util.DateUtil;

/**
 * Created by yun on 2017/7/19 0019.
 */
public class ArticleQueryObject extends QueryObject {
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
    private Date createTime;
    /**
     * 查询的结束时间
     */
    private Date endTime;

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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = DateUtil.getBeginTime(DateUtil.getDate(createTime));
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = DateUtil.getTodayEndTime(DateUtil.getDate(endTime));
    }
}
