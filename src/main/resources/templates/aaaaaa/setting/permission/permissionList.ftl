<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>平面运营后台</title>
<#include "../../common/baseImport.ftl" />
    <style>
        .addItemBtn {
            border-radius: 8px;
            margin-left: 100px !important;
        }

        .searchBtn {
            border-radius: 8px;
            padding: 0 14px;
            margin-left: 10px;
        }

        .title_div {
            height: 70px;
            display: block;
        }

        #pagination {
            margin-top: -4px;
            margin-left: 2px;
        }
    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin" style="">
<#include "../../common/left_mune.ftl" />
    <div class="layui-body">
        <div class="title_div">
            <div class="title-body">权限列表</div>
        </div>
        <div class="Popup">
            <div class="selBox">
                <form id="searchForm" method="post" action="${context.contextPath}/permission/list"
                      class="layui-form">
                    <input value="${(qo.keyword)!""}" name="keyword" placeholder="关键字"
                           class="input-text radius size-L inputstyle">
                    <input name="currentPage" value="${pageResult.currentPage}" type="hidden">
                    <input name="pageSize" value="${pageResult.pageSize}" type="hidden">
                    <button class="layui-btn layui-btn-normal searchBtn " lay-submit lay-filter="go">搜索</button>
                    <button class="layui-btn layui-btn-normal addItemBtn" type="button"
                            onclick="window.location.href='${context.contextPath}/permission/toEditPermission'">
                        添加权限
                    </button>
                </form>
            </div>
        </div>
        <!--  表格S  -->
        <div class="comTable layui-form">
            <table class="layui-table">
                <thead>
                <tr>
                    <th></th>
                    <th>ID</th>
                    <th>权限名称</th>
                    <th>url</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <#list pageResult.listData as item>
                <tr class="js-item item_tr" data-itemid="${item.id}">
                    <td style="width: 40px">
                        <input data-itemid="${item.id}" lay-skin="primary" lay-filter="selectAll"
                               class="selectItemInput" type="checkbox">
                    </td>
                    <td style="">${item.id}</td>
                    <td style="" class="">${(item.name)!""}</td>
                    <td style="" class="">${(item.url)!""}</td>
                    <td class="operation">
                        <a href="${context.contextPath}/permission/toEditPermission?id=${item.id}"
                           class="btn btn-default">
                            修改
                        </a>
                        <a onclick="_ajax('ids=${item.id}')" class="btn btn-default">
                            删除
                        </a>
                    </td>
                </tr>
                </#list>
            </table>
            <div class="tableFoot layui-row">
                <div class="footTxt layui-col-md4" style="margin-left: 15px">
                    <input type="checkbox" name="selectAll" lay-skin="primary" lay-filter="selectAll">
                    <button type="button" id="batchDeleteItem"
                            class="ml40 layui-btn layui-btn-primary layui-btn-big layuiBtn"
                            style="border-radius: 6px">
                        批量删除
                    </button>
                    共${pageResult.totalCount}条，每页
                    <select lay-ignore name="pageSizeSelect" class="form-control" style="width: 88px;">
                        <option>10</option>
                        <option>20</option>
                        <option>50</option>
                        <option>100</option>
                        <option>1000</option>
                    </select>
                    条数据
                </div>
                <div id="pagination" class="layui-col-md4"></div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    <#--layui-->
    layui.use(['form', 'laydate'], function () {
        var form = layui.form, layer = layui.layer;
        //监听提交
        form.on('submit(go)', function (data) {
            return verifyForm(data);
        });
        //监听checkbox
        form.on('checkbox(selectAll)', function (data) {
            // 全选事件
            var selectInputs = $(".selectItemInput");
            if (data.elem.name == "selectAll") {
                selectInputs.prop("checked", data.elem.checked);
            } else {
                var selectCount = 0;
                for (i = 0; i < selectInputs.length; i++) {
                    if (selectInputs[i].checked) {
                        selectCount++;
                    }
                }
                $("[name=selectAll]").prop("checked", selectInputs.length == selectCount);
            }
            form.render("checkbox"); //更新checkbox的渲染
        });
    });

    //表单校验
    function verifyForm(data) {
//        layer.alert(JSON.stringify(data.field), {
//            title: '最终的提交信息'
//        });
        return true;
    }

    $(function () {
        //初始化每页多少条数据下拉框
        $("[name=pageSizeSelect]").val(${qo.pageSize});
        $("[name=pageSizeSelect]").change(function () {
            $("[name=currentPage]").val(1);
            $("[name=pageSize]").val(this.value);
            $("#searchForm").submit();
        });
    })

    //分页代码
    $(function () {
        $('#pagination').twbsPagination({
            first: "首页",
            prev: "上一页",
            next: "下一页",
            last: "未页",
            startPage:${qo.currentPage},
            totalPages: ${pageResult.totalPage},
            visiblePages: ${qo.pageSize},
            onPageClick: function (event, page) {
                $("[name=currentPage]").val(page);
                $("#searchForm").submit();
            }
        });
    });
    //批量删除按钮
    $(function () {
        $("#batchDeleteItem").click(function () {
            var selectClass = $(".selectItemInput:checked");
            if (selectClass.length < 1) {
                layer.confirm('请选择要删除的权限', {
                    btn: ['确定']    //按钮
                })
                return;
            }
            var _data = "1=1";
            for (var i = 0; i < selectClass.length; i++) {
                var selectId = $(selectClass[i]).parents("tr").data("itemid");
                _data += "&ids=" + selectId;
            }
            _ajax(_data);
        });
    });

    //删除请求事件
    function _ajax(_data) {
        layui.use('layer', function () {
            layer.confirm('您确定要删除吗？', {
                btn: ['确定删除', '取消']    //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: contextPath + "/permission/batchDelete",
                    data: _data,
                    success: function (data) {
                        var msg;
                        if (data.code == 200) {
                            msg = "删除成功。";
                        } else {
                            msg = "删除失败。";
                        }
                        layer.confirm(msg, {
                            btn: ['确定']    //按钮
                        }, function () {
                            $("[name=currentPage]").val(1);
                            $("#searchForm").submit();
                        });
                    }, error: function () {
                        layer.confirm('发送请求失败！请联系相关客服。', {
                            btn: ['确定']    //按钮
                        }, function () {
                            $("[name=currentPage]").val(1);
                            $("#searchForm").submit();
                        });
                    }
                });
            });
        });
    }
</script>
</html>