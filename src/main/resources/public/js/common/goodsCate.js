/**
 * Created by Administrator on 2017/7/27.
 */
/*-----------------------------  goodsCate.html   ----------------------------------*/
$(function(){
    $(".switch").click(function(){
        if($(this).parents(".outer").is(".open")){
            var id=$(this).parents(".outer").data("outerid");
            $(this).parents(".outer").removeClass("open");
            $(".inner_" + id).removeClass("open");
            //  $(this).parents(".outer").removeClass("open").next(".inner").removeClass("open");
        }else{
            var id=$(this).parents(".outer").data("outerid");
            console.log($(".inner_" + id));
            $(this).parents(".outer").addClass("open");
            $(".inner_" + id).addClass("open");
        }

    });
//箭头的上下移动事件
    $(function () {
        var $down=$(".outer .icon-down-arrow-02"),        //向下移动icon
            downLength=$down.length,
            $up=$(".outer .icon-xiangshangjiantou"),     //向上移动的icon
            upLength=$up.length;

        //   .outer向上移动
        for(var i=0;i<upLength;i++){
            $up.eq(i).on("click",function () {
                var $fa=$(this).parents(".outer");       //获取到当前元素的父级元素
                var id=$fa.data("outerid");


                if($fa.prevAll('.outer').length>0){
                    $fa.prevAll('.outer').eq(0).before($fa);
                    $fa.after($(".inner_" + id));
                }else{
                    //后台只让他显示一条数据的时候，不做处理.
                }
            })
        }

        //   .outer向下移动
        for(var i=0;i<downLength;i++){
            $down.eq(i).on("click",function () {
                var $fa=$(this).parents(".outer");       //获取到当前元素的父级元素
                var id=$fa.data("outerid");

                if($fa.nextAll('.inner').length>0){
                    $fa.nextAll('.inner').eq(1).after($fa);
                    $fa.after($(".inner_" + id));
                }else{
                    // $fa.parent().fine('.inner').eq(0).after($fa);
                    // $fa.after($(".inner_" + id));
                }
                //$(".inner_" + id).siblings(".inner").after( $(".inner_" + id));

            })
        }
    });
});