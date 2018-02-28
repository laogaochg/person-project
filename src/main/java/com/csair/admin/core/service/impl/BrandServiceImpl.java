package com.csair.admin.core.service.impl;

import java.io.File;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.csair.admin.core.dao.BrandDao;
import com.csair.admin.core.po.Brand;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

import com.csair.admin.core.po.core.query.BrandQueryObject;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.ResponseMessage;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.service.BrandService;
import com.csair.admin.core.service.OperationLogService;
import com.csair.admin.util.EnvironmentParams;
import com.csair.admin.util.StringUtil;

import javax.annotation.Resource;

@Service
public class BrandServiceImpl implements BrandService {

    private static Logger logger = LoggerFactory.getLogger(BrandServiceImpl.class);
    @Resource
    private BrandDao brandDao;
    @Resource
    private OperationLogService operationLogService;


    @Override
    public int editBrand(Brand p) {
        return brandDao.insert(p);
    }


    @Override
    public int updateByKey(Brand p) {
        return brandDao.updateByPrimaryKey(p);
    }

    @Override
    public Brand queryById(Long id) {
        return brandDao.selectByPrimaryKey(id);
    }

    @Override
    public int deleteById(Long id) {
        return brandDao.deleteByPrimaryKey(id);
    }

    @Override
    public ResponseMessage<String> editBrand(Brand brand, User user) {
        ResponseMessage<String> result = new ResponseMessage<String>();
        //过滤特殊字符
        brand.setBrandDesc(HtmlUtils.htmlEscape(brand.getBrandDesc()));
        if (brand.getBrandId() == null) {
            brand.setAddTime(new Date());
            brand.setAddBy(user.getId());
            String content = String.format("品牌名字：%s", brand.getBrandName());
            brandDao.insert(brand);
            operationLogService.log(user.getId(), "添加品牌", content, user.getLastIp());
            return result;
        } else {
            Brand oldBrand = brandDao.selectByPrimaryKey(brand.getBrandId());
            oldBrand.setBrandDesc(brand.getBrandDesc());
            oldBrand.setBrandLogo(brand.getBrandLogo());
            oldBrand.setBrandLogoThumb(brand.getBrandLogoThumb());
            oldBrand.setBrandName(brand.getBrandName());
            oldBrand.setBrandOrder(brand.getBrandOrder());
            oldBrand.setBrandWebsite(brand.getBrandWebsite());
            oldBrand.setStatus(brand.getStatus());
            String content = String.format("品牌ID:%s；品牌名字：%s", brand.getBrandId(), brand.getBrandName());
            brandDao.updateByPrimaryKey(brand);
            operationLogService.log(user.getId(), "修改品牌", content, user.getLastIp());
            return null;
        }

    }

    @Override
    public PageResult<Brand> pageQuery(BrandQueryObject qo) {
        List<Brand> brands = brandDao.pageQueryList(qo);
        int count = brandDao.pageQueryCount(qo);
        return new PageResult<>(brands, count, qo.getPage(), qo.getPageSize());
    }

    @Override
    public ResponseMessage batchDeleteBrand(Long[] ids, User user) {
        for (Long id : ids) {
            Brand brand = brandDao.selectByPrimaryKey(id);
            //删除LOGO图
            if (brand != null) {
                String logo = brand.getBrandLogo();
                File file = new File(EnvironmentParams.uploadPath + logo);
                if (file.exists() && file.isFile()) {
                    file.delete();
                }
                file = new File(EnvironmentParams.uploadPath + brand.getBrandLogoThumb());
                if (file.exists() && file.isFile()) {
                    file.delete();
                }
            }
            brandDao.deleteByPrimaryKey(id);
        }
        String content = String.format("品牌ID：（%s）。", StringUtil.join(Arrays.asList(ids), ","));
        operationLogService.log(user.getId(), "批量删除品牌", content, user.getLastIp());
        ResponseMessage re = new ResponseMessage();
        re.setMsg("删除成功。");
        return re;
    }
}
