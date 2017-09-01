//分页查询js
$(function() {
    $(".changePage").click(function(a) {
        var currentPage=$(a.target).attr("data");
        $("[name=currentPage]").val(currentPage);
        $("[name=currentPage]").parents("form").submit();
    })
});