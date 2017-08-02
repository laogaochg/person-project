package com.csair.admin.setting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csair.admin.core.util.ParamConstants;
import com.csair.admin.core.util.ServletUtils;
import com.csair.admin.user.po.ResponseEntity;

/**
 * laogaochg
 * 2017/7/24.
 */
@RequestMapping("${classObj}")
@Controller
public class ${className}Controller2 {
    @Autowired
    private ${className}Service ${classObj}Service;

    @RequestMapping("/edit${className}")
    @ResponseBody
    public ResponseEntity<Object> edit${className}(${className} ${classObj}) {
        //前端验证
        ResponseEntity<Object> result = new ResponseEntity<>();
        User user = ServletUtils.getUser();
        ${classObj}Service.edit${className}(${classObj},user);
        return result;
    }
    @RequestMapping("/toEdit${className}")
    public String edit${className}(Long id,Model model) {
        ${className}  ${classObj}=${classObj}Service.queryById(id);
            model.addAttribute("${classObj}",${classObj});
        return "${classObj}/edit";
    }



    @RequestMapping("/list")
    public ModelAndView query${className}(${className}QueryObject qo,ModelAndView model) {
        PageResult pageResult = ${classObj}Service.query(qo);
        model.addObject("pageResult",pageResult);
        model.setViewName("${classObj}/list");
        return model;
    }



    @RequestMapping("/deleteById")
    @ResponseBody
    public ResponseEntity<Object> deleteById(Long id) {
        //前端验证
        ResponseEntity<Object> result = new ResponseEntity<>();
        User user = ServletUtils.getUser();
        ${classObj}Service.delete${className}(id,user);
        return result;
    }
}
