<!DOCTYPE HTML>
<html>

<head>
    <title>品牌列表</title>
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
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">功能选择</li>
        <li>查询选择</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <div class="layui-btn-group">
                <button class="layui-btn" onclick="openUpdate()">新增</button>
                <button class="layui-btn layui-btn-danger" data-type="btnDelAll">批量删除</button>
            </div>
        </div>
        <div class="layui-tab-item">
        </div>
    </div>
</div>
<table class="layui-hide" id="table" lay-filter="table"></table>
<script>
    //修改按钮
    function openUpdate(data) {
        if (data) {
            gotoUrl('/Brand/BrandEdit&id=' + data.brandId);
        } else {
            gotoUrl('/Brand/BrandEdit');
        }
    }

    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element'], function () {
        var layer = layui.layer; //弹层
        var laydate = layui.laydate; //日期
        var laypage = layui.laypage; //分页
        var table = layui.table; //表格
        var carousel = layui.carousel; //轮播
        var upload = layui.upload; //上传
        var element = layui.element; //元素操作


        var index = layer.load(1);//开启进度条
        //绑定table
        table.render({
            elem: '#table',//table id
            url: '${context.contextPath}/brand/list',
            method: 'POST', //方式
            page: true,//是否开启分页
            limits: [10, 20, 30, 60, 90, 100],
            limit: 20, //默认采用20
            even: true, //开启隔行背景
            id: 'searchID',
            //height:'full-150',
            done: function (res, curr, count) {
                //加载后回调
                layer.close(index);//关闭
                noAuthTip(res);//无权限提示
            },
            cols: [[ //标题栏
                {
                    checkbox: true,
                    fixed: 'left',
                },
                {
                    field: 'brandId',
                    title: 'ID',
                    align: 'center',
                    sort: true,
                    width: '100'
                },
                {
                    field: 'brandName',
                    title: '品牌名称',
                    align: 'center',
                    sort: true,
                    width: '200'
                },
                {
                    field: 'brandWebsite',
                    title: '品牌官网地址',
                    align: 'center',
                    width: '200'
                },
                {
                    field: 'status',
                    title: '状态',
                    align: 'center',
                    width: '100',
                    templet: "#operStTpl"
                },
                {
                    field: 'brandOrder',
                    title: '品牌排序', align: 'center', sort: true, width: '100'
                }
                ,
                {
                    field: 'addTime',
                    title: '添加时间',
                    align: 'center',
                    width: '200',
                    templet: "#addTime"
                }
                ,
                {
                    field: 'brandLogo',
                    title: 'logo图',
                    align: 'center',
                    width: '250',
                    templet: "#logo"
                }
                ,
                {
                    fixed: 'right',
                    title: '操作',
                    align: 'center',
                    toolbar: '#toobar',
                    width: '200'
                }
            ]]
        })
        ;

        //监听工具条
        table.on('tool(table)', function (obj) { //注：tool是工具条事件名，table是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                    , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'detail') {
                openDetail(data);
            } else if (layEvent === 'update') {
                openUpdate(data);
            } else if (layEvent === 'del') {
                openDelete("ids="+data.brandId);
            }
        });

        //监听表格复选框选择
        table.on('checkbox(table)', function (data) {
            //layer.alert(JSON.stringify(data));
        });

        //打开新增按钮
        function openAdd() {
            layer.open({
                type: 2,
                title: '新增',
                shadeClose: false,//点击遮罩关闭
                anim: public_anim,
                btnAlign: 'c',
                shade: public_shade,//是否有遮罩，可以设置成false
                maxmin: true, //开启最大化最小化按钮
                //area: ['700px', '400px'],
                area: ['100%', '100%'],
                boolean: true,
                content: ['MenuInfoAdd.jsp', 'yes'], //iframe的url，no代表不显示滚动条
                success: function (layero, lockIndex) {
                    var body = layer.getChildFrame('body', lockIndex);
                    //绑定解锁按钮的点击事件
                    body.find('button#close').on('click', function () {
                        layer.close(lockIndex);
                        location.reload();//刷新
                    });
                }
            });
        }

        //打开查看按钮
        function openDetail(data) {
            layer.open({
                type: 2,
                title: '查看',
                shadeClose: false,//点击遮罩关闭
                btnAlign: 'c',
                shade: public_shade,//是否有遮罩，可以设置成false
                maxmin: true, //开启最大化最小化按钮
                //area: ['700px', '400px'],
                area: ['100%', '100%'],
                boolean: true,
                content: ['MenuInfoDetail.jsp', 'yes'], //iframe的url，no代表不显示滚动条
                success: function (layero, lockIndex) {
                    var body = layer.getChildFrame('body', lockIndex);
                    //绑定解锁按钮的点击事件
                    body.find('button#close').on('click', function () {
                        layer.close(lockIndex);
                    });

                    pubUtil.load(body, data);//填充表单
                    body.find("input").attr("readonly", "readonly");
                }
            });
        }

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
                            url: contextPath+'/brand/delete?'+ids,
                            type: 'DELETE',//默认以get提交，以get提交如果是中文后台会出现乱码
                            success: function (r) {
                                layer.close(loadindex);//关闭进程对话框
                                if (r.success) {
                                    pubUtil.msg(r.msg, layer, 1, function () {
                                        location.reload();//刷新
                                    });
                                } else {
                                    pubUtil.msg(r.msg, layer, 2, function () {

                                    });
                                }
                            }
                        });
                    });
                }
            });
        }

        //请选择按钮
        $('button#treeSelect').on('click', function () {
            layer.open({
                type: 2,
                title: '选择<span style="color:red">[请单击选中]</span>',
                shadeClose: false,//点击遮罩关闭
                anim: public_anim,
                btnAlign: 'c',
                shade: public_shade,//是否有遮罩，可以设置成false
                maxmin: true, //开启最大化最小化按钮
                area: ['600px', '300px'],
                //area: ['100%', '100%'],
                boolean: true,
                content: ['MenuInfoTree.jsp', 'yes'], //iframe的url，no代表不显示滚动条
                btn: ['选择', '关闭'],
                yes: function (index, layero) {
                    var body = $(layero).find("iframe")[0].contentWindow.document;
                    var pid = body.getElementById("id").value;
                    var pidNm = body.getElementById("name").value;
                    $("#pidNm").val(pidNm);
                    $("#pid").val(pid);
                    layer.close(index); //关闭当前弹层
                },
                btn2: function (index, layero) {

                }
            });
        });

        //查询按钮
        $('#btnSearch').on('click', function () {
            index = layer.load(1);//开启进度条
            var searchform = pubUtil.serializeObject($("#searchform"));//查询页面表单ID
            //alert(JSON.stringify(searchform));
            table.reload('searchID', {
                where: searchform
            });
        });

        //重置按钮
        $('#btnRetSet').on('click', function () {
            index = layer.load(1);//开启进度条
            table.reload('searchID', {
                where: ""
            });
        });

        var active = {
            btnDelAll: function () { //批量删除
                var checkStatus = table.checkStatus('searchID');
                var data = checkStatus.data;
                //layer.alert(JSON.stringify(data));
                if (data.length == 0) {
                    pubUtil.msg("请至少选择一条要删除的记录", layer, 2, function () {
                    });
                    return;
                }
                var ids = '';
                for (var i = 0; i < data.length; i++) {
                    if (i != 0) {
                        ids += "&ids="+data[i].brandId ;
                    } else {
                        ids += "ids="+data[i].brandId;
                    }
                }
                openDelete(ids);
            }
            , btnAdd: function () { //新增操作
                openAdd();
            }
        };

        $('.layui-btn-group .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    });


</script>
<script type="text/html" id="toobar">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="update">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</body>
<script type="text/html" id="operStTpl">
    <span class="layui-badge  {{ d.status == 1 ? 'layui-bg-green' : 'layui-bg-red' }} ">{{ d.status == 1 ? '启用' : '停用' }}</span>
</script>
<script type="text/html" id="addTime">
    {{#
    return new Date(d.addTime).format("yyyy-MM-dd hh:mm:ss");
    }}
</script>
<script type="text/html" id="logo">
    <img src="{{d.brandLogo}}">
</script>
</html>