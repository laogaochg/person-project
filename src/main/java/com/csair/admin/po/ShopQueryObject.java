package com.csair.admin.po;

import java.util.Date;

import com.csair.admin.util.DateUtil;

/**
 * Created by Administrator on 2017/7/18.
 */
public class ShopQueryObject extends QueryObject {
    private String name;    //商户名称
    private Date openBeginTime; //开店开始时间
    private Date openEndTime;   //开店结束时间
    private String status; //状态

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getOpenBeginTime() {
        return openBeginTime;
    }

    public void setOpenBeginTime(String openBeginTime) {
        this.openBeginTime = DateUtil.getBeginTime(DateUtil.getDate(openBeginTime));
    }

    public Date getOpenEndTime() {
        return openEndTime;
    }

    public void setOpenEndTime(String openEndTime) {
        this.openEndTime = DateUtil.getTodayEndTime(DateUtil.getDate(openEndTime));
    }
}
