package com.csair.admin.core.dao;

import com.csair.admin.core.po.SkuPropertiesValue;
import com.csair.admin.core.po.SkuPropertiesValueQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SkuPropertiesValueDao {
    int countByExample(SkuPropertiesValueQuery example);

    int deleteByExample(SkuPropertiesValueQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(SkuPropertiesValue record);

    int insertSelective(SkuPropertiesValue record);

    List<SkuPropertiesValue> selectByExample(SkuPropertiesValueQuery example);

    SkuPropertiesValue selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SkuPropertiesValue record, @Param("example") SkuPropertiesValueQuery example);

    int updateByExample(@Param("record") SkuPropertiesValue record, @Param("example") SkuPropertiesValueQuery example);

    int updateByPrimaryKeySelective(SkuPropertiesValue record);

    int updateByPrimaryKey(SkuPropertiesValue record);
}