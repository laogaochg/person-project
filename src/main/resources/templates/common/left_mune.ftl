<div class="layui-header">
    <div class="layui-logo">后台管理</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item"><a href="">控制台</a></li>
        <li class="layui-nav-item"><a href="">商品管理</a></li>
        <li class="layui-nav-item"><a href="">用户</a></li>
        <li class="layui-nav-item">
            <a href="javascript:;">其它系统</a>
            <dl class="layui-nav-child">
                <dd><a href="">邮件管理</a></dd>
                <dd><a href="">消息管理</a></dd>
                <dd><a href="">授权管理</a></dd>
            </dl>
        </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                贤心
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="">退了</a></li>
    </ul>
</div>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <#list user.menus as menu>
            <li class="layui-nav-item">
                <a href="${(menu.url!"#")}">${menu.mname}</a>
                <#if ((menu.menuList)?size>0)>
                    <dl class="layui-nav-child layui-nav-itemed">
                        <#list menu.menuList as menu2>
                            <dd><a href="${(menu2.url!"#")}">${menu2.mname}</a></dd>
                        </#list>
                    </dl>
                </#if>
            </li>
        </#list>
        </ul>
    </div>
</div>
<script>
    //JavaScript代码区域
    layui.use('element',function() {
        var element=layui.element;

    });
</script>