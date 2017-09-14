package com.csair.admin.dao;

import com.csair.admin.po.core.Brand;
import java.util.List;

import com.csair.admin.po.core.BrandQuery;
import com.csair.admin.po.core.BrandQueryObject;
import org.apache.ibatis.annotations.Param;

public interface BrandDao {
    int countByExample(BrandQuery example);

    int deleteByExample(BrandQuery example);

    int deleteByPrimaryKey(Long brandId);

    int insert(Brand record);

    int insertSelective(Brand record);

    List<Brand> selectByExampleWithBLOBs(BrandQuery example);

    List<Brand> selectByExample(BrandQuery example);

    Brand selectByPrimaryKey(Long brandId);

    int updateByExampleSelective(@Param("record") Brand record, @Param("example") BrandQuery example);

    int updateByExampleWithBLOBs(@Param("record") Brand record, @Param("example") BrandQuery example);

    int updateByExample(@Param("record") Brand record, @Param("example") BrandQuery example);

    int updateByPrimaryKeySelective(Brand record);

    int updateByPrimaryKeyWithBLOBs(Brand record);

    int updateByPrimaryKey(Brand record);

    int pageQueryCount(BrandQueryObject qo);

    List<Brand> pageQueryList(BrandQueryObject qo);
}