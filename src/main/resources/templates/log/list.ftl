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

    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4"><h3>后台操作记录</h3></div>
    </div>

    <form action="${context.contextPath}/log/list" id="searchForm" class="form-inline" method="post">
        <div class="form-group">
            <label>用户id</label>
            <input type="text" name="authorId" style="width: 150px;" class="form-control" value="${(qo.authorId)!""}">
            <label>关键字</label>
            <input type="text" name="keyword" style="width: 150px;" class="form-control" value="${(qo.keyword)!""}">
            <label>动作</label>
            <input type="text" name="action" style="width: 150px;" class="form-control" value="${(qo.action)!""}">
            <label>开始时间</label>
            <input type="text" name="beginTime" style="width: 150px;" class="form-control selectTime"
                   value="${((qo.beginTime)?string("yyyy-MM-dd"))!""}">
            <label>结束时间</label>
            <input type="text" name="endTime" style="width: 150px;" class="form-control selectTime"
                   value="${((qo.endTime)?string("yyyy-MM-dd"))!""}">
        </div>
        <button type="submit" class="btn btn-default">确定</button>
        <div class="row">
            <table class="table table-striped">
                <tr>
                    <th> 操作人id：</th>
                    <th> 动作：</th>
                    <th> 内容：</th>
                    <th> 时间：</th>
                </tr>
            <#list pageResult.listData as log>
                <tr>
                    <th> ${(log.author)!""}</th>
                    <th> ${(log.action)!""}</th>
                    <th> ${(log.content)!""}</th>
                    <th> ${((log.opTime)?string("yyyy-MM-dd HH:mm"))!""}</th>
                </tr>
            </#list>
                <input type="hidden" name="currentPage" value="${pageResult.currentPage}"/>
            </table>
            <div style="text-align: center;">
                <ul id="pagination" class="pagination"></ul>
            </div>
        </div>
    </form>
</div>
</body>
<script type="text/javascript">
    ${pageResult.totalPage};
    $(function() {
        $('#pagination').twbsPagination({
            first: "首页",
            prev: "上一页",
            next: "下一页",
            last: "未页",
            startPage:${qo.currentPage},
            totalPages: ${pageResult.totalPage},
            visiblePages: ${qo.pageSize},
            onPageClick: function(event,page) {
                $("[name=currentPage]").val(page);
                $("#searchForm").submit();
            }
        });
    });
</script>
<script type="text/javascript" src="${context.contextPath}/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${context.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="${context.contextPath}/js/common/timepick.js"></script>
<script type="text/javascript" src="${context.contextPath}/js/common/BaseUtil.js"></script>
<script type="text/javascript" src="${context.contextPath}/js/jquery.twbsPagination.min.js"></script>

</html>