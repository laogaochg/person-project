//时间选择控件
$(function() {
    $(".selectTime").datetimepicker({
        format: 'yyyy-mm-dd',
        minView:'month',
        language: 'zh-CN',
        autoclose:true
    }).on("click",function(){
        $("#datetimeStart").datetimepicker("setEndDate",$("#datetimeEnd").val())
    });
});