<!DOCTYPE html>
<html lang="en">
<head>
<#include "../common/baseImport.ftl" />
    <title>as</title>
</head>
<body>
<#include "../common/left_mune.ftl" />
<div class="container rightContent">
    <div class="rwo" style="margin-top: 20px;">
        <div class="col-md-9 col-md-offset-1" style="font-size: 20px;color: #000;">
            修改信息：${(msg.mes)!""}
        </div>
    </div>
    <div class="rwo">
        <div class="col-md-5 col-md-offset-2" style="margin-top: 10px;">
            <a class="btn btn-info" style="height: 40px;width: 80px;" onclick="window.history.back()">返回</a>
            <a class="btn btn-info" style="margin-left: 30px;height: 40px;width: 80px;"
               href="${(msg.toUrl)!"#"}">确定 </a>
        </div>
    </div>
</body>
</html>