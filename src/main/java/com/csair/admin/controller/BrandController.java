package com.csair.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csair.admin.po.Brand;
import com.csair.admin.po.BrandQueryObject;
import com.csair.admin.po.PageResult;
import com.csair.admin.po.ResponseEntity;
import com.csair.admin.po.ReturnMessage;
import com.csair.admin.po.User;
import com.csair.admin.service.BrandService;
import com.csair.admin.util.FileUploadUtils;
import com.csair.admin.util.ParamConstants;
import com.csair.admin.util.ServletUtils;

/**
 * laogaochg
 * 2017/7/25.
 */
@Controller
@RequestMapping("brand")
public class BrandController {
    private static Logger logger = LoggerFactory.getLogger(BrandController.class);

    @Autowired
    private BrandService brandService;

    @RequestMapping("/list")
    public String brandList(Model model,BrandQueryObject qo) {
        PageResult<Brand> pageResult = brandService.pageQuery(qo);
        model.addAttribute("pageResult",pageResult);
        model.addAttribute("qo",qo);
        return "goodManage/brand/brandList";
    }

    /**
     * 修改类目的顺序
     *
     * @param ids      类目id
     * @param newOrder 新的顺序
     */
    @RequestMapping("editBrandOrder")
    @ResponseBody
    public ResponseEntity editBrandOrder(Long[] ids,Long[] newOrder) {
        ResponseEntity re = new ResponseEntity();
        //前台数据验证
        if (ids == null || newOrder == null || ids.length != newOrder.length) {
            re.setCode(ParamConstants.ERROR_PARAM);
            re.setMes("参数错误。");
            return re;
        }
        User user = ServletUtils.getUser();
        return brandService.editBrandOrder(ids,newOrder,user);
    }

    @RequestMapping("batchDeleteBrand")
    @ResponseBody
    public ResponseEntity batchDeleteBrand(Long[] ids) {
        if (ids == null || ids.length == 0) {
            ResponseEntity re = new ResponseEntity();
            re.setCode(ParamConstants.ERROR_PARAM);
            re.setMes("id不能为空。");
            return re;
        }
        return brandService.batchDeleteBrand(ids,ServletUtils.getUser());
    }

    @RequestMapping("/toEditBrand")
    public String editCertificate(Long id,Model model) {
        if (id != null) {
            model.addAttribute("brand",brandService.queryById(id));
        }
        return "goodManage/brand/editBrand";
    }

    @RequestMapping("/editBrand")
    public String editBrand(Brand brand,String fileName,Model model) {
        ReturnMessage re = new ReturnMessage();
        model.addAttribute("msg",re);
        //前台数据验证
        if (!StringUtils.hasText(brand.getBrandName())) {
            re.setCode(ParamConstants.ERROR_PARAM + "");
            re.setMes("品牌名字不能为空。");
            re.setToUrl("/brand/toEditBrand");
            return "common/updataMsg";
        }
        if (!StringUtils.hasText(brand.getBrandLogo())) {
            re.setCode(ParamConstants.ERROR_PARAM + "");
            re.setMes("品牌logo不能少。");
            re.setToUrl("/brand/toEditBrand");
            return "common/updataMsg";
        }
        if (brand.getBrandOrder() == null) brand.setBrandOrder(1);
        //保存压缩图片
        String reduceImg = FileUploadUtils.reduceImg(brand.getBrandLogo());
        brand.setBrandLogoThumb(reduceImg);
        User user = ServletUtils.getUser();
        brandService.editBrand(brand,user);
        if (brand.getBrandId() == null) {
            re.setMes("添加成功。");
        } else {
            re.setMes("修改成功。");
        }
        re.setToUrl("/brand/list");
        return "common/updataMsg";
    }

}
