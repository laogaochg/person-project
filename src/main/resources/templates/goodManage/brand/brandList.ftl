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
                <form id="pageQueryBrand" method="post" action="/brand/list" class="nice-validator n-default"
                      novalidate="novalidate">
                    <input type="text" value="${(qo.keyword)!""}" name="keyword" placeholder="关键字"
                           class="input-text radius size-L inputstyle">
                    <i class="ico iconfont icon-sousuo"></i>
                    <input name="currentPage" value="${pageResult.currentPage}" type="hidden">
                    <button class="layui-btn layui-btn-normal serchH">搜索</button>
                    <button class="layui-btn layui-btn-normal changeBtn mr20 ml32"
                            style="margin-left: 300px;" type="button"
                            onclick="window.location.href='/brand/toEditBrand'"><i class="iconfont  icon-tianjia1"></i>添加品牌
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
                        <th style="width: 60px"><i class="che tableI"></i></th>
                        <th style="width: 100px">ID</th>
                        <th style="width:280px">品牌名称</th>
                        <th>logo</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list pageResult.listData as brand>
                    <tr class="js-item">
                        <td style="width: 40px"><i data-brandid="${brand.brandId}" class="che js-che tableI"></i></td>
                        <td style="width: 60px">${brand.brandId}</td>
                        <td style="width:280px" class="">${brand.brandName}</td>
                        <td class=""><img style="width: 40px" src="${context.contextPath}/image/${(brand.brandLogoThumb)!""}"></td>
                        <td class="operation">
                            <a href="${context.contextPath}/brand/toEditBrand?id=${brand.brandId}" class="operationA bgColor1">
                                <em class="iconfont icon-xiugai"></em>
                            </a>
                            <a onclick="_ajax('ids=${brand.brandId}')" class="operationA bg2">
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
                <div id="pageQuery" class="demo4"></div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    //分页代码
    layui.use('laypage', function () {
        var laypage = layui.laypage;
        laypage.render({
            elem: 'pageQuery'
            , count: ${pageResult.totalPage} //数据总数，从服务端得到
            , jump: function (obj, first) {
                //obj包含了当前分页的所有参数，比如：
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数
                var oldPage = $("[name=currentPage]").val();
                if (oldPage != obj.curr) {
                    $("[name=currentPage]").val(obj.curr);
                    $("#pageQueryBrand").submit();
                }
                //首次不执行
                if (!first) {
                    //do something
                }
            }
        });
    });
    $(function () {
        $("#batchDeleteBrand").click(function () {
            var selectHovers = $("tr .hover1");
            console.debug(selectHovers[0]);
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
                            $("#pageQueryBrand").submit();
                        });
                    }, error: function () {
                        layer.confirm('发送请求失败！请联系相关客服。', {
                            btn: ['确定']    //按钮
                        }, function () {
                            $("[name=currentPage]").val(1);
                            $("#pageQueryBrand").submit();
                        });
                    }
                });
            });
        });

    }
</script>
</html>