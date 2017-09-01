package com.csair.admin.oldDao;

import java.util.List;

import com.csair.admin.po.OperationLog;
import com.csair.admin.po.OperationLogQueryObject;

public interface OperationLogDao {

    /**
     * 插入返回id
     **/
    Long insertOperationLog(OperationLog p);


    /**
     * 查询符合条件的个数
     */
    int pageQueryCount(OperationLogQueryObject qo);

    /**
     * 分页查询数据
     */
    List<OperationLog> pageQueryList(OperationLogQueryObject qo);
}
