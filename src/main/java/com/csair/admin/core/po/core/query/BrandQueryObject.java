package com.csair.admin.core.po.core.query;

/**
 * laogaochg
 * 2017/7/24.
 */
//@ApiModel(value = "品牌查询条件封装对象")
public class BrandQueryObject extends QueryObject {
//    @ApiModelProperty(value = "关键字", required = true)
    private String keyword;

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
}
