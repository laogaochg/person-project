package com.csair.admin.po;

/**
 * 角色查询参数封装
 */
public class UserQueryObject extends QueryObject {
    /**
     * 查询用户id是??的
     */
    private Long id;
    private String name;
    private String email;
    private String type;
    private String keyWord;//关键词

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

}
