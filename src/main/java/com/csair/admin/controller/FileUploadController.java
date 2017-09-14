package com.csair.admin.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.csair.admin.util.FileUploadUtils;
import com.csair.admin.util.ParamConstants;
import com.csair.admin.po.core.ResponseEntity;

/**
 * laogaochg
 * 2017/7/20.
 * 处理平台文件上传
 * 返回上传文件的名字
 */
@Controller
public class FileUploadController {

    @RequestMapping("uploadFile")
    @ResponseBody
    public ResponseEntity<String> uploadFile(MultipartFile myfile) throws IOException {
        ResponseEntity<String> result = new ResponseEntity<>();
        if (myfile == null) {
            result.setCode(ParamConstants.ERROR_PARAM);
            result.setMes("请选择正确的文件。");
            return result;
        }
        String fileName = FileUploadUtils.saveFileByMultipartFile(myfile);
        result.setData(fileName);
        return result;
    }



}
