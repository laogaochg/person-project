package com.csair.admin.core.dao;

import com.csair.admin.core.po.SkuProperties;
import com.csair.admin.core.po.SkuPropertiesQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SkuPropertiesDao {
    int countByExample(SkuPropertiesQuery example);

    int deleteByExample(SkuPropertiesQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(SkuProperties record);

    int insertSelective(SkuProperties record);

    List<SkuProperties> selectByExample(SkuPropertiesQuery example);

    SkuProperties selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SkuProperties record, @Param("example") SkuPropertiesQuery example);

    int updateByExample(@Param("record") SkuProperties record, @Param("example") SkuPropertiesQuery example);

    int updateByPrimaryKeySelective(SkuProperties record);

    int updateByPrimaryKey(SkuProperties record);
}