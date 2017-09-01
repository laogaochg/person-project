/**
 * Created by Administrator on 2017/8/1.
 */
$(".jsfalseBtn").on("click",function () {
    layer.open({
        type: 1,
        area: ['300px', '320px'],
        title: false,
        shadeClose: true,        //点击遮罩关闭
        content:$("#jsfalseBtnContent")
    });
});

//点击取消按钮关闭
$("#btnBack").on("click",function () {
    layer.close(layer.index);
});


//控制textarea输入的字数，默认不超过100个字
$(function(){
    $("#jsTextarea").keyup(function(){
        var len = $(this).val().length;
        if(len > 99){
            $(this).val($(this).val().substring(0,99));
        }
        console.log($("#jsTextarea").val());
        var num = 100 - len;
        $("#word").text(num);
    });

});

