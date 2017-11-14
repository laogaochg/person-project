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
        <script type="text/javascript">
            $(function() {
                var removeRoleUserIds=new Array();
                $(".removeRoleUser").click(function(a) {
                    //点击删除按钮就把用户的ID放到预定的集合；再点保存的时候再提交上去
                    var userId=$(a.currentTarget).attr("userRoleId");
                    if($.inArray(userId,removeRoleUserIds)== -1) {
                        removeRoleUserIds.push(userId);
                        $(".userMsg_" + userId).html("");
                    }
                    $("[name=userIds]").val(removeRoleUserIds);
                    $(".deleteMsg").html("当前已经删除" + removeRoleUserIds.length + "个用户。确定点保存按钮。")
                });
                $(".saveRoleUser").click(function(a) {
                    //点击删除按钮就把用户的ID放到预定的集合；再点保存的时候再提交上去
                    var userId=$(a.currentTarget).attr("userRoleId");
                    if($.inArray(userId,removeRoleUserIds)== -1) {
                        removeRoleUserIds.push(userId);
                    }
                });
            });
        </script>

        <div class="row">
            <h4>角色下用户列表</h4>

            角色名字：${role.name}---该角色下所有用户：<br/>

            <table class="table">
                <tr>
                    <th> id：</th>
                    <th> 用户账号：</th>
                    <th> 昵称：</th>
                    <th> 备注：</th>
                    <th> 登录IP：</th>
                    <th> 登录时间：</th>
                    <th> 创建时间：</th>
                    <th> 状态：</th>
                    <th> 操作：</th>
                </tr>
            <#list pageResult.listData as user>
                <tr class="userMsg_${(user.id)!""}">
                    <th> ${(user.id)!""}</th>
                    <th> ${(user.email)!""}</th>
                    <th> ${(user.nickname)!""}</th>
                    <th> ${(user.remark)!""}</th>
                    <th> ${(user.lastIp)!""}</th>
                    <th> ${((user.last_login_time)?string("yyyy-MM-dd HH:mm"))!""}</th>
                    <th> ${((user.create_time)?string("yyyy-MM-dd HH:mm"))!""}</th>
                    <th> ${(user.status==1)?string("有效","禁止登录")}</th>
                    <th>
                        <button type="button" class="btn btn-default">
                            <a class="removeRoleUser" userRoleId="${(user.id)!""}">删除 </a>
                        </button>
                    </th>
                </tr>
            </#list>
            </table>
        </div>
        <div class="row">
            <form action="${context.contextPath}/role/removeRoleUser" method="post">
                <input type="hidden" name="userIds">
                <input type="hidden" name="roleId" value="${role.id}">
                <div class="deleteMsg col-md-8"></div>
                <button class="btn btn-warning saveRoleUser">保存删除纪录</button>
            </form>
        </div>
        <form action="${context.contextPath}role/userList" id="queryRoleUser">
            共找到${pageResult.totalCount}条；当前一页
            共<input style="width: 40px" name="pageSize"
                    value="${pageResult.pageSize}"/>条数据
            <input type="hidden" name="currentPage" value="${pageResult.currentPage}"/>
            <input type="hidden" name="roleId" value="${role.id}"/>
            <button class="btn btn-info">确定</button>
        </form>
    </div>

</div>


</body>
</html>
