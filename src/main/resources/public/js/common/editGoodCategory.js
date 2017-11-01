/**
 * Created by Administrator on 2017/8/2.
 */
$(function() {

    $(".saveFrom").click(function() {
        //表单验证
        var data=$("#editGoodCategoryForm").serialize();
        data+="&img=" + $("[name=brandLogo]").val();
        var canSubmit=true;
        var rank=$("[name=rank]").val();
        var msg="";
        if(!$("[name=categoryName]").val()) {
            msg="类目名称不能为空。"
            canSubmit=false;
        }
        console.debug(data)
        if(canSubmit) {
            ajaxData("/GoodCategory/insertGoodCategory",data,function(data) {
                layer.confirm(data.mes,{
                    btn: ['确定']    //按钮
                },function() {
                    window.location.href="/GoodCategory/queryAllGoodCategory";
                });
            },function(data) {
                layer.confirm(data.mes,{
                    btn: ['确定']    //按钮
                });
            });
        } else {
            layer.confirm(msg,{
                title: '错误信息',
                btn: ['确定']    //按钮
            });
        }
    });


    $(".switch").click(function() {
        if($(this).parents(".outer").is(".open")) {
            $(this).parents(".outer").removeClass("open").next(".inner").removeClass("open");
        } else {
            $(this).parents(".outer").addClass("open").next(".inner").addClass("open");
        }
    });

    $("tr.outer, tr.leaf").click(function() {
        $("tr.focus").removeClass("focus");
        $(this).addClass("focus");
    });

//选择所属类目
    +function() {
        var jsTr=$(".tbodyH .jsTrItem"),         //拿到每一个点击到的tr
            jsTrLen=jsTr.length;

        var Hone=$(".goodCategory .Hone"),         //一级类目
            Htwo=$(".goodCategory .Htwo"),        //二级类目
            Hthree=$(".goodCategory .Hthree");    //三级类目


        for (var i=0; i<jsTrLen; i++) {
            (function() {
                $(jsTr)[i].onclick=function(e) {
                    var $e=$(this);
                    $("[name=parentId]").val($e.data("goodcageoryid"));
                    var spanTxt=$e.find("span.name").html();       //当前点击的span中的文本值
                    $("#selectProp").val(spanTxt);

                    if($e.hasClass("oneCate")) {
                        // Hone.show().siblings(".cateComContent").hide();
                        // var curTxt=$e.find("span.name").html();
                        // Hone.find(".cateName").find("em").html(curTxt);
                        Htwo.show().siblings(".cateComContent").hide();
                        var curTxt=$e.find("span.name").html();
                        Htwo.find(".cateName").find("em").html(curTxt);
                        $("[name=rank]").val(2);
                    } else if($e.hasClass("twoCate")) {
                        // Htwo.show().siblings(".cateComContent").hide();
                        // var curTxt=$e.find("span.name").html();
                        // Htwo.find(".cateName").find("em").html(curTxt);
                        Hthree.show().siblings(".cateComContent").hide();
                        $("[name=rank]").val(3);
                    } else if($e.hasClass("threeCate")) {
                        Hthree.show().siblings(".cateComContent").hide();
                    }

                }
            })(i);
        }

        //弹窗中的确定按钮
        $(".layui-btn2").on("click",function() {
            layer.close(layer.index);
            Hone.show().siblings(".cateComContent").hide();
            var curTxt="";
            Hone.find(".cateName").find("em").html(curTxt);
            $("[name=rank]").val(1);
        });
        $(".layui-btn1").on("click",function() {
            layer.close(layer.index);
        });

        var rank=$("[name=rank]").val();
        if(1==rank) {
            Hone.show().siblings(".cateComContent").hide();
            var curTxt="";
            Hone.find(".cateName").find("em").html(curTxt);
            $("[name=rank]").val(1);
        } else if(2==rank) {
            Htwo.show().siblings(".cateComContent").hide();
            $("[name=rank]").val(2);
        } else if(3==rank) {
            Hthree.show().siblings(".cateComContent").hide();
            $("[name=rank]").val(3);
        }

    }();


});