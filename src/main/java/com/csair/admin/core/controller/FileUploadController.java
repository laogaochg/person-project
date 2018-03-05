package com.csair.admin.core.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.csair.admin.config.core.PlatformException;
import com.csair.admin.util.LoggerUtils;
import com.csair.admin.util.ServletUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.csair.admin.util.FileUploadUtils;
import com.csair.admin.util.ParamConstants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * laogaochg
 * 2017/7/20.
 * 处理平台文件上传
 * 返回上传文件的名字
 */
@Controller
public class FileUploadController {
    private static final String UeditorUploadConfig;

    static {
        InputStream in = FileUploadUtils.class.getClassLoader().getResourceAsStream("UeditorUploadConfig.json");
        try {
            UeditorUploadConfig = StreamUtils.copyToString(in, Charset.forName("utf-8"));
        } catch (IOException e) {
            LoggerUtils.error(FileUploadUtils.class, "加载文件失败", e);
            throw new PlatformException(999, "加载文件失败");
        }
    }

    @RequestMapping("uploadFile")
    @ResponseBody
    public Object uploadFile(MultipartFile file) throws IOException {

        Map<String, Object> result = new HashMap<>();
        if (file == null) {
            result.put("code", ParamConstants.ERROR_PARAM);
            result.put("msg", "请选择正确的文件");
            return result;
        }
        String fileName = FileUploadUtils.saveFileByMultipartFile(file);
//        {
//            "code": 0 //0表示成功，其它失败
//                ,"msg": "" //提示信息 //一般上传失败后返回
//                ,"data": {
//            "src": "图片路径"
//                    ,"title": "图片名称" //可选
//        }
//        }
        result.put("code", 0);
        Map<String, Object> map = new HashMap<>();
        map.put("src", fileName);
        map.put("title", fileName);
        result.put("data", map);
        return result;
    }

    @RequestMapping(value = "uploadFileByUeditor", method = RequestMethod.GET)
    @ResponseBody
    public String getUeditorConfig() throws IOException {
        return UeditorUploadConfig;
    }

    @RequestMapping(value = "uploadFileByUeditor", method = RequestMethod.POST)
    @ResponseBody
    public Object uploadFileByUeditor(MultipartFile upfile, HttpServletRequest request) throws IOException {

        Map<String, Object> result = new HashMap<>();
        if (upfile == null) {
            result.put("code", ParamConstants.ERROR_PARAM);
            result.put("msg", "请选择正确的文件");
            return result;
        }
        String fileName = FileUploadUtils.saveFileByMultipartFile(upfile);
        result.put("url", request.getContextPath()+fileName);
        result.put("state", "SUCCESS");
        result.put("type", fileName.substring(fileName.lastIndexOf(".")));
        result.put("size", upfile.getSize());
        result.put("title", upfile.getName());
        return result;
    }


}
