/**
 * Created by Administrator on 2017/7/14.
 */
/*----------------------  抽离出左边的部分和头部   ---------------------*/

/* --------------------------       baseMsg.html          --------------------------------*/
$(function() {
    var nav = $(".nav>li");
    var navb = $(".nav-box");
    var lastA=$(".jsNav .changeCont");
    nav.click(function() {
        var index = $(this).index(); // 获取点击后的下标
        $(this).siblings(".nav>li").removeClass("ys").end().addClass("ys");
        navb.eq(index).siblings(".nav-box").hide().end().show();

     //面包最后一个的内容
        var liTxt=$(this).text();
        lastA.html(liTxt);
    });

});

/*---------------------       baseMsg中的添加航班      ----------------------*/
$('#plugsFight').on('click', function(){
    layer.open({
        type: 1,
        area: ['770px', '602px'],
        title: false,
        shadeClose: true,        //点击遮罩关闭
        content:$("#Popup")
    });
});

/*---------------------       baseMsg中的选择商品      ----------------------*/
$('#selectGoods').on('click', function(){
    layer.open({
        type: 1,
        area: ['700px', '602px'],
        title: false,
        shadeClose: true,        //点击遮罩关闭
        content:$("#PopupGoods")
    });
});

/*----------------------   bussinness.html    -----------------------------*/
$('#plugNews').on('click', function(){
    layer.open({
        type: 1,
        area: ['600px', '500px'],
        title: false,
        shadeClose: true,        //点击遮罩关闭
        content:$("#newsContent")
    });
});

/*--------------------------      Notice.html     -------------------------*/
$('#noticeList').on('click', function(){
    layer.open({
        type: 1,
        area: ['650px', '600px'],
        title: false,
        shadeClose: true,        //点击遮罩关闭
        content:$("#NoticeContent")
    });
});

/*----------------   ArticleClassList.html    ------------------------*/
$('#ArticlassList').on('click', function(){
    layer.open({
        type: 1,
        area: ['650px', '600px'],
        title: false,
        shadeClose: true,        //点击遮罩关闭
        content:$("#ArticeContent")
    });
});



//弹窗中表格的点击事件
$(document).ready(function () {
    +function () {
       var $tr=$(".popSelectGood .jsTrItem"),      //每一个有文字的tr
            trLength=$tr.length,
            jstr="jstr";                            //有这个类的tr显示钩钩
       for(var i=0;i<trLength;i++){
           $tr.eq(i).on("click",function () {
                $('tr.jsTrItem').removeClass(jstr);
                $(this).addClass(jstr);
           });
       };
    }()
});

