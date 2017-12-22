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
                贤心
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="${context.contextPath}/logout">退了</a></li>
    </ul>
</div>
<style>


</style>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <ul style="width: 220px;">
        <#list user.menus as menu>
            <li data-menuid="${menu.mid}"
                data-parentid=""
                class="menu text-center firstMenu">
                <#if (menu?size>0)>
                    <span class="stateIcon glyphicon glyphicon-triangle-bottom"
                          style="position: relative;right: -70%;top: 3px;"
                          aria-hidden="false"></span>
                </#if>
                <a href="javascript:;">${menu.mname}</a>
            </li>
            <ul class="childList">
                <#list menu.menuList as menu2>
                    <li
                            data-menuid="${menu2.mid}"
                            data-parentid="${menu2.pid}"
                            class="${(menu2.mid==selectMenuIdForIntropect)?string("selectMenu ","")} menu text-center">
                        <#if ((menu2.menuList)?size>0)>
                            <span class="stateIcon glyphicon glyphicon-triangle-bottom"
                                  style="position: relative;right: -70%;top: 3px;"
                                  aria-hidden="false"></span>
                        <#else>
                            &nbsp;&nbsp;&nbsp;
                        </#if>
                        <#if (menu2.url)??>
                        <a href="${context.contextPath}${menu2.url}?selectMenuIdForIntropect=${menu2.mid}">
                        <#else>
                        <a href="javascript:;">
                        </#if>
                    ${menu2.mname}
                    </a>
                    </li>
                    <ul class="childList">
                        <#list menu2.menuList as menu3>
                            <li data-menuid="${menu3.mid}"
                                data-parentid="${menu3.pid}"
                                class="${(menu3.mid==selectMenuIdForIntropect)?string("selectMenu ","")}menu"
                                style="padding-left: 35px;">
                                <#if (menu3.url)??>
                                <a href="${context.contextPath}${menu3.url}?selectMenuIdForIntropect=${menu3.mid}">
                                <#else>

                                <a href="javascript:;">
                                </#if>
                            ${(menu3.mname)!""}
                            </a>
                            </li>
                        </#list>
                    </ul>
                </#list>
            </ul>
        </#list>
        </ul>
    </div>
</div>