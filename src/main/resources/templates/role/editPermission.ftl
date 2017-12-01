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
    <!-- 模态框（Modal） -->
    <div id="myModalTest" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
                </div>
                <div class="modal-body" id="myModalContent">在这里添加一些文本</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    <button type="button" id="myModalButton" class="btn btn-primary">提交更改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <input type="hidden" name="parentMenuId" value="${(parentMenu.mid)!""}"/>
    <div class="row">
        <div class="col-sm-5">
            <h3>添加或修改权限</h3>
            <table class="table">
                <tr>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>

                    <td>已选菜单名字</td>
                    <input name="menuId" type="hidden"/>
                    <td class="parentMenuName">
                    </td>
                </tr>
                <tr>

                    <td>修改权限请先选择权限</td>
                    <input name="id" type="hidden"/>
                    <td class="">
                        <select style="height: 50%;width: 50%" class="selectPermissionId form-control">
                            <option>修改请先选择权限</option>
                        <#list permissionList as p >
                            <option data-url="${(p.url)!""}" data-name="${(p.name)!""}"
                                    data-mid="${(p.mid)!""}" value="${(p.id)!""}">${(p.name)!""}</option>
                        </#list>
                        </select>
                    </td>
                </tr>
                <tr>

                    <td>名字</td>
                    <td>
                        <input name="name" style="height: 50%;width: 50%" id="name" class="form-control"/>
                    </td>
                </tr>
                <tr>

                    <td>url:多个url用||隔开如：/user||/test</td>
                    <td>
                        <input name="url" style="height: 50%;width: 50%" class="form-control"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <button type="button" id="savePermission" class="btn btn-success">提交</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">友情提示：新增权限不要选择权限。</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <h3>请注意：下列url没有分配对应的权限</h3>
                        <br/>
                    <#list p?keys as key>
                        url :${key}<br/>对应项目里面的方法:${p["${key}"].declaringClass}<br/>
                    </#list>
                    </td>
                </tr>
            </table>
        </div>
        <!-- ztree start -->


        <div class="col-sm-5">
            <h3>选择权限归属的菜单</h3>
            <div class="zTreeDemoBackground left">
                <ul id="treePermission" class="ztree"></ul>
            </div>

        </div>
    </div>
</div>
<link rel="stylesheet" href="${context.contextPath}/js/plugin/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${context.contextPath}/js/plugin/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${context.contextPath}/js/common/editPermission.js"></script>
<script type="text/javascript" src="${context.contextPath}/js/common/BaseUtil.js"></script>
<script type="text/javascript">
    $(function() {
        $(".selectPermissionId").change(function() {
            var _this=$(".selectPermissionId option:selected");
            var url=_this.data("url");
            var name=_this.data("name");
            var mid=_this.data("mid");
            $("[name=name]").val(name);
            $("[name=url]").val(url);
            $("[name=id]").val(_this.val());
            $("[name=menuId]").val(mid);
        })
    })
</script>


</body>
</html>