$(function(){
    //提示框的鼠标事件
    $(".upimg-div").hover(function () {
         $("#Htxt").addClass("current");
    },function () {
         $("#Htxt").removeClass("current");
    });
    /*--------------------editGoodsList.html-----------------------*/
    $('#selectProp').on('click', function(){
        layer.open({
            type: 1,
            area: ['500px', '600px'],
            title: false,
            shadeClose: true,        //点击遮罩关闭
            content:$("#editGoods")
        });
    });
    //批量删除
   $(".deleteBtn").on("click",function () {
       layui.use('layer', function(){
           layer.confirm('您确定要删除吗？', {
               btn: ['确定','取消']    //按钮
           }, function(){
               Hsubmit();   //调用删除成功的方法
               layer.msg('删除成功', {icon: 1});
           }, function(){

           });
       })

   });


    //删除的方法
    function Hsubmit(){
        $.ajax({
            type:'post',
            url: '',
            data:{},
            dataType:'json',
            success:function (obj) {

            }
        })
    }

/*-------------------- 表格------------------------*/
//全局配置
    var Apis  = {
            main       : '',        //主链接
            register  : '',         //注册
            login   : '',           //登录
            outLogin:'',           //退出登录
            changePassword:'',     //修改密码
            bindPhone:'',           //绑定手机号
            bindEmail:'',           //绑定邮箱号
            success    : 1,         //返回成功标识
            timeCount  : 60        //倒计时
        },
        Regs  = {
            mobile      :   /^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\d{8}$/,             //手机号
            email       :   /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/,  //邮箱
            qq           :  /^[1-9][0-9]{4,}$/,         //qq号
            integer     :   /^[0-9]*[1-9][0-9]*$/,    //正整数
            intFloat    :   /^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$/,     //正浮点数
            password    :   /^[0-9a-zA-Z_#]{6,16}$/   //6-16位字符,数字字母符号都可以用
        };



    +function () {
        // 控制手机号输入为正整数
        $(".search").on("input","#phone",function (e) {
            var $e   = $(this),
                v = $e.val();
            if(!Regs.integer.test($.trim(v))){
                $e.val("");
                return false;
            }
        });

    }();
});


/*------------------------------  goodsRecycle.html     ----------------------------------*/
//表格的全选事件
$(document).ready(function () {
    +function () {
        //~~全局定义变量
        var itemX  =  ".js-item",                //item块
            cheX = ".js-che",                    //单选
            allCheX = "#allChe",                //底部选择所有按钮
            h = "hover1";                         //选中che的类

        /*-------------------------------------------------统计计算方法------------------------------------------------------------------*/
        //统计方法
        function setNumber(){
            //设置值
            var cheNum   = $(cheX).length,     //选框的个数
                count = 0;                     //变量累加初始 0
            $.each($(cheX).closest('tbody').find(itemX), function (i, e) {
                //根据勾选中的数量计算总值

                if ($(e).find(cheX).hasClass(h)) {
                    count++;                                        //累加数
                    console.log(count);       //这里是计算勾选了几个选框
                }
            });
         count - cheNum ? $(allCheX).removeClass(h) : $(allCheX).addClass(h);       //js中0代表false,  个数对比   根据是否含类h 比较计算显示
        }

        /*--------------------------------------------------选择操作方法（单选，多选，全选）-------------------------------------------------------------------*/
        // 属性添加方法 判断                data-item属性值辨别，与data-id  一一对应，后台识别选中删除
        jQuery.fn.extend({
            //单一对应data-item属性
            dataItem:function () {
                var $e = $(this);
                console.log($e);
                $e.toggleClass(h);
                if($e.hasClass(h)){
                    var dataId =$e.parents(itemX).attr('data-id');
                    $e.parents(itemX).attr('data-item', dataId);
                }else{
                    $e.parents(itemX).attr('data-item', '');
                }
            },
            //所有data-item属性
            allDataItem:function () {
                var $e = $(this);
                $e.toggleClass(h);
                if($e.hasClass(h)){
                    $(cheX).addClass(h);
                    $(itemX).each(function (i,e) {
                        var  dataId = $(itemX).eq(i).attr("data-id");
                        $(itemX).eq(i).attr("data-item",dataId);
                    });
                }else{
                    $(cheX).removeClass(h);
                    $(cheX).parents(itemX).attr('data-item', '');
                }
            }
        });

        //单选，多选方法
        $(cheX).on("click",function () {
            $(this).dataItem();
            setNumber();
        });
        // 全选方法
        $(allCheX).on("click",function (e) {
            $(this).allDataItem();
            setNumber();
        });

        $(".totalH").on("click",function (e) {
            $(this).allDataItem();
            setNumber();
        });
    }();
});


//获取到当前页面的路径
function getRootPath_web() {
    var pathName = window.document.location.pathname;                         // admin_/src/Html/page/index.html
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);  // admin_
    pathName=pathName.replace(projectName,"");
    return (pathName);
};

var result=getRootPath_web();
console.log(result);


/*-------------------   ArticleClassList.html  --------------------------*/
~function () {
    var $icon = $(".iconDelete"),         //拿到点击的元素
        iconNum = $icon.length;
    for (var i = 0; i < iconNum; i++) {
        $icon.eq(i).on("click",function () {
            layer.confirm('你确定要删除吗？', {
                btn: ['确定','取消'] //按钮
                ,title: false
            }, function(){
                layer.msg('删除成功', {icon: 1});
            });
        })
    }
}();









