<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>平面运营后台</title>
<#include "../../common/baseImport.ftl" />
    <style>
        .editItemClass {
            width: 80%;
            margin-top: 60px;
        }

        .layui-form-label {
            width: 104px;
        }

        .edit_form_info {
            margin-bottom: 15px;
            margin-left: 41px;
        }
        .layui-inline{
            width: 450px;
        }
    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin" style="">
<#include "../../common/left_mune.ftl" />
    <div class="layui-body">
        <div class="fl title-body">
            添加品牌
        </div>
        <div class="editItemClass layui-row">
            <form class="layui-form layui-col-xs6" action="${context.contextPath}/permission/editPermission"
                  method="post">
                <input name="id" value="${(item.id)!""}" type="hidden">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">名字</label>
                        <div class="layui-input-block">
                            <input name="name" value="${(item.name)!""}" placeholder="请输入名字" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">url:</label>
                        <div class="layui-input-block">
                            <input name="url" value="${(item.url)!""}" placeholder="请输入url" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">对应菜单名字</label>
                        <div class="layui-input-block">
                            <input name="menuName" readonly="readonly" value="${(item.url)!""}"  class="layui-input">
                            <input name="mid" type="hidden"  class="layui-input">
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
                    </div>
                </div>
            </form>
            <link rel="stylesheet" href="${context.contextPath}/js/plugin/ztree/css/zTreeStyle/zTreeStyle.css"
                  type="text/css">
            <script type="text/javascript"
                    src="${context.contextPath}/js/plugin/ztree/js/jquery.ztree.core-3.5.js"></script>
            <div class="layui-col-xs6">

                <h3>选择父级菜单</h3>
                <div class="zTreeDemoBackground left">
                    <ul id="treePermission" class="ztree"></ul>
                </div>

                <script type="text/javascript">
                    var setting = {
                        check: {enable: true},
                        data: {
                            simpleData: {
                                enable: true,
                                idKey: "id",
                                pIdKey: "parentId",
                                rootPId: 0
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
                        $.post(contextPath + "/menu/menuChild?parentId=${(parentMenu.mid)!""}", {}, function (jsonResult) {
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
            //监听提交 要求提交按钮有lay-submit
            //edit_item_form会对应lay-filter里面的值
            form.on('submit(edit_item_form)', function (data) {
                console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
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
                            window.location.href = contextPath + "/permission/list?selectMenuIdForIntropect=148"
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
<link rel="stylesheet" href="${context.contextPath}/css/index/upimg.css">
<script src="${context.contextPath}/js/common/imgUp.js"></script>
</body>
</html>