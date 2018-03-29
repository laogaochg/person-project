package com.csair.admin.core.dao;

import com.csair.admin.core.po.SkuPropertyConnect;
import com.csair.admin.core.po.SkuPropertyConnectQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SkuPropertyConnectDao {
    int countByExample(SkuPropertyConnectQuery example);

    int deleteByExample(SkuPropertyConnectQuery example);

    int insert(SkuPropertyConnect record);

    int insertSelective(SkuPropertyConnect record);

    List<SkuPropertyConnect> selectByExample(SkuPropertyConnectQuery example);

    int updateByExampleSelective(@Param("record") SkuPropertyConnect record, @Param("example") SkuPropertyConnectQuery example);

    int updateByExample(@Param("record") SkuPropertyConnect record, @Param("example") SkuPropertyConnectQuery example);
}