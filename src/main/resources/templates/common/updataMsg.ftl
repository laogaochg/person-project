<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>平面运营后台</title>
<#include "../common/baseImport.ftl" />
    <!-- style.css是项目的样式文件  -->

</head>
<body>
<div class="layui-layout layui-layout-admin" style="">
<#include "../common/left_mune.ftl" />
    <div class="layui-body" >
    <div class="rwo" style="margin-top: 20px;">
        <div class="col-md-9 col-md-offset-1" style="font-size: 20px;color: #000;">
            修改信息：${(msg.mes)!""}
        </div>
    </div>
    <div class="rwo">
        <div class="col-md-5 col-md-offset-2" style="margin-top: 10px;">
            <a class="btn btn-info" style="height: 40px;width: 80px;" onclick="window.history.back()">返回</a>
            <a class="btn btn-info" style="margin-left: 30px;height: 40px;width: 80px;"
               href="${context.contextPath}${(msg.toUrl)!"#"}">确定 </a>
        </div>
    </div>
</body>
</html>