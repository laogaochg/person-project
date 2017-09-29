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
    <div class="row">
        <div class="col-md-5">
            <form id="editUserForm" action="/user/editUser" class="" method="post">
                用户信息<br/>
                <input name="id" type="hidden" value="${(editUser.id)!""}">
                用户名<input name="email" value="${(editUser.email)!""}" class="form-control"><br/>
                昵称：<input name="nickname" value="${(editUser.nickname)!""}" class="form-control"><br/>
                密码：<input name="pswd" type="password" class="form-control"><br/>
                角色选择：
            <#list roleList as role>
                <#if roleIds??>
                    <input type="checkbox" <#if roleIds?seq_contains(role.id)>checked="checked"</#if> name="roleIds"
                           value="${role.id}"/>${role.name}|
                <#else >
                    <input type="checkbox" name="roleIds"
                           value="${role.id}"/>${role.name}|
                </#if>

            </#list>
                <br/>
                用户状态：
                <input type="radio" value="1"
                <#if !(editUser.status)??||((editUser.status)?? &&(editUser.status==1))> checked="checked"</#if>
                       name="state">有效
                <input type="radio" <#if (editUser.status)?? &&(editUser.status==2)>checked="checked"</#if> name="state"
                       value="0">无效<br/>

                备注<input name="remark" class="form-control" value="${(role.remark)!""}" class="input-lg"><br/>
                <button type="button" id="editUserButton" class="btn btn-success">提交</button>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function() {
        $("#editUserButton").click(function() {
            var roles=$("[name=roleIds]");
            var canSubmin=false;
            var hasSelectRole=false;
            var msg="";
            for (var i=0; i<roles.length; i++) {
                role=roles[i];
                if($(role).is(':checked')) {
                    canSubmin=true;
                    hasSelectRole=true;
                }
            }
            if(!hasSelectRole) {
                msg="至少给用户分配一个角色，否则用户可能无法正常登录。"
            }
            if(!$("[name=email]").val()) {
                canSubmin=false;
                msg="用户登陆邮箱不能为空。"
            }
            if(!$("[name=pswd]").val()) {
                canSubmin=false;
                msg="用户登陆密码不能为空。"
            }
            if(canSubmin) {
                var data=$("#editUserForm").serialize();
                console.debug(data);
                var url="/user/editUser";
                var successFunction=function() {
                    window.location.href="/user/list";
                };
                var updateErrorFunction=function() {
                    return;
                };
                var errorFunction=null;
                ajaxData(url,data,function(data) {
                    layer.confirm(data.mes,{
                        btn: ['确定']    //按钮
                    },function() {
                        window.location.href="/user/list";
                    });
                },function(data) {
                    layer.confirm(data.mes,{
                        btn: ['确定']    //按钮
                    });
                });
            } else {
                layer.confirm(msg,{
                    title: '错误信息',
                    btn: ['确定']    //按钮
                });
                return;
            }
        })
    })
</script>
<script type="text/javascript" src="${context.contextPath}/js/common/BaseUtil.js"></script>

</html>
