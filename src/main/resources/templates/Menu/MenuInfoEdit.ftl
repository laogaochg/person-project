<!DOCTYPE HTML>
<html>

<head>
    <title>菜单管理</title>
<#include "../inc.ftl" />
</head>
<body>
<form name="form" class="layui-form layui-form-pane" style="margin-top: 20px;" method="post" action="">
    <input type="hidden" name="mid"/>
    <input type="hidden" name="rank"/>
    <input type="hidden" name="pid"/>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="color:#F00">菜单名称</label>
            <div class="layui-input-inline">
                <input type="text" name="mname" placeholder="请输入" maxlength="50" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="color:#F00">菜单排序</label>
            <div class="layui-input-inline">
                <input type="tel" name="sort" placeholder="请输入" maxlength="3" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">URL</label>
        <div class="layui-input-inline">
            <input type="text" name="url" placeholder="请输入" autocomplete="off" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item" pane="">
        <label class="layui-form-label">可见性</label>
        <div class="layui-input-block">
            <input type="radio" checked name="state" value="1" title="可见">
            <input type="radio" name="state" value="0" title="隐藏">
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
    //得到页面传过来的数据
    var urlParams = getRequestParam();
    var mid = urlParams.mid;
    //type :1:添加根菜单,2:添加下级菜单,3 修改菜单
    var type = urlParams.type;
    pid = urlParams.pid;
    if (type == 2) {
        mid = urlParams.pid;
    }
    console.debug(urlParams);
    layui.use(['form', 'layedit', 'laydate', 'jquery'], function () {
        var form = layui.form;
        getMenuDetail(mid, function (data) {
            console.debug(inputData, data);
            var inputData = {};
            if (type == 1) {
                inputData.rank = 1;
            } else if (type == 2) {
                inputData.pid = mid;
                inputData.rank = data.rank + 1;
            } else if (type == 3) {
                inputData = data;
            }
            pubUtil.load($("[name=form]"), inputData);//填充表单
            form.render(); //更新全部
        })
        //监听提交
        form.on('submit(btnSubmit)', function (data) {
            var index = layer.load(1);//开启进度条
            $.ajax({
                url: contextPath + '/Menu/edit',
                data: data.field,
                type: 'POST',
                dataType: 'json',
                success: function (obj) {
                    layer.close(index);//关闭
                    if (obj.success) {
                        pubUtil.msg(obj.msg, layer, 1, function () {
                            $("#close").click();
                        }, 3 * 1000);
                    } else {
                        pubUtil.msg(obj.msg, layer, 2, function () {

                        }, 5 * 1000);
                    }
                }
            });
            return false;
        });
    });

    function getMenuDetail(id, _function) {
        if (id) {
            $.ajax({
                url: contextPath + '/Menu/MenuDetails?mid=' + id,
                success: function (r) {
                    _function(r.data);
                }
            });
        } else {
            _function(null);
        }
    }

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
</body>
</html>