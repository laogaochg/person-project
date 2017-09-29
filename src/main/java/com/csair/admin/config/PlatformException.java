package com.csair.admin.config;

import com.csair.admin.util.ParamConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 平台自定义异常
 *
 */
public class PlatformException extends RuntimeException {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private static Logger logger = LoggerFactory.getLogger(PlatformException.class);

    /**
     * 错误代码
     */
    private int code;

    /**
     * 错误信息
     */
    private String mes;

    public PlatformException() {
        this.code = ParamConstants.UNKNOWNCODE;
        this.mes = ParamConstants.UNKNOWNMSG;
        logger.info("错误代码： code " + code + " 错误信息：mes" + mes);
    }

    /**
     *
     * @param code
     */
    public PlatformException(int code) {
        //根据错误码得到对应的错误信息；
        //String mes = MessageStaticUtils.getMessage(code);
        this.code = code;
        this.mes = mes;
        logger.info("错误代码： code " + code + " 错误信息：" + mes);
    }

    /**
     *
     */
    public PlatformException(int code, String mes) {
        logger.warn("错误代码：  " + code + " 错误信息：" + mes);
        this.code = code;
        this.mes = mes;
    }

    public int getReturnCode() {
        return code;
    }

    public void setReturnCode(int code) {
        this.code = code;
    }

    public String getReturnMsg() {
        return mes;
    }

    public void setReturnMsg(String mes) {
        this.mes = mes;
    }

}
