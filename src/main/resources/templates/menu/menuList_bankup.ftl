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
</head>
<body>

<#include "../common/left_mune.ftl" />
<div class="container rightContent">
    <div class="row">
        <div class="col-sm-3">
        <#include "../common/left_mune.ftl" />
        </div>
        <div class="col-sm-9">
            <h3>菜单权限管理</h3>
            <table class="table">
                <tr>
                    <th> 添加二级菜单：
                        <br/>
                        <form action="/menu/addMenu">
                            请选择一级菜单:
                            <select name="pId">
                                <option></option>
                            <#list menuList as menu>
                                <option value="${menu.mid}">${menu.mname}</option>
                            </#list>
                            </select>
                            <br/>
                            名字<input name="name"/><br/>
                            url<input name="url"/>
                            <button>提交</button>
                        </form>
                    </th>
                    <th> 添加三级菜单：
                        <br/>
                        <form action="/menu/addMenu">
                            请选择二级菜单:
                            <select name="pId">
                                <option></option>
                                <#list menuList as menu>
                                    <#list menu.menuList as menu2>
                                        <option value="${menu2.mid}">${menu2.mname}</option>
                                    </#list>

                                </#list>
                            </select>
                            <br/>
                            名字<input name="name"/>
                            <button>提交</button>
                        </form>
                    </th>


                </tr>
                <tr>
                    <th>
                        没有分配三级菜单的权限：<br/>
                        <#list permissions as permission>
                        ${permission.name}
                        </#list>
                    </th>
                    </tr>
                <tr>
                    <th>
                        <form action="/permission/addMenu" >
                            选择没有分配菜单的权限：
                            <select name ="permissionId">
                                <option></option>
                                <#list permissions as permission>
                                    <option value="${permission.id}"> ${permission.name}</option>
                                </#list>


                            </select>
                            <br/>
                            选择三级菜单：
                            <select name="menuId">
                                <option></option>
                            <#list menuList as menu>
                                <#list menu.menuList as menu2>
                                    <#list menu2.menuList as menu3>
                                        <option value="${menu3.mid}">${menu3.mname}</option>
                                    </#list>
                                </#list>

                            </#list>
                            </select>
                            <button >提交</button>
                        </form>
                    </th>
                </tr>
            </table>

        </div>
    </div>

</div>


</body>
</html>
