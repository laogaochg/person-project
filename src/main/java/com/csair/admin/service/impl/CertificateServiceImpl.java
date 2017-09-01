package com.csair.admin.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csair.admin.oldDao.CertificateDao;
import com.csair.admin.po.PageResult;
import com.csair.admin.po.ResponseEntity;
import com.csair.admin.po.User;
import com.csair.admin.po.setting.Certificate;
import com.csair.admin.po.setting.CertificateQueryObject;
import com.csair.admin.service.CertificateService;
import com.csair.admin.service.OperationLogService;

@Service
public class CertificateServiceImpl implements CertificateService {

    private static Logger logger = LoggerFactory.getLogger(CertificateServiceImpl.class);
    @Autowired
    private CertificateDao certificateDao;
    @Autowired
    private OperationLogService operationLogService;

    @Override
    public ResponseEntity<Object> deleteCertificate(Long id,User user) {
        ResponseEntity<Object> re = new ResponseEntity<>();
        certificateDao.deleteById(id);
        String content = String.format("证书id:%s;",id);
        operationLogService.log(user.getId(),"添加证书",content,user.getLastIp());
        return re;
    }

    @Override
    public int editCertificate(Certificate c,User user) {
        if (c.getId() == null) {
            c.setCreateDate(new Date());
            c.setCreateId(user.getId());
            Long aLong = certificateDao.insertCertificate(c);
            String content = String.format("证书id:%s;证书名字%s;",aLong,c.getName());
            operationLogService.log(user.getId(),"添加证书",content,user.getLastIp());
            return 1;
        } else {
            Certificate old = certificateDao.queryById(c.getId());
            old.setName(c.getName());
            old.setRemark(c.getRemark());
            old.setUpdateDate(new Date());
            old.setGoodCategoryIds(c.getGoodCategoryIds());
            certificateDao.updateByKey(old);
            String content = String.format("证书id:%s;证书名字%s;",c.getId(),c.getName());
            operationLogService.log(user.getId(),"修改证书",content,user.getLastIp());
            return 1;
        }
    }

    @Override
    public PageResult<Certificate> query(CertificateQueryObject qo) {
        return new PageResult<>(certificateDao.pageQueryList(qo),certificateDao.pageQueryCount(qo),qo.getCurrentPage(),qo.getPageSize());
    }

    @Override
    public Long insertCertificate(Certificate p) {
        return certificateDao.insertCertificate(p);
    }

    @Override
    public List<Certificate> queryAllCertificate() {
        return certificateDao.queryAllCertificate();
    }

    @Override
    public int updateByKey(Certificate p) {
        return certificateDao.updateByKey(p);
    }

    @Override
    public Certificate queryById(Long id) {
        return certificateDao.queryById(id);
    }

    @Override
    public int deleteById(Long id) {
        return certificateDao.deleteById(id);
    }

}
