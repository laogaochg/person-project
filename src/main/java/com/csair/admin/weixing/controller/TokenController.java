package com.csair.admin.weixing.controller;

import com.alibaba.druid.sql.visitor.functions.Char;
import com.csair.admin.core.po.Brand;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.query.BrandQueryObject;
import com.csair.admin.core.service.BrandService;
import com.csair.admin.core.vo.BrandVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/9/14 21:01
 */
@Controller
@RequestMapping("weixing")
public class TokenController {
    @Autowired
    private BrandService brandService;

    @RequestMapping("brandList")
    public String brandList(BrandQueryObject qo, Model model) {
        PageResult<Brand> p = brandService.pageQuery(qo);
        PageResult<BrandVo> pageResult =new PageResult<>();
        List<BrandVo> data = new ArrayList<>();
        for (Brand b : p.getListData()) {
            b.setBrandDesc(HtmlUtils.htmlUnescape(b.getBrandDesc()));
            data.add(new BrandVo(b));
        }
        pageResult.setListData(data);
        model.addAttribute("pageResult", pageResult);
        return "weixing/brandList";
    }

    @RequestMapping("1212")
    @ResponseBody
    public String getToken(HttpServletRequest request) {
        Map<String, String[]> parameterMap = request.getParameterMap();
        String signature = request.getParameter("signature");
        String timestamp = request.getParameter("timestamp");
        String nonce = request.getParameter("nonce");
        String echostr = request.getParameter("echostr");
        System.out.println("echostr = " + echostr);
        System.out.println("nonce = " + nonce);
        System.out.println("signature = " + signature);
        return echostr;
    }
}
