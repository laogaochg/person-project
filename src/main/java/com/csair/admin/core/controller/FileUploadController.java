package com.csair.admin.core.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.csair.admin.util.EnvironmentParams;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.csair.admin.util.FileUploadUtils;
import com.csair.admin.util.ParamConstants;
import com.csair.admin.core.po.core.ResponseEntity;

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
    public Map<String, Object> uploadFile(MultipartFile file) throws IOException {

        Map<String, Object> result = new HashMap<>();
        if (file == null) {
            result.put("code", ParamConstants.ERROR_PARAM);
            result.put("code", "请选择正确的文件");
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


}
