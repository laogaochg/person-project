<!DOCTYPE html>
<html lang="en">
<head>
<#include "../common/baseImport.ftl" />
    <title>as</title>
</head>
<body>
<#include "../common/left_mune.ftl" />
<div class="container rightContent">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-4"><h3>角色列表</h3></div>
    </div>
    <div class="row">
        <a class="btn btn-default" href="/role/inputRole">
            新增角色
        </a>
        <a class="btn btn-default" href="/role/list">
            角色列表
        </a>
    <@shiro.hasPermission name="/user/downloadUser">
        <a class="btn btn-default" href="/user/list">
            用户列表
        </a>
    </@shiro.hasPermission>
    <@shiro.hasPermission name="/permission/list">
        <a class="btn btn-default" href="/permission/edit">
            权限管理
        </a>
    </@shiro.hasPermission>
    </div>
    <div class="row">
        <form action="/role/list" id="queryRole">
            <table class="table">
                <tr>
                    <th> id：</th>
                    <th> 名字：</th>
                    <th> 类型：</th>
                    <th> 备注：</th>
                    <th> 操作：</th>


                </tr>
            <#list pageResult.listData as role>
                <tr>
                    <th>  ${role.id}</th>
                    <th> ${role.name}</th>
                    <th> ${(role.type)!""}</th>
                    <th> ${(role.remark)!""}</th>
                    <th>
                        <@shiro.hasPermission name="/role/userList">
                            <a class="btn btn-default" href="/role/userList?id=${role.id}">查看成员账号 </a>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="/role/editRolePermission">
                            <a class="btn btn-default" href="/permission/list?roleId=${role.id}">设置权限 </a>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="/role/inputRole">
                            <a class="btn btn-default" href="/role/inputRole?roleId=${role.id}">修改 </a>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="/role/deleteRole">
                            <a class="btn btn-default" href="/role/deleteRole?roleId=${role.id}">删除 </a>
                        </@shiro.hasPermission>
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
        </form>
    </div>
</div>
</body>
</html>