<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>平面运营后台1</title>
<#include "../../common/baseImport.ftl" />
    <script type="text/javascript" src="${context.contextPath}/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="${context.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="${context.contextPath}/js/common/timepick.js"></script>
    <script type="text/javascript" src="${context.contextPath}/js/common/BaseUtil.js"></script>
    <script type="text/javascript" src="${context.contextPath}/js/jquery.twbsPagination.min.js"></script>
    <!-- style.css是项目的样式文件  -->
    <script src="${context.contextPath}/js/layui/lay/dest/layui.all.js" charset="utf-8"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
    <script>
        layui.use('upload', function () {
            var upload = layui.upload;
            //普通图片上传
            var uploadInst = upload.render({
                elem: '#test1'
                , url: '${context.contextPath}/upload/'
                , before: function (obj) {
                    //预读本地文件示例，不支持ie8
                    obj.preview(function (index, file, result) {
                        $('#demo1').attr('src', result); //图片链接（base64）
                    });
                }
                , done: function (res) {
                    //如果上传失败
                    if (res.code > 0) {
                        return layer.msg('上传失败');
                    }
                    //上传成功
                }
                , error: function () {
                    //演示失败状态，并实现重传
                    var demoText = $('#demoText');
                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function () {
                        uploadInst.upload();
                    });
                }
            });
        });
    </script>

    <script type="text/javascript">
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

            $("#chooseFile").change(function () {
                var formData = new FormData();
                formData.append("file", document.getElementById("chooseFile").files[0]);
                $.ajax({
                    url: "${context.contextPath}/certificate/batchInsertCertificate",
                    type: "POST",
                    data: formData,
                    /**
                     *必须false才会自动加上正确的Content-Type
                     */
                    contentType: false,
                    /**
                     * 必须false才会避开jQuery对 formdata 的默认处理
                     * XMLHttpRequest会对 formdata 进行正确的处理
                     */
                    processData: false,
                    success: function (data) {
                        if (data.code == 200) {
                            $("#selectImg").attr("src", "/image/" + data.data);
                            $("[name=img]").val(data.data);
                        } else {
                            myModal("myModalTest", "上传文件失败", data.mes, function () {
                            });
                        }
                    },
                    error: function (data) {
                        $('#serverResponse').html(data.status + " : " + data.statusText + " : " + data.responseText);
                    }
                });

            });

            $(".editCertificate").click(function () {
                var id = $(this).data("id");
                var _data = "1=1";
                _data += "&ids=" + id;
                myModal("myModalTest", "警告", "确定删除这些证书吗？", function () {
                    $("#myModalTest").modal('hide');
                    ajaxBathcDelete(_data);
                });

            });

            function ajaxBathcDelete(_data) {
                $.ajax({
                    type: "POST",
                    url: "${context.contextPath}/certificate/batchDelete",
                    data: _data,
                    success: function (data) {
                        if (data.code == 200) {
                            myModal("myModalTest", "成功", data.mes, function () {
                                location.reload();
                            });
                        } else {
                            myModal("myModalTest", "失败", data.mes, function () {
                                location.reload();
                            });
                        }
                    }, error: function (data) {
                        myModal("myModalTest", "失败", data.mes, function () {
                            location.reload();
                        });
                    }
                });
            }


        });
    </script>

</head>
<body>
<div class="layui-layout layui-layout-admin" style="">
<#include "../../common/left_mune.ftl" />
    <div class="layui-body">

        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4"><h3 style="font-size: 20px;color: #000;    margin-bottom: 10px;">证书管理</h3></div>
        </div>

        <form action="/certificate/list" id="searchForm" class="form-inline" method="post">
            <div class="form-group">
                <label>关键字1</label>
                <input type="text" name="keyword" style="width: 150px;" class="form-control" value="${(qo.keyword)!""}">
                <button type="submit" style="width: 100px;" class="form-control btn btn-info">确定</button>
                <label>批量导入</label>
                <input type="file" id="chooseFile" name="file" style="width: 150px;" class="form-control btn btn-info"
                       value="${(qo.action)!""}">
                <a type="file" href="/templateFile/CertificateTemplate.xls" style="width: 150px;"
                   class="btn btn-info form-control">下载模板</a>
                <a type="file" href="/certificate/toEditCertificate" style="width: 150px;"
                   class="btn btn-info form-control">添加证书</a>

                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="test1">上传图片</button>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="demo1">
                        <p id="demoText"></p>
                    </div>
                </div>

            </div>

            <div class="row">
                <table class="table table-striped">
                    <tr>
                        <th> id：</th>
                        <th> 名字：</th>
                        <th> 备注：</th>
                        <th> 创建时间：</th>
                        <th> 修改时间：</th>
                        <th> 操作</th>
                    </tr>
                <#list pageResult.listData as c>
                    <tr>
                        <th> ${(c.id)!""}</th>
                        <th> ${(c.name)!""}</th>
                        <th> ${(c.remark)!""}</th>
                        <th> ${((c.createDate)?string("yyyy-MM-dd HH:mm"))!""}</th>
                        <th> ${((c.updateDate)?string("yyyy-MM-dd HH:mm"))!""}</th>
                        <th>
                            <a href="${context.contextPath}/certificate/toEditCertificate?id=${c.id}" class="btn btn-default">修改</a>
                            <button type="button" data-id="${c.id}" class="btn btn-danger editCertificate">删除</button>
                        </th>
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

</html>