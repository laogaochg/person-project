package com.csair.admin.core.controller;

import com.csair.admin.config.PermissionName;
import com.csair.admin.core.po.Brand;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.ResponseMessage;
import com.csair.admin.core.po.core.ReturnMessage;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.core.query.BrandQueryObject;
import com.csair.admin.core.service.BrandService;
import com.csair.admin.core.service.MenuService;
import com.csair.admin.util.FileUploadUtils;
import com.csair.admin.util.ParamConstants;
import com.csair.admin.util.ServletUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * laogaochg
 * 2017/7/25.
 */
@Controller
@RequestMapping("brand")
public class BrandController {
    private static Logger logger = LoggerFactory.getLogger(BrandController.class);

    @Resource
    private BrandService brandService;
    @Resource
    private MenuService menuService;

    @RequestMapping("/list")
    @PermissionName("查看品牌")
    public String brandList(Model model, BrandQueryObject qo, HttpServletRequest httpRequest) {
        PageResult<Brand> pageResult = brandService.pageQuery(qo);
        model.addAttribute("pageResult", pageResult);
        model.addAttribute("qo", qo);
        model.addAttribute("userMenus", ServletUtils.queryUserMenu());
        model.addAttribute("selectMenuIdForIntropect", ServletUtils.getSelectMenuId(httpRequest));
        return "goodManage/brand/brandList";
    }


    @RequestMapping("batchDeleteBrand")
    @ResponseBody
    @PermissionName("删除品牌")
    public ResponseMessage batchDeleteBrand(Long[] ids) {
        if (ids == null || ids.length == 0) {
            ResponseMessage re = new ResponseMessage();
            re.setCode(ParamConstants.ERROR_PARAM);
            re.setMsg("id不能为空。");
            return re;
        }
        return brandService.batchDeleteBrand(ids, ServletUtils.getUser());
    }

    @RequestMapping("/toEditBrand")
    @PermissionName("编辑品牌")
    public String editCertificate(Long id, Model model) {
        if (id != null) {
            model.addAttribute("brand", brandService.queryById(id));
        }
        return "goodManage/brand/editBrand";
    }

    @RequestMapping("/editBrand")
    @PermissionName("编辑品牌")
    public String editBrand(Brand brand, String fileName, Model model) {
        ReturnMessage re = new ReturnMessage();
        model.addAttribute("msg", re);
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
        brandService.editBrand(brand, user);
        if (brand.getBrandId() == null) {
            re.setMes("添加成功。");
        } else {
            re.setMes("修改成功。");
        }
        re.setToUrl("/brand/list");
        return "common/updataMsg";
    }

}
