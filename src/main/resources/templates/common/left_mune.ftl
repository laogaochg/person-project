<div class="header clearfix">
    <div class="head_l fl">
        <a href="/" class="linkA"><img src="${context.contextPath}/image/index/logo.png" alt=""></a>
        <span>欢迎你，alice1</span>
    </div>
    <div class="head_r  clearfix">
        <ul class="fl">
            <li class="fl"><a class="one" href="javascript:;"></a></li>
            <li class="fl"><a class="two" href="/menu/list"></a></li>
            <li class="fl"><a class="three" href="javascript:;"><i>99</i></a></li>
        </ul>
        <!--气泡S-->
        <div class="top_tip">
            <div class="list">
                <ol>
                    <li class="list_1">
                        <p><em></em><span>2017年7月1日 11点至13点，全网不停服升级，升级后将有全新的功能内容，敬请期待。</span></p>
                        <b>今天</b>
                    </li>
                    <li class="list_2">
                        <p><em>!</em><span>2017年7月1日 11点20分10秒，因店铺违约未发货，现扣除店铺积分5分，等级为c1，仅此警告</span></p>
                        <b>2017-7-5</b>
                    </li>
                </ol>
                <a href="javascript:;">查看更多</a>
            </div>
        </div>
        <!--气泡E-->
        <div class="fr">
            <div class="person">
                <img src="${context.contextPath}/image/index/head.jpg" alt="">
                <span>alice1</span>
                <i></i>
            </div>
            <div class="close">
                <a href="/logout"><i></i></a>
            </div>
        </div>
    </div>
</div>

<div class="contentBody clearfix">
    <div class="comLeftMenu">
        <div class="left_menu fl">
            <ul class="left_menu_list">
            <#list user.menus as menu>
                <li data-menuid="${menu.mid}"><i class="i_${menu_index+1}"></i><span
                        class="txt">${menu.mname}</span><em></em></li>
            </#list>
            </ul>
        </div>

        <div class="left_menu_next">
            <span class="toggle_left_menu" style="display: block;"><i></i></span>
        <#if (user.menus)?? >
            <#list user.menus as menu>
                <dd class=" menu_next_${menu_index+1} rootMenuId_${(menu.mid)!""}">
                    <ul class="menu_next_list">
                        <#list menu.menuList as menu2>
                            <li class="menu_next_${menu2_index+1}">
                            <#--如果它的下面没有子菜单；那这个当作一个url-->
                                <#if ((menu2.menuList)?size>0)>
                                    <a href="javascript:;">${(menu2.mname)!""}<i></i></a>
                                <#else>
                                    <a href="${context.contextPath}${(menu2.url)!""}">${(menu2.mname)!""}</a>
                                </#if>

                                <ol>
                                    <#list menu2.menuList as menu3>
                                    <li>

                                        <#if ((menu3.menuList)?size>0)>
                                            <a href="javascript:;">${(menu3.mname)!""}<i></i></a>
                                        <#else>
                                            <a href="${context.contextPath}${(menu3.url)!"#"}">${(menu3.mname)!""}</a>
                                        </#if>
                                        <#list menu3.menuList as menu4>
                                            <li>
                                                <#if ((menu4.menuList)?size>0)>
                                                    <a href="javascript:;">${(menu4.mname)!""}<i></i></a>
                                                <#else>
                                                    <a href="${context.contextPath}${(menu4.url)!"#"}">${(menu4.mname)!""}</a>
                                                </#if>
                                            </li>
                                        </#list>

                                        </li>
                                    </#list>
                                </ol>
                            </li>
                        </#list>

                    </ul>
                </dd>
            </#list>
        </#if>

        </div>
    </div>
    <#--<div class="jsNav">
        <ul class="headPathMenu">
            <li class="clearfix">
                <a href="#">商品管理</a>
                <i> &gt;&gt;&gt;</i>
            </li>
            <li class="clearfix">
                <a href="#" class="cur">商品列表</a>
                <i></i>
            </li>
        </ul>
    </div>
    <script type="text/javascript">
        var _result= window.document.location.pathname;
        $.ajax({
            type:'get',
            url: '/menu/queryParentMenus?url='+_result,
            dataType:'json',
            success:function (json) {
                var _html = "";
                for( var index = 0; index < json.length; index ++){
                    var menu = json[index];
                    if(menu.url && index!= json.length-1){
                        _html+= "<li class='clearfix'><a href='"+menu.url+"'>"+menu.mname+"</a><i> &gt;&gt;&gt;</i></li>";
                    }else if(menu.url && index== json.length-1){
                        _html+= "<li class='clearfix'><a href='"+menu.url+"'>"+menu.mname+"</a></li>";
                    }
                    else if(!menu.url && index!= json.length-1){
                        _html+= "<li class='clearfix'><a href='javascript:;'>"+menu.mname+"</a><i> &gt;&gt;&gt;</i></li>";
                    }
                    else{
                        _html+= "<li class='clearfix'<a href='javascript:;'>>"+menu.mname+"</a></li>";
                    }
                }
                $(".headPathMenu").html(_html)
            }
        });
    </script>-->
</div>