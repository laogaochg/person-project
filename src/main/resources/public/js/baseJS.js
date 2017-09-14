$(function(){
    $('.head_r .three').click(function(e) {
        $('.top_tip').fadeToggle(100);
        e.stopPropagation();
        return false;
    });

    $(document).click(function() {
        if($('.top_tip').css('display')=='block') {
            $('.top_tip').fadeOut(100);
        }
    });

//     $('.left_menu_list li').click(function() {
//         $(this).addClass('on').siblings().removeClass('on');
//         var id=$(this).data("menuid");
//         $('.left_menu_next').css('display','block');
// //        $('.left_menu_next dd').eq($(this).index()).fadeIn(50).siblings().fadeOut(50)
//         $(".rootMenuId_" + id).fadeIn(50).siblings().fadeOut(50);
//     });

    $('.left_menu_list li').click(function() {
        $(this).addClass('on').siblings().removeClass('on');
        $('.left_menu_next').css('display','block');
        var id=$(this).data("menuid");

        $(".rootMenuId_"+id).addClass("show").siblings("dd").removeClass("show");

    });

    $('.menu_next_list>li>a').click(function() {
        $(this).toggleClass('on')
        $(this).siblings('ol').slideToggle(100)
    });

    $('.toggle_left_menu').click(function() {
        $('.left_menu_next').css('display','none')
    });

    //下拉框的高度处理
    var leftMenu=$("#leftMenu");

    $(".left_menu_next").find("dd:first").addClass('show');

});