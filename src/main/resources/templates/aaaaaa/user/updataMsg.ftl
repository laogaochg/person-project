<!DOCTYPE html>
<html lang="en">
<head>
<#include "../common/baseImport.ftl" />
</head>
<body>

<#include "../common/left_mune.ftl" />
<div class="container rightContent">
    <div class="row">
        <div class="content">
            修改信息：${(msg.msg)!""}
            <br/>
            <a href="${context.contextPath}/user/list">确定 </a>
        </div>
    </div>
</div>
</body>
</html>