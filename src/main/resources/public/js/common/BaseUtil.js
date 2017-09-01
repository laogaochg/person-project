function myModal(id,title,content,success) {
    var _id='#' + id;
    $(_id).modal('show');
    if(!title) {
        title="标题";
    }
    if(!content) {
        content="未知";
    }
    $("#myModalLabel").html(title);
    $("#myModalContent").html(content);
    $("#myModalButton").click(function() {
        $(_id).modal('hide');
        success();
    });//
}
/**
 *
 * @param url 提交的URL
 * @param data 提交的数据
 * @param successFunction 后台返回信息是成功时，弹出提示框调用的方法 为NULL就会刷新本页面
 * @param errorFunction ajax 提交不成功弹出提示框，点击提示框确定按钮调用的方法 为NULL就会刷新本页面
 * @param updateErrorFunction ajax提交成功 后台返回错误信息，弹出错误提示框，点击提示框确定按钮调用的方法 为NULL就会刷新本页面
 */
function postAjax(url,data,successFunction,errorFunction,updateErrorFunction) {
    $.ajax({
        type: "POST",
        url: url,
        data: data,
        success: function(data) {
            var msg;
            if(data.code==200) {
                msg=data.mes;
                layer.confirm(msg,{
                    btn: ['确定']    //按钮
                },function() {
                    if(!successFunction) {
                        window.location.reload();
                    } else {
                        successFunction();
                    }
                });
            } else {
                msg=data.mes;
                layer.confirm(msg,{
                    btn: ['确定']    //按钮
                },function() {
                    if(!updateErrorFunction) {
                        window.location.reload();
                    } else {
                        updateErrorFunction();
                    }
                });
            }

        },error: function() {
            layer.confirm('发送请求失败！请联系相关客服。',{
                btn: ['确定']    //按钮
            },function() {
                if(!errorFunction) {
                    window.location.reload();
                } else {
                    errorFunction();
                }
            });
        }
    });
}

/**
 *
 * @param url 提交的URL
 * @param data 提交的数据
 * @param successFunction 后台返回信息是成功时，调用的方法，默认传进返回的data对象
 * @param errorFunction a后台返回信息是失败时，调用的方法，默认传进返回的data对象
 */
function ajaxData(url,data,successFunction,errorFunction) {
    $.ajax({
        type: "POST",
        url: url,
        data: data,
        success: function(data) {
            var msg;
            if(data.code==200) {
                if(!successFunction) {
                    msg=data.mes;
                    layer.confirm(msg,{
                        btn: ['确定']    //按钮
                    },function() {
                        window.location.reload();
                    });
                } else {
                    successFunction(data);
                }
            } else {
                if(!errorFunction) {
                    msg=data.mes;
                    layer.confirm(msg,{
                        btn: ['确定']    //按钮
                    },function() {
                        window.location.reload();
                    });
                } else {
                    errorFunction(data);
                }
            }

        },error: function() {
            layer.confirm('发送请求失败！请联系相关客服。',{
                btn: ['确定']    //按钮
            },function() {
                window.location.reload();
            });
        }
    });
}