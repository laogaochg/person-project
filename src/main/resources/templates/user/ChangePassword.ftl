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
    <script type="text/javascript" src="${context.contextPath}/js/common/BaseUtil.js"></script>

    <div style="padding:5px" class="row">
        <div class="col-sm-1">
        </div>
        <div class="col-sm-4">
            <h3>登录账号：
            ${user.email}
            </h3>
        </div>
    </div>
    <form class="form-horizontal" method="post" action="/user/changePassword">
        <div class="form-group">
            <label for="oldPassword" class="col-sm-1 control-label">旧密码：</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="oldPassword">
            </div>
        </div>
        <div class="form-group">
            <label for="newPassword1" class="col-sm-1 control-label">新密码：</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="newPassword1">
            </div>
        </div>
        <div class="form-group">
            <label for="newPassword2" class="col-sm-1 control-label">确认新密码：</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="newPassword2">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-5">
                <button type="button" class="btn btn-success toChangePassword">确 认</button>
            </div>
        </div>
    </form>
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
                    <button type="button" id="myModalButton" class="btn btn-primary">确定</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</div>
<script type="text/javascript">
    $(function() {
        $(".toChangePassword").click(function() {
            var newPassword1=$("#newPassword1").val();
            var newPassword2=$("#newPassword2").val();
            var oldPassword=$("#oldPassword").val();
            if(!newPassword1|| !newPassword2|| !oldPassword) {
                myModal("myModalTest","错误","请确定你输入的信息完整。",function() {});
                return;
            }
            if(newPassword1!=newPassword2) {
                myModal("myModalTest","错误","新密码两次不一致。",function() {});
                return;
            }
            var data={};
            data.newPassword=newPassword1;
            data.oldPassword=oldPassword;
            $.ajax({
                type: "POST",
                url: "/user/changePassword",
                data: data,
                success: function(data) {
                    if(data.code==200) {
                        myModal("myModalTest","成功",data.mes,function() {
                            location.reload();
                        });
                    } else {
                        myModal("myModalTest","失败",data.mes,function() {
                            location.reload();
                        });
                    }
                },error: function(data) {
                    myModal("myModalTest","失败",data.mes,function() {
                        location.reload();
                    });
                }
            });
        });
    });
</script>
</body>
</html>
