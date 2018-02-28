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
        <div class="headerTxt">
            添加品牌
        </div>
        <div class="addBrand">
            <form class="" action="${context.contextPath}/brand/editBrand" method="post">
                <input name="brandLogo" value="${(brand.brandLogo)!""}" type="hidden">
                <input name="brandId" value="${(brand.brandId)!""}" type="hidden">
                <div class="Hitem">
                    <div class="layui-form-item">
                        <div class="txtH1"><i class="start">*</i>品牌名称</div>
                        <input type="text" value="${(brand.brandName)!""}" name="brandName"
                               class="input-text radius size-L txtInputH">
                    </div>
                    <div class="layui-form-item">
                        <div class="txtH1">品牌官网地址</div>
                        <input type="text" name="brandWebsite" value="${(brand.brandWebsite)!""}"
                               class="input-text radius size-L txtInputH">
                    </div>
                    <div class="layui-form-item">
                        <div class="txtH1">品牌排序</div>
                        <input value="${(brand.brandOrder)!""}" name="brandOrder"
                               class="input-text radius size-L txtInputH">
                    </div>
                    <div class="layui-form-item">
                        <div class="txtH1">状态</div>
                        <div class="layui-form-item selectOption">
                            <div class="layui-inline inlinew">
                                <div class="layui-input-inline" style="width: 140px">
                                    <select name="status" class="selectHnew">
                                        <option value="1">启用</option>
                                        <option value="0">停用</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="txtH1" style="vertical-align: top"><i class="start">*</i>品牌logo</div>
                        <div class="z_photo upimg-div clear">
                            <section class="z_file fl">

                            <#if brand??>
                                <div style="position: absolute;top: 25%;left: 20%;z-index: 800;color: red;font-size: 20px;margin-top: -13px;">
                                    点击更改图片
                                </div>
                                <img class="add-img up-img" src="${context.contextPath}${(brand.brandLogo)!""}">
                            <#else>
                                <img src="${context.contextPath}/image/index/a11.png" class="add-img">
                            </#if>
                                <input type="file" name="file" id="file" class="file" value=""
                                       accept="image/jpg,image/jpeg,image/png,image/bmp" multiple/>
                            </section>


                        </div>
                        <aside class="mask works-mask">
                            <div class="mask-content">
                                <p class="del-p">您确定要删除图片吗？</p>
                                <p class="check-p"><span class="del-com wsdel-ok">确定</span><span
                                        class="wsdel-no">取消</span></p>
                            </div>
                        </aside>
                    </div>
                    <div class="layui-form-item">
                        <div class="txtH1">品牌介绍</div>
                        <div class="layui-input-block textareaH" style="margin-left: 0">
                            <textarea class="layui-textarea layui-hide" name="brandDesc" lay-verify="content"
                                      id="LAY_demo_editor">${(brand.brandDesc)!""}</textarea>
                            <div class="layui-layedit">
                                <div class="layui-unselect layui-layedit-tool"><i class="layui-icon layedit-tool-b"
                                                                                  title="加粗" lay-command="Bold"
                                                                                  layedit-event="b" "=""></i><i
                                        class="layui-icon layedit-tool-i" title="斜体" lay-command="italic"
                                        layedit-event="i" "=""></i><i class="layui-icon layedit-tool-u" title="下划线"
                                                                       lay-command="underline" layedit-event="u"
                                    "=""></i><i class="layui-icon layedit-tool-d" title="删除线"
                                                 lay-command="strikeThrough" layedit-event="d" "=""></i><span
                                            class="layedit-tool-mid"></span><i class="layui-icon layedit-tool-left"
                                                                               title="左对齐" lay-command="justifyLeft"
                                                                               layedit-event="left" "=""></i><i
                                            class="layui-icon layedit-tool-center" title="居中对齐"
                                            lay-command="justifyCenter" layedit-event="center" "=""></i><i
                                            class="layui-icon layedit-tool-right" title="右对齐" lay-command="justifyRight"
                                            layedit-event="right" "=""></i><span class="layedit-tool-mid"></span><i
                                            class="layui-icon layedit-tool-link" title="插入链接" layedit-event="link"
                                    "=""></i><i class="layui-icon layedit-tool-unlink layui-disabled" title="清除链接"
                                                 lay-command="unlink" layedit-event="unlink" "=""></i><i
                                            class="layui-icon layedit-tool-face" title="表情" layedit-event="face"
                                    "=""></i><i class="layui-icon layedit-tool-image" title="图片" layedit-event="image"><input
                                            type="file" name="file"></i></div>
                                <div class="layui-layedit-iframe">
                                    <iframe id="LAY_layedit_1" name="LAY_layedit_1" textarea="LAY_demo_editor"
                                            frameborder="0" style="height: 280px;"></iframe>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="Hitem mb20 mt80" style="text-align: center">
                        <button class="layui-btn layui-btn-big layui-btn-normal btnRuduis">保存</button>
                        <button type="button" onclick="window.location.href='${context.contextPath}/brand/list'"
                                class="layui-btn layui-btn-primary layui-btn-big btnRuduis">取消
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</div>
<!--编辑器-->
<script>
    $(function () {
        layui.use([ 'layedit', 'laydate','upload'], function () {
            var form =  layer = layui.layer
                    , layedit = layui.layedit
                    , laydate = layui.laydate;
            layedit.set({
                uploadImage: {
                    url: '${context.contextPath}/uploadFile'
                    , type: 'post' //默认post
                }
            });
            //创建一个编辑器
            var editIndex = layedit.build('LAY_demo_editor');
        });

    });
</script>
<link rel="stylesheet" href="${context.contextPath}/css/index/upimg.css">
<script src="${context.contextPath}/js/common/imgUp.js"></script>
</body>
</html>