package com.csair.admin.service;

import com.csair.admin.po.OperationLog;
import com.csair.admin.po.OperationLogQueryObject;
import com.csair.admin.po.PageResult;

/**
 * laogaochg
 * 2017/7/11.
 * 后台操作记录日志
 */
public interface OperationLogService {

    /**
     * @param operaterId 操作人的id
     * @param action     操作：如果删除角色、修改角色
     * @param content    操作的内容：会员ID:111,会员名：lala
     * @param ip         操作人的ip地址；可以通过ServletUtils.getIpAddress方法得到
     */
    void log(Long operaterId,String action,String content,String ip);

    PageResult<OperationLog> pageQuery(OperationLogQueryObject qo);
}
