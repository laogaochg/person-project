package com.csair.admin.service;

import java.util.List;

import com.csair.admin.po.setting.Certificate;
import com.csair.admin.po.setting.CertificateQueryObject;
import com.csair.admin.po.ResponseEntity;
import com.csair.admin.po.User;
import com.csair.admin.po.PageResult;

public interface CertificateService {

    /**
    *插入返回id
    **/
    Long insertCertificate(Certificate p) ;
    /**
    *根据主键查询
    *
    **/
    Certificate queryById(Long id) ;
    /**
    *根据主键删除
    *
    **/
    int deleteById(Long id) ;

    /**
     * 分页查询
     * @param qo
     * @return
     */
    PageResult<Certificate> query(CertificateQueryObject qo);

    /**
     * 修改或添加证书
     * @param certificate
     * @param user
     * @return
     */
    int editCertificate(Certificate certificate,User user);

    /**
     * 删除证书
     * @param id
     * @param user
     * @return
     */
    ResponseEntity<Object> deleteCertificate(Long id,User user);
}
