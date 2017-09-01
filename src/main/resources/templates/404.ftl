<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>找不到网页
    </title>
<#include "common/baseImport.ftl" />
</head>
<body>
<h4 style="text-align: center;">
    抱歉；程序员还在做页面。<br/>
    错误信息：${(msg)!"页面不存在！"}<br/>
    错误代码：${(code)!"404"}<br/>
</h4>
<div style="text-align: center;">
    <img style="margin-left: 42%" width="300px" src="/image/a.jpg"><br/>
    <button class="back btn btn-info" style="width: 100px;">返回</button>
</div>
<script type="text/javascript">
    $(".back").click(function() {
        window.history.back();
    });
</script>
<br/>
</body>
</html>