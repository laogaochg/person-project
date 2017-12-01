<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>平面运营后台</title>
<#include "../../common/baseImport.ftl" />
    <!-- style.css是项目的样式文件  -->
    <style>
        .editItemClass {
            width: 45%;
        }
    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin" style="">
<#include "../../common/left_mune.ftl" />
    <div class="layui-body">
        <h3>
            添加品牌
        </h3>
        <div class="editItemClass">
            <form class="layui-form" action="${context.contextPath}/brand/editBrand" method="post">
                <input name="brandId" value="${(item.id)!""}" type="hidden">
                <div class="layui-form-item">
                    <label class="layui-form-label">单行输入框</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">验证必填项</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</div>
<!--编辑器-->
<script>
    $(function () {
        layui.use(['form', 'layedit', 'laydate'], function () {
            var form = layui.form, layer = layui.layer;
        });
        //监听提交
        form.on('submit(editForm)', function (data) {
            return verifyForm(data);
        });
    });
</script>
<link rel="stylesheet" href="${context.contextPath}/css/index/upimg.css">
<script src="${context.contextPath}/js/common/imgUp.js"></script>
</body>
</html>