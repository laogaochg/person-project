<!DOCTYPE html>
<html lang="en">
<head>
<#include "../common/baseImport.ftl" />
    <title>as</title>
    <style>
        li{list-style:none;}
    </style>
</head>
<body>

<#include "../common/left_mune.ftl" />
<div class="container rightContent">

    <div class="row">
        <h3>权限管理</h3></div>
    <div class="row">
        <li>当前角色名字：${role.name} | 类型：${role.type}</li>
    </div>
    <div class="row">
        <form action="/role/editRolePermission" method="post">
            <input type="hidden" name="roleId" value="${role.id}"/>
            <table class="table">
                <tr>
                    <th>菜单名字</th>
                    <th>权限</th>
                </tr>
            <#macro bpTree menuList ,a ,parentMenu>
                <#if menuList?? >
                    <#list menuList as menu>
                        <tr>
                            <th>
                                <#if a==1>
                                    <li class="li">${menu.mname}</li>
                                <#else>
                                    <ul style="padding-left:30px;" ><#list 2..a as i><#if i !=2>
                                    <ul style="padding-left:30px;" ></#if></#list>${menu.mname}<#list 2..a as i><#if i !=2></ul></#if></#list>
                                    </ul></#if>
                            </th>
                            <th>
                                <#if (permissionMap[menu.mid+""])??>
                                    <#list permissionMap[menu.mid+""] as permission >

                                        <input type="checkbox" name="permissionIds"
                                               <#if havingPermissionIds?seq_contains(permission.id)>checked="checked"</#if>
                                               value="${permission.id}">${permission.name}<br/>
                                    </#list>
                                </#if>
                            </th>
                        </tr>
                        <!-- freemarker递归调用 -->
                        <@bpTree menu.menuList,a+1 , menu/>
                    </#list>
                </#if>
            </#macro>
                <!--freemarker宏-->
            <@bpTree menuList , 1,menuList/>
                <tr>
                    <th></th>
                    <th>
                        <button class="btn btn-warning">保存</button>
                    </th>
                </tr>
            </table>

        </form>
    </div>


</div>

</div>


</body>
</html>
