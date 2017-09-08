<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>平面运营后台</title>
<#include "../../common/baseImport.ftl" />
    <!-- style.css是项目的样式文件  -->

</head>
<body>
<div class="layui-layout layui-layout-admin" style="">
<#include "../../common/left_mune.ftl" />
    <div class="layui-body">
        <!--头部的展示块-->
        <div class="viewHeader clearfix">
            <div class="sec_right">
                <h4>消息公告</h4>
                <i></i>
                <ol>
                    <li class="right_1">
                        <p><em></em><span>2017年7月1日 11点至13点，全网不停服升级，升级后将有全新的功能内容，敬请期待。</span></p>
                        <b>今天</b>
                    </li>
                    <li class="right_2">
                        <p><em>!</em><span>2017年7月1日 11点20分10秒，因店铺违约未发货，现扣除店铺积分5分，等级为c1，仅此警告</span></p>
                        <b>2017-7-5</b>
                    </li>
                </ol>
            </div>
            <div class="viewRight">
                <ul>
                    <li>
                        <div class="marginStyle">产品数量</div>
                        <div class="num color1">1,23367</div>
                    </li>
                    <li>
                        <div class="marginStyle">退款申请</div>
                        <div class="num color2">1,23367</div>
                    </li>
                    <li>
                        <div class="marginStyle">库存预警</div>
                        <div class="num color3">1,23367</div>
                    </li>
                    <li>
                        <div class="marginStyle">销售总额</div>
                        <div class="num color4">1,23367</div>
                    </li>
                    <li>
                        <div class="marginStyle">订单数量</div>
                        <div class="num color5">1,23367</div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="msg_list">
            <p>代处理订单</p>
            <dl>
                <dt>
                    <span>订单号</span>
                    <span>收货人</span>
                    <span>支付状态</span>
                    <span>金额</span>
                    <span>下单时间</span>
                    <span>操作</span>
                </dt>
                <dd>
                    <span>4545454545</span>
                    <span>张三</span>
                    <span class="unpaid"><em class="unpaid"></em>未支付</span>
                    <span class="money">￥324</span>
                    <span>2017/05/05/ 13:34</span>
                    <span class="faEye"><a href="JavaScript：void(0)" class="eye"><em></em></a></span>
                </dd>
                <dd>
                    <span>4545454545</span>
                    <span>张三</span>
                    <span class="paid"><em class="paid"></em>已支付</span>
                    <span class="money">￥324</span>
                    <span>2017/05/05/ 13:34</span>
                    <span class="faEye"><a href="JavaScript：void(0)" class="eye"><em></em></a></span>
                </dd>
            </dl>
        </div>
    </div>


</body>
</html>