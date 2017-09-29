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
        <div class="col-md-2"></div>
        <div class="col-md-4"><h4>管理菜单</h4></div>
    </div>
    <div class="row">
        <table class="table .table-bordered">
            <tr>
                <th>名称</th>
                <th>链接</th>
                <th>排序</th>
                <th>可见</th>
                <th>操作
                    <button type="button" class="btn btn-default">
                        <a href="/menu/toEdit?flag=2">添加根菜单</a>
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
                                <ul style="padding-left:30px;"><#list 2..a as i><#if i !=2>
                                <ul style="padding-left:30px;"></#if></#list>${menu.mname}<#list 2..a as i><#if i !=2></ul></#if></#list>
                                </ul></#if>
                        </th>
                        <th>${(menu.url)!""}</th>
                        <th>${(menu.sort)!""}</th>
                        <th>${(menu.state==1)?string("可见","不可见")}</th>
                        <th><a href="/menu/toEdit?mid=${menu.mid}&flag=2">
                            <button type="button" class="btn btn-default">
                                添加下级菜单
                            </button>
                        </a>
                            <a href="/menu/toEdit?mid=${menu.mid}&flag=1&pid=${(menu.pid)!""}">
                                <button type="button" class="btn btn-default">
                                    修改
                                </button>
                            </a>

                            <a href="/menu/delete?mid=${menu.mid}&flag=1">
                                <button type="button" class="btn btn-default">
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

</div>


</body>
</html>
