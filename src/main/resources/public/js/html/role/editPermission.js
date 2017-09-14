$(function() {
    var setting={
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: 0
            }
        },callback: {
            onClick: function(events,treeId,treeNode) {
                $(".parentMenuName").html(treeNode.name);
                $("[name=menuId]").val(treeNode.id);
            }
        }
    };
    // 查询子节点
    function getAsyncUrl(treeId,treeNode) {
        return "<%=request.getContextPath()%>/auth/permission/getTreeSubNode";
    }

    $(document).ready(function() {
        var id=$("[name=parentMenuId]").val();
        $.post("/menu/menuChild?parentId=" + id,{},function(jsonResult) {
            $.fn.zTree.init($("#treePermission"),setting,jsonResult);
        });
    });

    $("#savePermission").click(function() {
        var self=$(this);
        var menuId=$("[name=menuId]").val();
        var permissionId=$("[name=permissionId]").val();
        if(!menuId>0) {
            myModal("myModalTest","错误","请选择菜单。",function() {
            });
            return;
        }
        var url=$("[name=url]").val();
        var name=$("[name=name]").val();
        if(!name) {
            myModal("myModalTest","错误","请输入名字。",function() {});
            return;
        }
        if(!url) {
            myModal("myModalTest","错误","请输入url。",function() {});
            return;
        }
        var data={};
        data.permissionId=permissionId;
        data.mid=menuId;
        data.url=url;
        data.name=name;
        data.id=$("[name=id]").val();
        $.ajax({
            type: "POST",
            url: "/permission/addMenu",
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
            }
        });

    });
});