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
    <style>
        .head-title {
            font-size: 30px;
            margin-left: 33%;
            height: 25px;
            color: #e62416;
        }

        .role-info {
            border: 1px solid #e1e1e8;
            height: 35px;
            line-height: 35px;
        }

        tr .role-th {
            border-top: 1px solid #ddd;
            border-right-color: rgb(225, 225, 232);
            border-right-style: solid;
            border-right-width: 2px;
            width: 50%;
        }

        .next-menu {
            padding-left: 35px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            //关闭下面的菜单的点击事件
            $(".close-menu").click(function (a, b) {
                //选中的菜单
                var selectMenuId = $(a.target).data("mid");
                var childMenus = $("tr[data-pid=" + selectMenuId + "]");
                for (i = 0; i < childMenus.length; i++) {
                    var item = $(childMenus[i]);
                    if (item.data("toShow")) {
                        item.show(200);
                        item.data("toShow",false);
                    } else {
                        item.hide(200);
                        item.data("toShow",true);
                    }
                    var thirds = $("tr[data-pid=" + item.data("mid") + "]")
                    for (j = 0; j < thirds.length; j++) {
                        var third = $(thirds[j]);
                        if (!item.data("toShow")) {
                            third.show(200);
                            third.data("toShow",false);
                        } else {
                            third.hide(200);
                            third.data("toShow",true);
                        }
                    }
                }
            });
        })
    </script>
</head>
<body>
<div class="layui-layout layui-layout-admin" style="">
<#include "../common/left_mune.ftl" />
    <div class="layui-body">
        <div class="layui-container">
            <div style="height: 37px;">
                <h1 class="head-title" style="">权限管理</h1>
            </div>
            <div class="row role-info">
                <li>当前角色名字：${role.name} | 类型：${role.type}</li>
            </div>
            <div class="row">
                <form action="/role/editRolePermission" method="post">
                    <input type="hidden" name="roleId" value="${role.id}"/>
                    <table class="table">
                        <tr>
                            <th class="role-tr">菜单名字</th>
                            <th class="role-tr">权限</th>
                        </tr>
                    <#macro bpTree menuList ,a ,parentMenu>
                        <#if menuList?? >
                            <#list menuList as menu>
                                <tr class="role-tr" data-mid="${menu.mid}" data-pid="${(menu.pid)!""}">
                                    <th class="role-th">
                                        <#if a==1>
                                            <div>
                                                <span data-mid="${menu.mid}"
                                                      data-pid="${(menu.pid)!""}"
                                                      style="display: inline-block;"
                                                      class="close-menu stateIcon glyphicon glyphicon-triangle-bottom"
                                                      aria-hidden="false"></span>
                                                <li style="display: inline-block;" class="li ">${menu.mname}</li>
                                            </div>
                                        <#else>
                                            <ul class="next-menu">
                                                <#list 2..a as i>
                                                    <#if i !=2>
                                                    <ul class="next-menu">
                                                    </#if>
                                                </#list>
                                                <#if ((menu.menuList)?size>0) >
                                                    <span data-mid="${menu.mid}"
                                                          data-pid="${(menu.pid)!""}"
                                                          class="close-menu stateIcon glyphicon glyphicon-triangle-bottom"
                                                          aria-hidden="false"></span>
                                                </#if>
                                            ${menu.mname}
                                                <#list 2..a as i>
                                                    <#if i !=2>
                                                    </ul></#if>
                                                </#list>
                                            </ul></#if>
                                    </th>
                                    <th class="">
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
</div>

</body>
</html>
