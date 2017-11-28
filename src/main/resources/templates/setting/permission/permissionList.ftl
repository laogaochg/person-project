<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>平面运营后台</title>
<#include "../../common/baseImport.ftl" />
<#--bookstrap 分页插件-->
    <script type="text/javascript" src="${context.contextPath}/js/jquery.twbsPagination.min.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin" style="">
<#include "../../common/left_mune.ftl" />
    <div class="layui-body">
        <div class="headerTxt clearfix">
            <div class="fl title-body">品牌列表</div>
        </div>
        <div class="Popup brandPopup">
            <div class="selBox">
                <form id="searchForm" method="post" action="${context.contextPath}/permission/list"
                      class="nice-validator n-default"
                      novalidate="novalidate">
                    <input type="text" value="${(qo.keyword)!""}" name="keyword" placeholder="关键字"
                           class="input-text radius size-L inputstyle">
                    <i class="ico iconfont icon-sousuo"></i>
                    <input name="currentPage" value="${pageResult.currentPage}" type="hidden">
                    <button class="layui-btn layui-btn-normal serchH">搜索</button>
                    <button class="layui-btn layui-btn-normal changeBtn mr20 ml32"
                            style="margin-left: 300px;" type="button"
                            onclick="window.location.href='${context.contextPath}/brand/toEditBrand'"><i
                            class="iconfont  icon-tianjia1"></i>添加品牌
                    </button>
                </form>
            </div>
        </div>
        <!--  表格S  -->
        <div class="comTable">
            <div class="layui-form">
                <table class="layui-table mytable">
                    <thead>
                    <tr>
                        <th style="width: 60px">
                            <input type="checkbox" name="selectAll" lay-skin="primary">
                        </th>
                        <th style="width: 100px">ID</th>
                        <th style="width:280px">权限名称</th>
                        <th>url</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list pageResult.listData as brand>
                    <tr class="js-item">
                        <td style="width: 40px">
                            <div class="layui-form-item">
                                <input data-brandid="${brand.id}" type="checkbox" name="deletePermissionId"
                                       lay-skin="primary">
                            </div>
                        </td>
                        <td style="width: 60px">${brand.id}</td>
                        <td style="width:280px" class="">${(brand.name)!""}</td>
                        <td style="width:280px" class="">${(brand.url)!""}</td>
                        <td class="operation">
                            <a href="${context.contextPath}/brand/toEditBrand?id=${brand.id}"
                               class="operationA bgColor1">
                                <em class="iconfont icon-xiugai"></em>
                            </a>
                            <a onclick="_ajax('ids=${brand.id}')" class="operationA bg2">
                                <em class="iconfont icon-shanchu"></em>
                            </a>
                        </td>
                    </tr>
                    </#list>
                </table>
            </div>
            <div class="tableFoot">
                <div class="footTxt" style="margin-left: 15px">
                    <i class="allChe tableI" id="allChe"></i><label>全选</label>
                </div>
                <button type="button" id="batchDeleteBrand"
                        class="ml40 layui-btn layui-btn-primary layui-btn-big layuiBtn"
                        style="border-radius: 6px">
                    批量删除
                </button>
                共${pageResult.totalCount}条
                <div id="pagination" class="demo4"></div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">

    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
                , layer = layui.layer
        ;

        //监听提交
        form.on('submit(searchForm)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
    });

    $(function () {
        //分页代码
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
    $(function () {
        //删除
        $("#batchDeleteBrand").click(function () {
            console.debug($(".layui-form-checked"));
            var selectHovers = $("tr .hover1");
            var _data = "1=1";
            for (var i = 0; i < selectHovers.length; i++) {
                _data += "&ids=" + $(selectHovers[i]).data("brandid");
            }
            _ajax(_data);

        });
    });

    function _ajax(_data) {
        //批量删除
        layui.use('layer', function () {
            layer.confirm('您确定要删除吗？', {
                btn: ['确定删除', '取消']    //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "${context.contextPath}/brand/batchDeleteBrand",
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