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
        <div class="col-sm-5">
            <h3>菜单编辑</h3>
            <form method="post" action="/menu/edit" class="menuEdit" enctype="multipart/form-data">
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
                        <img width="50px" src="/image/${(currentMenu.logoFileName)!""}"></td>
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
    <#if !(currentMenu.mid)??>


        <div class="col-sm-5">
            <h3>选择父级菜单</h3>
            <div class="zTreeDemoBackground left">
                <ul id="treePermission" class="ztree"></ul>
            </div>

            <script type="text/javascript">
                var setting={
                    data: {
                        simpleData: {
                            enable: true,
                            idKey: "id",
                            pIdKey: "pId",
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
                    $.post("/menu/menuChild?parentId=${(parentMenu.mid)!""}",{},function(jsonResult) {
                        $.fn.zTree.init($("#treePermission"),setting,jsonResult);
                    });
                });
            </script>
        </div>
    </#if>
    </div>
</div>


</body>
</html>
