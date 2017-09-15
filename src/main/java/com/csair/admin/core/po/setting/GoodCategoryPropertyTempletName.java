package com.csair.admin.core.po.setting;

import java.util.ArrayList;
import java.util.List;

/**
 * laogaochg
 * 2017/7/31.
 */
public class GoodCategoryPropertyTempletName {
    List<String> value = new ArrayList<>();
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getValue() {
        return value;
    }

    public void setValue(List<String> value) {
        this.value = value;
    }
}
