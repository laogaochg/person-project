package com.csair.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.csair.admin.util.ParamConstants;
import com.csair.admin.util.ServletUtils;
import com.csair.admin.util.XlsFileUtil;
import com.csair.admin.po.GoodCategory;
import com.csair.admin.po.setting.Certificate;
import com.csair.admin.po.setting.CertificateQueryObject;
import com.csair.admin.service.CertificateService;
import com.csair.admin.po.ResponseEntity;
import com.csair.admin.po.User;
import com.csair.admin.po.PageResult;

/**
 * laogaochg
 * 2017/7/24.
 */
@RequestMapping("certificate")
@Controller
public class CertificateController {
    @Autowired
    private CertificateService certificateService;

    @RequestMapping("/editCertificate")
    @ResponseBody
    public ResponseEntity<Object> editCertificate(Certificate c) {
        //前端验证
        ResponseEntity<Object> result = new ResponseEntity<>();
        if (!StringUtils.hasText(c.getName())) {
            result.setCode(ParamConstants.ERROR_PARAM);
            result.setMes("名字不能为空");
            return result;
        }
        User user = ServletUtils.getUser();
        certificateService.editCertificate(c,user);
        return result;
    }

    @RequestMapping("/batchInsertCertificate")
    @ResponseBody
    public ResponseEntity<Object> batchInsertCertificate(MultipartFile file) throws IOException {
        //前端验证
        ResponseEntity<Object> result = new ResponseEntity<>();
        if (file == null) {
            result.setCode(ParamConstants.ERROR_PARAM);
            result.setMes("请选择文件。");
        }
        if (!"application/vnd.ms-excel".equals(file.getContentType())) {
            result.setCode(ParamConstants.ERROR_PARAM);
            result.setMes("请确定选择的文件是否为提供的模板。");
        }
        List<Map<Integer,String>> maps = XlsFileUtil.parseWorkbook(file.getInputStream());
        List<Certificate> list = new ArrayList<>();
        User user = ServletUtils.getUser();
        //解析文件
        for (int i = 0;i < maps.size();i++) {
            if (i == 0) continue;
            Map<Integer,String> row = maps.get(i);
            Certificate c = new Certificate();
            c.setCreateDate(new Date());
            c.setCreateId(user.getId());
            c.setName(row.get(0));
            c.setRemark(row.get(1));
            list.add(c);
        }
        for (Certificate c : list) {
            certificateService.insertCertificate(c);
        }
        return result;
    }

    @RequestMapping("/toEditCertificate")
    public String editCertificate(Long id,Model model) {
        Certificate certificate = certificateService.queryById(id);
        model.addAttribute("certificate",certificate);
        if(id!=null){
            List<GoodCategory> goodCategories = new ArrayList<>();
            model.addAttribute("goodCategories",goodCategories);
        }
        return "setting/certificate/edit";
    }

    @RequestMapping("/list")
    public ModelAndView queryCertificate(CertificateQueryObject qo,ModelAndView model) {
        PageResult pageResult = certificateService.query(qo);
        model.addObject("pageResult",pageResult);
        model.addObject("qo",qo);
        model.setViewName("setting/certificate/list");
        return model;
    }

    @RequestMapping("/batchDelete")
    @ResponseBody
    public ResponseEntity<Object> batchDelete(Long[] ids) {
        //前端验证
        ResponseEntity<Object> result = new ResponseEntity<>();
        User user = ServletUtils.getUser();
        if(ids==null){
            result.setCode(ParamConstants.ERROR_PARAM);
            result.setMes("请输入正确的参数。");
            return result;
        }
        for (Long id : ids) {
            certificateService.deleteCertificate(id,user);
        }
        return result;
    }
}
