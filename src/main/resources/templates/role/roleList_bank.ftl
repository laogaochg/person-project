<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="keywords" content="keywords"/>
    <meta name="description" content="description"/>
    <meta name="author" content="author"/>
    <title>title</title>
    <link href="../../flat_ui/css/vendor/bootstrap.min.css" rel="stylesheet"/>
    <link href="../../flat_ui/css/flat-ui.min.css" rel="stylesheet"/>
    <link rel="shortcut icon" href="../favicon.ico"/>

    <script type="text/javascript" src="/html/js/jquery.js"></script>
    <script type="text/javascript" src="/html/js/common/pageQuery.js"></script>
    <script src="/html/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
</script>
<body>


<div class="container" style="margin-top: 1%;">
    <div class="row">
        <div class="col-md-10"></div>
        <div class="col-md-2"><a class="button" href="/logout">退出系统</a>
        </div>
        <div class="col-sm-3">
        <#include "../common/left_mune.ftl" />
        </div>
        <div class="col-sm-9">
            <h3>角色列表</h3>

            <a href="/role/inputRole">新增角色</a>
            <a href="/role/list">角色列表 </a>
        <@shiro.hasPermission name="用户查询">|
            <a href="/user/list">用户列表 </a>
        </@shiro.hasPermission>
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
                            <@shiro.hasPermission name="角色成员查询">
                                <a href="/role/userList?id=${role.id}">查看成员账号 </a>
                                |
                            </@shiro.hasPermission>
                            <@shiro.hasPermission name="角色权限编辑">
                                <a href="/permission/list?roleId=${role.id}">设置权限 </a>
                                |
                            </@shiro.hasPermission>
                            <@shiro.hasPermission name="角色编辑">
                                <a href="/role/inputRole?roleId=${role.id}">修改 </a>
                            </@shiro.hasPermission>
                            <@shiro.hasPermission name="删除角色">
                                |
                                <a href="/role/deleteRole?roleId=${role.id}">删除 </a>
                            </@shiro.hasPermission>
                        </th>


                    </tr>
                </#list>
                </table>
                共${pageResult.totalPage}页；
                <button type="button" class="changePage" data="${pageResult.prevPage}">上一页</button>
                |
                当前第${pageResult.currentPage}页|
                <button class="changePage" type="button" data="${pageResult.nextPage}">下一页</button>
                <br/>
                共找到${pageResult.totalCount}条；当前一页共<input style="width: 40px" name="pageSize"
                                                         value="${pageResult.pageSize}"/>条数据
                <input type="hidden" name="currentPage" value="${pageResult.currentPage}"/>
                <button>确定</button>
            </form>
        </div>
    </div>

</div>


</body>
</html>
