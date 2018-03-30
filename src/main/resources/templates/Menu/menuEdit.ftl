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
        <div class="col-sm-5">
            <h3>菜单编辑</h3>
            <form method="post" action="${context.contextPath}/menu/edit" class="menuEdit" enctype="multipart/form-data">
                <table class="table">
                <#if (parentMenu.rank)??>
                    <input type="hidden" name="rank" value="${parentMenu.rank+1}">
                </#if>
                    <input type="hidden" name="pid" value="${(parentMenu.mid)!""}">
                    <input type="hidden" name="mid" value="${(currentMenu.mid)!""}">
                    <tr>
                        <td>上级菜单名字</td>
                        <td class="parentMenuName">
                        ${(parentMenu.mname)!""}
                        </td>
                    </tr>

                    <td>名称</td>
                    <td><input name="mname" value="${(currentMenu.mname)!""}"></td>
                    <td></td>
                    </tr>
                    <tr>
                        <td>链接</td>
                        <td><input name="url" value="${(currentMenu.url)!""}"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>已有logo</td>
                    <td>
                    <#if (currentMenu.logoFileName)??>
                        <img width="50px" src="${context.contextPath}/image/${(currentMenu.logoFileName)!""}"></td>
                    <#else>
                        暂无
                    </#if>
                        <td></td>
                    </tr>
                    <tr>
                        <td>logo</td>
                        <td><input type="file" name="logoUrl"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>排序</td>
                        <td><input name="sort" value="${(currentMenu.sort)!""}"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>可见</td>
                        <td>
                        <#if (currentMenu.state)??>
                            <input ${(currentMenu.state==1)?string("checked='checked'","")} name="state" value="1"
                                                                                            type="radio">可见
                            <input ${(currentMenu.state!=1)?string("checked='checked'","")} name="state" value="0"
                                                                                            type="radio">不可见
                        <#else>
                            <input checked='checked' name="state" value="1" type="radio">可见
                            <input name="state" value="0" type="radio">不可见
                        </#if>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <button class="btn btn-success">提交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <!-- ztree start -->
    <#--<#if !(currentMenu.mid)??>-->

        <link rel="stylesheet" href="${context.contextPath}/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
        <script type="text/javascript" src="${context.contextPath}/plugins/ztree/js/jquery.ztree.core-3.5.js"></script>
        <div class="col-sm-5">
            <h3>选择父级菜单</h3>
            <div class="zTreeDemoBackground left">
                <ul id="treePermission" class="ztree"></ul>
            </div>

            <script type="text/javascript">
                var setting={
                    check:{enable :true},
                    data: {
                        simpleData: {
                            enable: true,
                            idKey: "id",
                            pIdKey: "parentId",
                            rootPId: 0
                        }
                    },callback: {
                        onClick: function(events,treeId,treeNode) {
                            $(".parentMenuName").html(treeNode.name);
                            $("[name=pid]").val(treeNode.id);
                        }
                    }
                };

                // 查询子节点
                function getAsyncUrl(treeId,treeNode) {
                    return "<%=request.getContextPath()%>/auth/permission/getTreeSubNode";
                }
                $(document).ready(function() {
                    $.post(contextPath+"/Menu/menuChild?parentId=${(parentMenu.mid)!""}",{},function(jsonResult) {
                        $.fn.zTree.init($("#treePermission"),setting,jsonResult);
                    });
                });
            </script>
        </div>
    <#--</#if>-->
    </div>
</div>


</body>
</html>
