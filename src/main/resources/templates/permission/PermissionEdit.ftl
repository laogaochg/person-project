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
<script type="text/javascript" src="${context.contextPath}/plugins/ztree/js/jquery-1.4.4.js"></script>
<link rel="stylesheet" href="${context.contextPath}/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${context.contextPath}/plugins/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${context.contextPath}/plugins/ztree/js/jquery.ztree.excheck-3.5.js"></script>
<div class="layui-layout layui-layout-admin" style="">
    <div class="layui-body">
        <div class="fl title-body">
            添加品牌
        </div>
        <div class="editItemClass layui-row">
            <form class="layui-form layui-col-xs6 layui-form-pane"
                  action="${context.contextPath}/permission/editPermission" name="form"
                  method="post">
                <input name="id" value="${(item.id)!""}" type="hidden">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">名字</label>
                        <div class="layui-input-block">
                            <input name="name" type="text" value="${(item.name)!""}" placeholder="请输入名字"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">url:</label>
                        <div class="layui-input-block">
                            <input name="url" type="text" value="${(item.url)!""}" placeholder="请输入url"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">对应菜单名字</label>
                        <div class="layui-input-block">
                            <input name="menuName" type="text" readonly="readonly" value="${(item.url)!""}"
                                   class="layui-input">
                            <input name="mid" type="hidden" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="edit_form_info">
                    (多个url用||分开，如:/a||/b;)
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="edit_item_form">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        <button class="layui-btn" type="button" onclick="gotoUrl('/permission/PermissionList')">返回权限列表
                        </button>
                    </div>
                </div>
            </form>
            <div class="layui-col-xs6">

                <h3>选择权限归属的菜单</h3>
                <div class="zTreeDemoBackground left">
                    <ul id="treePermission" class="ztree"></ul>
                </div>

                <script type="text/javascript">

                    //获取传参
                    var data = {};
                    var params = getRequestParam();
                    if (params && params.id) {
                        data.id = params.id;
                    }else{
                        data.id = "";
                    }

                    var setting = {
                        data: {
                            simpleData: {
                                enable: true,
                                idKey: "id",
                                pIdKey: "pid",
                                rootPId: null
                            }
                        }, callback: {
                            onClick: function (events, treeId, treeNode) {
                                $("[name=menuName]").val(treeNode.name);
                                $("[name=mid]").val(treeNode.id);
                            }
                        }
                    };

                    // 查询子节点
                    function getAsyncUrl(treeId, treeNode) {
                        return "<%=request.getContextPath()%>/auth/permission/getTreeSubNode";
                    }

                    $(document).ready(function () {
                        $.post(contextPath + "/Menu/menuChild?onlyMenu=1&selectMenuId=" + data.id, {}, function (jsonResult) {
                            $.fn.zTree.init($("#treePermission"), setting, jsonResult);
                        });
                    });
                </script>
            </div>
        </div>
    </div>
</div>

</div>
<!--编辑器-->
<script>


    $(function () {
        layui.use(['form', 'layedit', 'laydate'], function () {
            var form = layui.form, layer = layui.layer;

            if (data.id) {
                $.ajax({
                    url: contextPath + '/permission/list?permissionId=' + data.id,
                    type: 'POST',//默认以get提交，以get提交如果是中文后台会出现乱码
                    success: function (obj) {
                        data = obj.data[0];
                        pubUtil.load($("[name=form]"), data);//填充表单
                    }
                });
            }

            //监听提交 要求提交按钮有lay-submit
            //edit_item_form会对应lay-filter里面的值
            form.on('submit(edit_item_form)', function (data) {
                var inputData = "1=1";
                for (var k in data.field) {
                    inputData += "&" + k + "=" + data.field[k];
                }
                console.log(inputData);
                _ajaxUpdate(inputData);
                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            });
        });
    });

    //请求修改事件
    function _ajaxUpdate(_data) {
        layui.use('layer', function () {
            layer.confirm('您确定要提交吗？', {
                btn: ['确定', '取消']    //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "${context.contextPath}/permission/editPermission",
                    data: _data,
                    success: function (data) {
                        var msg;
                        if (data.code == 200) {
                            msg = "修改成功。";
                        } else {
                            msg = "修改失败。";
                        }
                        layer.confirm(msg, {
                            btn: ['确定']    //按钮
                        }, function () {
                            gotoUrl("/permission/PermissionList");
                        });
                    }, error: function () {
                        layer.confirm('发送请求失败！请联系相关客服。', {
                            btn: ['确定']    //按钮
                        });
                    }
                });
            });
        });
    }
</script>
</body>
</html>