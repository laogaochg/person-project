package com.csair.admin.core.service.impl;

import java.util.Date;
import java.util.List;

import com.csair.admin.core.dao.CertificateDao;
import com.csair.admin.core.po.setting.CertificateQuery;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.ResponseMessage;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.setting.Certificate;
import com.csair.admin.core.po.setting.CertificateQueryObject;
import com.csair.admin.core.service.CertificateService;
import com.csair.admin.core.service.OperationLogService;

import javax.annotation.Resource;

@Service
public class CertificateServiceImpl implements CertificateService {

    private static Logger logger = LoggerFactory.getLogger(CertificateServiceImpl.class);
    @Resource
    private CertificateDao certificateDao;
    @Resource
    private OperationLogService operationLogService;

    @Override
    public ResponseMessage<Object> deleteCertificate(Long id, User user) {
        ResponseMessage<Object> re = new ResponseMessage<>();
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
