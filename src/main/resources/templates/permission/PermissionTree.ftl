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
        $.post(contextPath + "/Menu/menuChild?parentId=${(parentMenu.mid)!""}", {}, function (jsonResult) {
            console.debug(setting);
            $.fn.zTree.init($("#treePermission"), setting, jsonResult);
        });
    });

    function getSelectedNode() {
        var zTree = $.fn.zTree.getZTreeObj("treePermission")
        console.debug(zTree.getCheckedNodes(true));
    }
</script>
<#--<button type="button" onclick="getSelectedNode()">选的东西</button>
<button type="button" onclick="gotoUrl('/permission/PermissionList')">去列表</button>-->
</body>
</html>