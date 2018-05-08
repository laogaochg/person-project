package com.csair.admin.core.vo;

import com.csair.admin.core.po.Brand;
import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Data
public class BrandVo implements Serializable {
    /**
     * 品牌id
     */
    private Long brandId;

    /**
     * 品牌名称
     */
    private String brandName;

    /**
     * logo图片
     */
    private String brandLogo;

    /**
     * logo图片缩略图
     */
    private String brandLogoThumb;

    /**
     * 品牌官网地址
     */
    private String brandWebsite;

    /**
     * 品牌排序
     */
    private Integer brandOrder;

    /**
     * 状态 0-停用，1-启用
     */
    private Byte status;

    /**
     * 添加时间
     */
    private Date addTime;

    /**
     * 添加人
     */
    private Long addBy;

    /**
     * 品牌描述
     */
    private String brandDesc;

    private static final long serialVersionUID = 1L;
    private List<String> imgs = new ArrayList<>();

    public BrandVo(Brand b) {
        this.addBy = b.getAddBy();
        this.addTime = b.getAddTime();
        this.brandDesc = b.getBrandDesc();
        this.brandId = b.getBrandId();
        this.brandLogo = b.getBrandLogo();
        this.brandLogoThumb = b.getBrandLogoThumb();
        this.brandName = b.getBrandName();
        this.brandOrder = b.getBrandOrder();
        this.brandWebsite = b.getBrandWebsite();
        this.status=b.getStatus();
        this.imgs = Arrays.asList(b.getBrandLogo().split(";"));
    }
}