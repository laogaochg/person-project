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
<style>
    .menu {
        border-top: 0px none;
        text-align: left;
        line-height: 40px;
        height: 40px;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
        display: block;
        padding: 0 10px;
        font-size: 14px;
        text-decoration: none;
        cursor: auto;
    }

    .menu a {
        color: #ffffff;
    }

    .firstMenu:hover {
        border-left: 5px green solid;
    }

    .childList {
        display: none;
        padding-left: 15px;
    }

    .childList li {
        padding-left: 15px;
    }
    .selectMenuIcon{
        /*font-size: 16px;*/
        /*vertical-align: text-top;*/
        /*color: #1aff18;*/
        /*border-bottom: 2px green solid;*/
    }
    .selectMenu a{
        box-shadow: 0 0 3px rgba(0,136,204,.5);
        background-color: #08c;
        color: #fff;
        border-radius: 3px;
        cursor: pointer;
        height: 20px;
        white-space: nowrap;
        padding-left: 18px;
        padding-right: 25px;
        padding-top: 5px;
        padding-bottom: 5px;
        margin-left: -18px;
    }

</style>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });
    $(function () {
        $(".menu").data("toShow", true);
        //选中菜单处理 展开当前级列表和父级列表
        var selectMenuId = $(".selectMenu").data("parentid");
        console.debug(selectMenuId);
        var firstSelectMenuParent = $("[data-menuid=" + selectMenuId + "]");
        showMenu(firstSelectMenuParent);
        var parentId = firstSelectMenuParent.data("parentid");
        if (parentId) {
            showMenu($("[data-menuid=" + parentId + "]"));
        }
        console.debug($("[data-menuid=" + selectMenuId + "]").html());

//        showMenu(selectMenu.parent("ul").parent("ul").parent("ul").children("li"));

        function showMenu(eleMent) {
            eleMent.children("span").addClass("glyphicon-triangle-top");
            eleMent.children("span").removeClass("glyphicon-triangle-bottom");
            eleMent.next("ul").show(150);
            eleMent.data("toShow", false);
        }

        $('.menu').click(function () {
            var $this = $(this);
            var toShow = $this.data('toShow');
            $this.parent("ul").children(".childList").hide(150);
            $this.parent("ul").children(".menu").data("toShow", true);
            //图标处理
            var icon = $this.parent("ul").children("li").children(".stateIcon");
            icon.addClass("glyphicon-triangle-bottom");
            icon.removeClass("glyphicon-triangle-top");
            if (toShow) {//展示
                showMenu($this);
            } else {//隐藏
                $this.next("ul").hide(150);
                $this.data("toShow", true);
                $this.children("span").addClass("glyphicon-triangle-bottom");
                $this.children("span").removeClass("glyphicon-triangle-top");
            }
        });
    })
</script>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
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
                        <a href="${(menu2.url)!"javascript:;"}">
                        ${menu2.mname}
                        </a>
                    </li>
                    <ul class="childList">
                        <#list menu2.menuList as menu3>
                            <li data-menuid="${menu3.mid}"
                                data-parentid="${menu3.pid}"
                                class="${(menu3.mid==selectMenuIdForIntropect)?string("selectMenu ","")}menu" style="padding-left: 35px;">
                                <#if (menu3.url)??>
                                <a href="${menu3.url}?selectMenuIdForIntropect=${menu3.mid}">
                                <#else>

                                <a href="javascript:;">
                                </#if>
                            <#--<span class="selectMenuIcon glyphicon glyphicon-star"></span>&nbsp;-->
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