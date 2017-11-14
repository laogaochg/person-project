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
    <div class="layui-body">
        <script src="${context.contextPath}/js/common/BaseUtil.js"></script>
        <script>
            function forbidUserLogin(id) {
                layer.confirm('确定要禁止这个会员登录吗?', {
                    btn: ['确定', '取消']    //按钮
                }, function () {
                    postAjax("/forbidUserLogin", {id: id});
                });
            }

            function cancelForbidUserLogin(id) {
                layer.confirm('确定要允许这个会员登录吗?', {
                    btn: ['确定', '取消']    //按钮
                }, function () {
                    postAjax("/cancelForbidUserLogin", {id: id});
                });
            }
        </script>


        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4"><h3>用户列表</h3></div>
        </div>


        <form action="${context.contextPath}/user/list" class="form-inline" method="post" id="queryUser">
            <div class="row">
                <input class="form-control" name="keyWord">
                <button style="height: 40%" class="btn btn-success">搜索</button>
                <a class="btn btn-default" href="${context.contextPath}/user/toEditUser">
                    新建用户
                </a>
                <a class="btn btn-default" href="${context.contextPath}/user/downloadUser">
                    导出用户数据
                </a>
            </div>
            <div class="row">
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
                        <th>
                        ${((user.lastLoginTime)?string("yyyy-MM-dd HH:mm"))!""}
                        </th>
                        <th> ${((user.createTime)?string("yyyy-MM-dd HH:mm"))!""}</th>
                        <th> ${(user.status==1)?string("有效","禁止登录")}</th>
                        <th>
                            <a class="btn btn-info" href="${context.contextPath}/user/toEditUser?id=${user.id}">
                                修改
                            </a>
                            <#if user.status==1>
                                <button type="button" class="btn btn-danger" onclick="forbidUserLogin(${user.id})">
                                    禁用
                                </button>
                            <#else>
                                <button type="button" class="btn btn-danger"
                                        onclick="cancelForbidUserLogin(${user.id})">
                                    启用
                                </button>
                            </#if>
                        </th>
                    </tr>
                </#list>
                </table>
                共${pageResult.totalPage}页；
                <button type="button" class="btn btn-default changePage" data="${pageResult.prevPage}">上一页</button>
                当前第${pageResult.currentPage}页
                <button class="btn btn-default changePage" type="button" data="${pageResult.nextPage}">下一页</button>
                <br/>
                共找到${pageResult.totalCount}条；当前一页共<input style="width: 40px" name="pageSize"
                                                         value="${pageResult.pageSize}"/>条数据
                <input type="hidden" name="currentPage" value="${pageResult.currentPage}"/>
                <button class="btn btn-default">确定</button>
            </div>
        </form>

    </div>


</body>
<script src="${context.contextPath}/js/common/BaseUtil.js"></script>
<script>
    $(function () {

    });

    function forbidUserLogin(id) {
        layer.confirm('确定要禁止这个会员登录吗?', {
            btn: ['确定', '取消']    //按钮
        }, function () {
            postAjax("/forbidUserLogin", {id: id});
        });
    }

    function cancelForbidUserLogin(id) {
        layer.confirm('确定要允许这个会员登录吗?', {
            btn: ['确定', '取消']    //按钮
        }, function () {
            postAjax("/cancelForbidUserLogin", {id: id});
        });
    }
</script>
</html>
