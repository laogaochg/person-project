package com.csair.admin.core.vo;

import com.csair.admin.core.po.core.OperationLog;
import lombok.Data;

import java.text.SimpleDateFormat;
import java.util.logging.SimpleFormatter;

/**
 * @Author: LaoGaoChuang
 * @Date : 2018/5/8 16:56
 */
public class OperationLogVo extends OperationLog {
    private String dateString;

    public OperationLogVo(OperationLog a) {
        setAction(a.getAction());
        setAuthor(a.getAuthor());
        setAuthorName(a.getAuthorName());
        setContent(a.getContent());
        setId(a.getId());
        setOpIp(a.getOpIp());
        setOpTime(a.getOpTime());
    }

    public String getDateString() {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(getOpTime());
    }
}
