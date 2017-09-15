package com.csair.admin.core.po.core;

import java.util.Date;

import com.csair.admin.util.DateUtil;
import org.apache.commons.lang3.StringUtils;

/**
 * laogaochg
 * 2017/7/11.
 */
public class OperationLogQueryObject extends QueryObject {
    public static final String baseSelect = "select l.id as id , l.author as author ," +//
            " l.action as action , l.content as content , l.op_time as opTime , " +//
            "l.op_ip as opIp , u.email as authorName from csair_log_operation l join e_admin_user u on l.author = u.id ";

    private String keyword;
    private Date beginTime;
    private Date endTime;
    private String authorId;
    private String action;


    public String getCountSql() {
        return " select count(1) from csair_log_operation l ";
    }


    public String getSqlString() {
        return baseSelect;
    }

    public static String getBaseSelect() {
        return baseSelect;
    }

    public String getKeyword() {
        if (StringUtils.isBlank(keyword)) return null;
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = DateUtil.getBeginTime(DateUtil.getDate(beginTime));
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = DateUtil.getTodayEndTime(DateUtil.getDate(endTime));
    }

    public String getAuthorId() {
        if (StringUtils.isBlank(authorId)) return null;
        return authorId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }

    public String getAction() {
        if (StringUtils.isBlank(action)) return null;
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
}
