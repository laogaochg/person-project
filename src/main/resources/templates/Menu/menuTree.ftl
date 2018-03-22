<!DOCTYPE HTML>
<html>

<head>
    <title>菜单管理</title>
    <script type="text/javascript">

        var path = '${context.contextPath}';
        var basePath = window.location.protocol + "//"
                + window.location.host
                + path + "/";
    </script>
<#include "../inc.ftl" />
    <link rel="stylesheet" type="text/css" href="${context.contextPath}/css/login.css"></link>
</head>
<body>
    <div class="row">
        <button class="layui-btn" onclick="window.history.back()" style="width: 100px;">返回</button>
        <table class="layui-table">
            <tr>
                <th>名称</th>
                <th>链接</th>
                <th>排序</th>
                <th>可见</th>
                <th>操作
                    <button type="button" class="layui-btn">
                        <a href="${context.contextPath}/menu/toEdit?flag=2">添加根菜单</a>
                </th>
                </button>
            </tr>
        <#macro bpTree menuList ,a ,parentMenu>
            <#if menuList?? >
                <#list menuList as menu>
                    <tr>
                        <th>
                            <#if a==1>
                                <li class="li">${menu.mname}</li>
                            <#else>
                                <ul style="padding-left:50px;"><#list 2..a as i><#if i !=2>
                                <ul style="padding-left:50px;"></#if></#list>${menu.mname}<#list 2..a as i><#if i !=2></ul></#if></#list>
                                </ul></#if>
                        </th>
                        <th>${(menu.url)!""}</th>
                        <th>${(menu.sort)!""}</th>
                        <th>${(menu.state==1)?string("可见","不可见")}</th>
                        <th><a href="${context.contextPath}/Menu/toEdit?mid=${menu.mid}&flag=2">
                            <button type="button" class="layui-btn">
                                添加下级菜单
                            </button>
                        </a>
                            <a href="${context.contextPath}/Menu/toEdit?mid=${menu.mid}&flag=1&selectId=${(menu.mid)!""}">
                                <button type="button" class="layui-btn">
                                    修改
                                </button>
                            </a>

                            <a href="${context.contextPath}/Menu/delete?mid=${menu.mid}&flag=1">
                                <button type="button" class="layui-btn">
                                    删除
                                </button>
                            </a>
                        </th>
                    </tr>
                    <!-- freemarker递归调用 -->
                    <@bpTree menu.menuList,a+1 , menu/>
                </#list>
            </#if>
        </#macro>
            <!--freemarker宏-->
        <@bpTree menuList , 1,menuList/>
        </table>

    </div>



</body>
</html>
