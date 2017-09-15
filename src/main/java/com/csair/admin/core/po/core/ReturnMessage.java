package com.csair.admin.core.po.core;
/**
 * 返回前端的对象封装
 */
public class ReturnMessage {
    private String code = "0";
    private String mes="";
    private Object data;
    public ReturnMessage() {
    }
    private String toUrl;

    public String getToUrl() {
        return toUrl;
    }

    public void setToUrl(String toUrl) {
        this.toUrl = toUrl;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}

