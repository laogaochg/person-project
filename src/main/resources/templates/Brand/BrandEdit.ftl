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
        <div class="layui-input-block">
            <img id="BrandLogo" src="brandLogo">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="" style="width: 95%;height: 400px" id="container">

        </div>
    </div>

    <!-- 按钮组 -->
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="btnSubmit">立即提交</button>
            <button class="layui-btn layui-btn-primary" id="close">关闭</button>
        </div>
    </div>
</form>
<script>
    //获取传参
    var data = JSON.parse(decodeURIComponent(getRequestParam().obj));
    //请求得到编辑东西的详情，渲染页面
    $.ajax({
        url: '${context.contextPath}/brand/BrandDetails?id='+data.brandId,
        type: 'POST',//默认以get提交，以get提交如果是中文后台会出现乱码
        success: function (obj) {
            console.log(obj);
            if (obj.success) {
                $('#BrandLogo').attr("src",contextPath+ obj.data.brandLogo);
            } else {
                pubUtil.msg(obj.msg, layer, 2, function () {
                }, 5 * 1000);
            }
        }
    });

    layui.use(['form', 'layedit', 'laydate', 'jquery'], function () {
        var form = layui.form;

        //监听提交
        form.on('submit(btnSubmit)', function (data) {
            var index = layer.load(1);//开启进度条
            $.ajax({
                url: '${context.contextPath}/menuInf/modify.do',
                data: data.field,
                type: 'POST',//默认以get提交，以get提交如果是中文后台会出现乱码
                dataType: 'json',
                success: function (obj) {
                    layer.close(index);//关闭
                    if (obj.success) {
                        pubUtil.msg(obj.msg, layer, 1, function () {
                            $("#close").click();
                        }, 500);
                    } else {
                        pubUtil.msg(obj.msg, layer, 2, function () {

                        }, 5 * 1000);
                    }
                }
            });
            return false;
        });
    });

    //按钮的点击事件
    $('button#treeSelect').on('click', function () {
        parent.layer.open({
            type: 2,
            title: '选择<span style="color:red">[请单击选中]</span>',
            shadeClose: false,//点击遮罩关闭
            anim: public_anim,
            btnAlign: 'c',
            shade: public_shade,//是否有遮罩，可以设置成false
            maxmin: true, //开启最大化最小化按钮
            area: ['600px', '300px'],
            //area: ['100%', '100%'],
            boolean: true,
            content: ['MenuInfoTree.jsp', 'yes'], //iframe的url，no代表不显示滚动条
            btn: ['选择', '关闭']
            , yes: function (index, layero) {
                var body = $(layero).find("iframe")[0].contentWindow.document;
                var pid = body.getElementById("id").value;
                var pidNm = body.getElementById("name").value;
                $("#pidNm").val(pidNm);
                $("#pid").val(pid);
                parent.layer.close(index); //关闭当前弹层
            }
            , btn2: function (index, layero) {

            }
        });
    });


</script>
<script src="${context.contextPath}/plugins/ueditor/ueditor.config.js"></script>
<script src="${context.contextPath}/plugins/ueditor/ueditor.all.js"></script>
<script>
    var ue = UE.getEditor('container');
</script>
</body>
</html>