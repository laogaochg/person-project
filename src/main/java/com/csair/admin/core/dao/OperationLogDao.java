package com.csair.admin.core.dao;

import com.csair.admin.core.po.core.OperationLog;
import com.csair.admin.core.po.core.OperationLogQuery;
import java.util.List;
import com.csair.admin.core.po.core.OperationLogQueryObject;
import org.apache.ibatis.annotations.Param;

public interface OperationLogDao {
    int countByExample(OperationLogQuery example);

    int deleteByExample(OperationLogQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(OperationLog record);

    int insertSelective(OperationLog record);

    List<OperationLog> selectByExampleWithBLOBs(OperationLogQuery example);

    List<OperationLog> selectByExample(OperationLogQuery example);

    OperationLog selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") OperationLog record, @Param("example") OperationLogQuery example);

    int updateByExampleWithBLOBs(@Param("record") OperationLog record, @Param("example") OperationLogQuery example);

    int updateByExample(@Param("record") OperationLog record, @Param("example") OperationLogQuery example);

    int updateByPrimaryKeySelective(OperationLog record);

    int updateByPrimaryKeyWithBLOBs(OperationLog record);

    int updateByPrimaryKey(OperationLog record);

    int pageQueryCount(OperationLogQueryObject qo);

    List<OperationLog> pageQueryList(OperationLogQueryObject qo);
}