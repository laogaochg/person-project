package com.csair.admin.dao;

import com.csair.admin.po.OperationLog;
import com.csair.admin.po.OperationLogQuery;
import java.util.List;
import com.csair.admin.po.OperationLogQueryObject;
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