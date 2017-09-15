package com.csair.admin.core.dao;

import java.util.List;

import com.csair.admin.core.po.setting.Certificate;
import com.csair.admin.core.po.setting.CertificateQuery;
import org.apache.ibatis.annotations.Param;

public interface CertificateDao {
    int countByExample(CertificateQuery example);

    int deleteByExample(CertificateQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(Certificate record);

    int insertSelective(Certificate record);

    List<Certificate> selectByExample(CertificateQuery example);

    Certificate selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Certificate record, @Param("example") CertificateQuery example);

    int updateByExample(@Param("record") Certificate record, @Param("example") CertificateQuery example);

    int updateByPrimaryKeySelective(Certificate record);

    int updateByPrimaryKey(Certificate record);
}