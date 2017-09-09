package com.csair.admin.po;

/**
 * Created by lenovo on 2017/6/27.
 */

/**
 * Created by lenovo on 2017/6/27.
 */
public class RoleUserQueryObject extends QueryObject {
    private Long id;//角色id
    private String keyWord;//关键词

    public String getSqlString() {
//        String sql = UserDaoImpl.BASE_SELECT + " JOIN e_admin_user_role ur ON  ur.uid = u.id ";
        return "";
    }

    public String getCountSqlString() {
        return "select count(1) from e_admin_user_role ur JOIN  e_admin_user u ON  ur.uid = u.id ";
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }
}