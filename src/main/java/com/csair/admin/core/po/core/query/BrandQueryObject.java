package com.csair.admin.core.po.core.query;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * laogaochg
 * 2017/7/24.
 */
//@ApiModel(value = "品牌查询条件封装对象")
@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
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
