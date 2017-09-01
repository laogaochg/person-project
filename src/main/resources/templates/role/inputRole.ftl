<!DOCTYPE html>
<html lang="en">
<head>
<#include "../common/baseImport.ftl" />
</head>
<body>
<#include "../common/left_mune.ftl" />
<div class="container rightContent">
    角色信息
    <form action="/role/addOrUpdataRole" method="POST">
        <input name="id" type="hidden" value="${(role.id)!""}">
        名字<input name="name" value="${(role.name)!""}" class="input-lg"><br/>
        类型<input name="type" value="${(role.type)!""}" class="input-lg"><br/>
        备注<input name="remark" value="${(role.remark)!""}" class="input-lg"><br/>
        <button class="btn btn-default">提交</button>
    </form>
</div>
</body>

</html>