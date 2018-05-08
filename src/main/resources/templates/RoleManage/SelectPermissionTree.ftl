<!DOCTYPE HTML>
<html>

<head>
    <title>权限管理</title>
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
<h3>权限管理</h3>
<div class="zTreeDemoBackground left">
    <ul id="treePermission" class="ztree"></ul>
</div>
<script type="text/javascript" src="${context.contextPath}/plugins/ztree/js/jquery-1.4.4.js"></script>
<link rel="stylesheet" href="${context.contextPath}/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${context.contextPath}/plugins/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${context.contextPath}/plugins/ztree/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript">
    var params = getRequestParam();
    var setting = {
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pid",
                rootPId: null
            }
        }, callback: {
            onClick: function (events, treeId, treeNode) {
//                    console.log(treeId,treeNode);
                $("[name=menuName]").val(treeNode.name);
                $("[name=mid]").val(treeNode.id);
            }
        }
    };
    setting.check.chkboxType = {"Y": "p", "N": "s"};


    $(document).ready(function () {
        $.post(contextPath + "/Menu/menuChild?roleId=" + params.roleId, {}, function (jsonResult) {
            $.fn.zTree.init($("#treePermission"), setting, jsonResult);
        });
    });
    var layerObj;
    layui.use(['form', 'jquery', 'layer'], function () {
        layerObj = layer;
    })

    function roleAddPermission() {
        var zTree = $.fn.zTree.getZTreeObj("treePermission");
        //        $('button#close').click();
        var contents = "roleId="+params.roleId;
        var selectNote = zTree.getCheckedNodes(true);
        for (var i = 0; i < selectNote.length; i++) {
            var note = selectNote[i];
            if(note.permissionId){
                contents += "&permissionIds=" + note.permissionId;
            }
        }
        console.debug(contents);
        $.ajax({
            url: contextPath + '/RoleManage/editRolePermission',
            data: contents,
            type: 'POST',
            success: function (obj) {
                layerObj.open({
                    content: obj.msg,
                    yes: function (lockIndex) {
                        if (obj.success) {
                            $('button#close').click();
                        } else {
                            layerObj.close(lockIndex);
                        }
                    }
                });
            }
        });
    }

</script>
<button style="display: none" type="button" id="btnSubmit" onclick="roleAddPermission()">选的东西</button>
<button style="display: none" class="layui-btn layui-btn-primary" id="close">关闭</button>
</body>
</html>