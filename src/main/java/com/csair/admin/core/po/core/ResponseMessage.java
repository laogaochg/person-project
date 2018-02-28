package com.csair.admin.core.po.core;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 请求响应实体
 *
 * @param <T>
 */
@Setter
@Getter
@ToString
public class ResponseMessage<T> {
    //为服务器自定义的响应码
    private int code = 200;
    private boolean success;

    //对code的描述，一般对错误的响应码进行描述，方便调用者处理不同种错误情况
    private String msg = "成功";

    //数据体
    private T data;

    public boolean isSuccess() {
        return code == 200;
    }

    public ResponseMessage() {
    }

    public ResponseMessage(int code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public ResponseMessage(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

}
