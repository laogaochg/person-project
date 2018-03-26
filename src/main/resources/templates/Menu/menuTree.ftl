<!DOCTYPE HTML>
<html>
<head>
    <title>菜单管理</title>
<#include "../inc.ftl" />
    <link rel="stylesheet" type="text/css" href="${context.contextPath}/css/login.css"></link>
</head>
<body>
<div class="row">
    <button class="layui-btn" onclick="gotoUrl('/Menu/MenuList')" style="width: 100px;">去列表</button>
    <table class="layui-table">
        <tr>
            <th>名称</th>
            <th>链接</th>
            <th>排序</th>
            <th>可见</th>
            <th>操作
                <button type="button" onclick="editMenu(null,1)" class="layui-btn">
                <#--<a href="${context.contextPath}/menu/toEdit?flag=2">-->
                    添加根菜单
                <#--</a>-->
                </button>
            </th>
        </tr>
    <#macro bpTree menuList ,a ,parentMenu>
        <#if menuList?? >
            <#list menuList as menu>
                <tr>
                    <th>
                        <#if a==1>
                            <li class="li">${menu.mname}</li>
                        <#else>
                            <ul style="padding-left:50px;"><#list 2..a as i><#if i !=2>
                            <ul style="padding-left:50px;"></#if></#list>${menu.mname}<#list 2..a as i><#if i !=2></ul></#if></#list>
                            </ul></#if>
                    </th>
                    <th>${(menu.url)!""}</th>
                    <th>${(menu.sort)!""}</th>
                    <th>${(menu.state==1)?string("可见","不可见")}</th>
                    <th>
                    <#--<a href="${context.contextPath}/Menu/toEdit?mid=${menu.mid}&flag=2">-->
                        <button type="button" onclick="editMenu(${menu.mid},2)" class="layui-btn">
                            添加下级菜单
                        </button>
                    <#--</a>-->
                        <button type="button" onclick="editMenu(${menu.mid},3)" class="layui-btn">
                            修改
                        </button>

                    <#--<a href="${context.contextPath}/Menu/delete?mid=${menu.mid}&flag=1">-->
                        <button type="button" data-mid="${menu.mid}" data-type="btnDelete" class="layui-btn">
                            删除
                        </button>
                    <#--</a>-->
                    </th>
                </tr>
                <!-- freemarker递归调用 -->
                <@bpTree menu.menuList,a+1 , menu/>
            </#list>
        </#if>
    </#macro>
        <!--freemarker宏-->
    <@bpTree menuList , 1,menuList/>
    </table>

</div>
</body>
<script>
    var form;
    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'form'], function () {
        var layer = layui.layer; //弹层
        var laydate = layui.laydate; //日期
        var laypage = layui.laypage; //分页
        var table = layui.table; //表格
        var carousel = layui.carousel; //轮播
        var upload = layui.upload; //上传
        var element = layui.element; //元素操作
        form = layui.form;

        //删除按钮
        function openDelete(ids) {
            layer.open({
                title: '确认删除' //显示标题栏
                , closeBtn: false
                , area: '300px;'
                , shade: 0.5
                , id: 'LAY_layuipro' //设定一个id，防止重复弹出
                , btn: ['删除', '关闭']
                , content: '您是否要删除当前选中的记录？'
                , success: function (layero) {
                    var btn = layero.find('.layui-layer-btn');
                    btn.css('text-align', 'center');//居中
                    btn.find('.layui-layer-btn0').on('click', function () {
                        var loadindex = layer.load(1);//开启进度条
                        $.ajax({
                            url: contextPath + '/Menu/edit?mid=' + ids,
                            type: 'DELETE',//默认以get提交，以get提交如果是中文后台会出现乱码
                            dataType: 'json',
                            success: function (r) {
                                layer.close(loadindex);//关闭进程对话框
                                layer.open({
                                    type: 1,
                                    content: r.msg,
                                    btn: ['确定'],
                                    yes: function () {
                                        location.reload();//刷新
                                    }
                                });
                            }
                        });
                    });
                }
            });
        }

        var active = {
            btnDelete: function (a, b) { //新增操作
                openDelete($(this).data("mid"));
            }
        };
        $('.layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    })

    /**
     * @param menuId
     * @param type :1:添加根菜单,2:添加下级菜单,3 修改菜单
     */
    function editMenu(menuId, type) {
        var s = this;
//        getMenuDetail(menuId, function (data) {
        var titles;
        var url = contextPath + "/toUrl?url=/Menu/MenuInfoEdit&type=" + type;
        if (type == 1) {
            titles = '添加根菜单';
        } else if (type == 2) {
            titles = '添加下级菜单';
            url += "&pid=" + menuId;
        } else if (type == 3) {
            url += "&mid=" + menuId;
            titles = '修改菜单';
        }
        layer.open({
            type: 2,
            title: titles,
            shadeClose: false,//点击遮罩关闭
            anim: public_anim,
            btnAlign: 'c',
            shade: public_shade,//是否有遮罩，可以设置成false
            maxmin: true, //开启最大化最小化按钮
            //area: ['700px', '400px'],
            area: ['60%', '80%'],
            boolean: true,
            content: [url, 'yes'], //iframe的url，no代表不显示滚动条
            success: function (layero, lockIndex) {
                var body = layer.getChildFrame('body', lockIndex);
                //绑定解锁按钮的点击事件
                body.find('button#close').on('click', function () {
                    layer.close(lockIndex);
                    location.reload();//刷新
                });
            }
        });
//        });
    }

</script>
</html>
