package com.csair.admin.service.impl;

import java.util.Date;
import java.util.List;

import com.csair.admin.dao.CertificateDao;
import com.csair.admin.po.setting.CertificateQuery;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csair.admin.po.core.PageResult;
import com.csair.admin.po.core.ResponseEntity;
import com.csair.admin.po.core.User;
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
    public ResponseEntity<Object> deleteCertificate(Long id, User user) {
        ResponseEntity<Object> re = new ResponseEntity<>();
        certificateDao.deleteByPrimaryKey(id);
        String content = String.format("证书id:%s;", id);
        operationLogService.log(user.getId(), "添加证书", content, user.getLastIp());
        return re;
    }

    @Override
    public int editCertificate(Certificate c, User user) {
        if (c.getId() == null) {
            c.setCreateDate(new Date());
            c.setCreateId(user.getId());
            certificateDao.insert(c);
            String content = String.format("证书id:%s;证书名字%s;", c.getId(), c.getName());
            operationLogService.log(user.getId(), "添加证书", content, user.getLastIp());
            return 1;
        } else {
            Certificate old = certificateDao.selectByPrimaryKey(c.getId());
            old.setName(c.getName());
            old.setRemark(c.getRemark());
            old.setUpdateDate(new Date());
            old.setGoodCategoryIds(c.getGoodCategoryIds());
            certificateDao.updateByPrimaryKey(old);
            String content = String.format("证书id:%s;证书名字%s;", c.getId(), c.getName());
            operationLogService.log(user.getId(), "修改证书", content, user.getLastIp());
            return 1;
        }
    }

    @Override
    public PageResult<Certificate> query(CertificateQueryObject qo) {
        CertificateQuery ex = new CertificateQuery();
        CertificateQuery.Criteria criteria = ex.createCriteria();
        if(StringUtils.isNotBlank(qo.getKeyword())) criteria.andNameLike("%" + qo.getKeyword() + "%");
        List<Certificate> certificates = certificateDao.selectByExample(ex);
        int count = certificateDao.countByExample(ex);
        return new PageResult<>(certificates, count, qo.getCurrentPage(), qo.getPageSize());
    }

    @Override
    public Long insertCertificate(Certificate p) {
        certificateDao.insert(p);
        return p.getId();
    }


    @Override
    public Certificate queryById(Long id) {
        return certificateDao.selectByPrimaryKey(id);
    }

    @Override
    public int deleteById(Long id) {
        return certificateDao.deleteByPrimaryKey(id);
    }

}
