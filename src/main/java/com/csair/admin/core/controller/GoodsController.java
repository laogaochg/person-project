package com.csair.admin.core.controller;

import com.csair.admin.core.po.core.Menu;
import com.csair.admin.core.po.core.ResponseMessage;
import com.csair.admin.core.service.GoodsService;
import com.csair.admin.core.vo.GoodsVo;
import com.csair.admin.util.ServletUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author: LaoGaoChuang
 * @Date : 2018/3/29 21:47
 */
@Controller("goods")
@ResponseBody
public class GoodsController {
    @Autowired
    private GoodsService goodsService;

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public ResponseMessage<Object> insertGoods(@RequestBody GoodsVo goods) {
        ResponseMessage<Object> result = new ResponseMessage<>();
        int i = goodsService.insertGoods(goods);
        return result;
    }
}
