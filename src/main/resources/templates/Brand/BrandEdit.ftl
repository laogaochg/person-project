<!DOCTYPE HTML>
<html>

<head>
    <title>品牌管理</title>
    <script type="text/javascript">

        var path = '${context.contextPath}';
        var basePath = window.location.protocol + "//"
                + window.location.host
                + path + "/";
    </script>
<#include "../inc.ftl" />
</head>
<body>
<form name="form" class="layui-form layui-form-pane" style="margin-top: 20px;" method="post" action="">
    <input type="hidden" name="brandId">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="color:#F00">品牌名称</label>
            <div class="layui-input-inline">
                <input type="text" name="brandName" placeholder="请输入" maxlength="50" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="color:#F00">品牌官网地址</label>
            <div class="layui-input-inline">
                <input type="text" name="brandWebsite" placeholder="请输入" maxlength="50" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="color:#F00">品牌排序</label>
            <div class="layui-input-inline">
                <input type="tel" name="brandOrder" placeholder="请输入" maxlength="3" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">URL</label>
        <div class="layui-input-inline">
            <input type="text" name="menuUrl" placeholder="请输入" autocomplete="off" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">LOGO</label>
        <input type="hidden" name="brandLogo" value="2" >
        <div class="layui-input-block">
            <img id="BrandLogo" src="brandLogo">
        </div>
    </div>
    <div style="width: 95%;height: 400px">
        <div class="">
            <!-- 加载编辑器的容器 -->
            <script id="container" name="brandDesc" type="text/plain">
            </script>
        </div>
    </div>

    <!-- 按钮组 -->
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="btnSubmit">立即提交</button>
            <button class="layui-btn" type="button" onclick="gotoUrl('/Brand/BrandList')">关闭</button>
        </div>
    </div>
</form>
<script src="${context.contextPath}/plugins/ueditor/ueditor.config.js"></script>
<script src="${context.contextPath}/plugins/ueditor/ueditor.all.js"></script>
<style>
    .edui-default {
        height: 300px;
        display: inline-block;
    }
</style>
<script type="application/javascript">
    //获取传参
    var data = {};
    var params = getRequestParam();
    console.log(params);
    if (params && params.id) {
        data.brandId = params.id;
    }
    var ue;
    layui.use(['form', 'layedit', 'laydate', 'jquery', 'layer'], function () {
        var form = layui.form;
        //请求得到编辑东西的详情
        if (data.brandId) {
            $.ajax({
                url: contextPath + '/brand/BrandDetails?brandId=' + data.brandId,
                type: 'POST',//默认以get提交，以get提交如果是中文后台会出现乱码
                success: function (obj) {
                    if (obj.success) {
                        data = obj.data;
                        pubUtil.load($("[name=form]"), data);//填充表单
                        $('#BrandLogo').attr("src", data.brandLogo);
                        $("#container").text(data.brandDesc);
                        ue = UE.getEditor('container', {
                            autoHeightEnabled: false,
                            autoFloatEnabled: false
                        });
                    } else {
                        pubUtil.msg(obj.msg, layer, 2, function () {
                        }, 5 * 1000);
                    }
                }
            });
        } else {
            ue = UE.getEditor('container', {
                autoHeightEnabled: false,
                autoFloatEnabled: false
            });
        }
        //监听提交
        form.on('submit(btnSubmit)', function (data) {
            var bar = layer.load(1);//开启进度条
            layer.open({
                title: '提示'
                , content: '确定要执行操作?'
                , btn: ['确定', '取消']
                , btnAlign: 'c' //按钮居中
                , shade: 0 //不显示遮罩
                , yes: function (c) {
                    layer.close(c);
                    $.ajax({
                        url: contextPath + '/brand/editBrand',
                        data: data.field,
                        type: 'POST',
                        success: function (obj) {
                            layer.close(bar);//关闭进度条
                            if (obj.success) {
                                $("#close").click();
                                layer.open({
                                    content: obj.msg,
                                    yes: function () {
                                        gotoUrl("/Brand/BrandList");
                                    }
                                });
                            } else {
                                pubUtil.msg(obj.msg, layer, 3, function () {
                                }, 3 * 1000);
                            }
                        }
                    });
                }
                , btn2: function () {
                    layer.close(bar);//关闭进度条
                }
            });
            return false;
        });
    });

</script>
</body>
</html>