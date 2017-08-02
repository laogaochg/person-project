<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>品牌列表</title>
${r"<#include '../../common/baseImport.ftl' />"}
    <script type="text/javascript">
        //分页代码
        layui.use(['laypage','layer'],function() {
            var laypage=layui.laypage
                    ,layer=layui.layer;
            laypage({
                cont: 'pageQuery'
                ,pages: ${r"${pageResult.totalPage}"}
                ,curr:${r"${pageResult.currentPage}"}
                ,first: false
                ,last: false
                ,skin: '#1E9FFF'
                ,jump: function(data) {
                    var oldPage=$("[name=currentPage]").val();
                    if(oldPage!=data.curr) {
                        $("[name=currentPage]").val(data.curr);
                        $("#pageQueryBrand").submit();
                    }
                }
            });
        });
        $(function() {
            $("#batchDeleteBrand").click(function() {
                var selectHovers=$("tr .hover1");
                console.debug(selectHovers[0]);
                var _data="1=1";
                for (var i=0; i<selectHovers.length; i++) {
                    _data+="&ids=" + $(selectHovers[i]).data("brandid");
                }
                _ajax(_data);

            });
        });
        function _ajax(_data) {
            //批量删除
            layui.use('layer',function() {
                layer.confirm('您确定要删除吗？',{
                    btn: ['确定删除','取消']    //按钮
                },function() {
                    $.ajax({
                        type: "POST",
                        url: "/${classObj}/batchDelete${className}",
                        data: _data,
                        success: function(data) {
                            var msg;
                            if(data.code==200) {
                                msg="删除成功。";
                            } else {
                                msg="删除失败。";
                            }
                            layer.confirm(msg,{
                                btn: ['确定']    //按钮
                            },function() {
                                $("[name=currentPage]").val(1);
                                $("#pageQueryBrand").submit();
                            });
                        },error: function() {
                            layer.confirm('发送请求失败！请联系相关客服。',{
                                btn: ['确定']    //按钮
                            },function() {
                                $("[name=currentPage]").val(1);
                                $("#pageQueryBrand").submit();
                            });
                        }
                    });
                });
            });

        }
    </script>
</head>
<body>


<div class="contentBody clearfix brandList">
${r"<#include '../../common/left_mune.ftl' />"}
    <div class="rightContent">
        <div class="headerTxt clearfix">
            <div class="fl">品牌列表</div>
            <div class="fr">
                <button class="layui-btn layui-btn-normal changeBtn mr20 ml32"
                        onclick="window.location.href='/brand/toEditBrand'"><i class="iconfont  icon-tianjia1"></i>添加品牌
                </button>
            </div>
        </div>
        <div class="Popup brandPopup">
            <div class="selBox">
                <form id="pageQueryBrand" method="post" action="/brand/list" class="nice-validator n-default"
                      novalidate="novalidate">
                    <input type="text" value="${r"${(qo.keyword)!''}"} name="keyword" placeholder="关键字"
                           class="input-text radius size-L inputstyle">
                    <i class="ico iconfont icon-sousuo"></i>
                    <input name="currentPage" value="${r"${pageResult.currentPage}"}" type="hidden">
                    <button class="layui-btn layui-btn-normal serchH">搜索</button>
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
                        <th style="width:280px">${name}名称</th>
                        <th>logo</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    ${r"<#"}list pageResult.listData as obj>
                    <tr class="js-item">
                        <td style="width: 40px">
                            <i data-brandid="${r"${"}obj.${keyFild}}" class="che js-che tableI"></i>
                        </td>
                        <td style="width: 60px">
                        ${r"${"}obj.${keyFild}}
                        </td>
                        <#--迭代属性-->
                        <td style="width:280px" class="">
                        <#--${brand.brandName}-->
                        </td>
                        <td class=""></td>
                        <td class="operation">
                            <a href="/brand/toEditBrand?id=${r"${"}obj.${keyFild}}" class="operationA bgColor1">
                                <em class="iconfont icon-xiugai"></em>
                            </a>
                            <a onclick="_ajax('ids=${r"${"}obj.${keyFild}}')" class="operationA bg2">
                                <em class="iconfont icon-shanchu"></em>
                            </a>
                        </td>
                    </tr>
                    ${r"</#list>"}
                    </tbody>
                </table>
            </div>
            <div class="tableFoot">
                <div class="footTxt" style="margin-left: 15px">
                    <i class="allChe tableI" id="allChe"></i><label>全选</label>
                </div>
                <button id="batchDeleteBrand" class="ml40 layui-btn layui-btn-primary layui-btn-big layuiBtn"
                        style="border-radius: 6px">
                    批量删除
                </button>
                <div id="pageQuery" class="demo4"></div>
            </div>
        </div>
    </div>


</div>
</body>
</html>