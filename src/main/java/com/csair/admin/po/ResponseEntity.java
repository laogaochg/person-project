package com.csair.admin.po;

/**
 * 请求响应实体
 * @param <T>
 */
public class ResponseEntity<T> {
    //为服务器自定义的响应码
    private int code =200;

    //对code的描述，一般对错误的响应码进行描述，方便调用者处理不同种错误情况
    private String mes = "成功";

    //数据体
    private T data;

    public ResponseEntity() {
    }

    public ResponseEntity(int code, String mes, T data) {
        this.code = code;
        this.mes = mes;
        this.data = data;
    }
    public ResponseEntity(int code, String mes) {
        this.code = code;
        this.mes = mes;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "ResponseEntity{" +
                "code='" + code + '\'' +
                ", mes='" + mes + '\'' +
                ", data=" + data +
                '}';
    }
}
