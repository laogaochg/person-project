<script type="text/javascript">
    // 配置参数
    var contextPath = '${context.contextPath}';
    //        添加时间格式化函数
    Date.prototype.format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1,                 //月份
            "d+": this.getDate(),                    //日
            "h+": this.getHours(),                   //小时
            "m+": this.getMinutes(),                 //分
            "s+": this.getSeconds(),                 //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            }
        }
        return fmt;
    }

    //去指定页面
    function gotoUrl(url) {
        window.location.href = contextPath + "/toUrl?url=" + url;
    }

    //数据字典下拉框
    function pbInitCombox($, form, type, id, value) {
        $.ajax({
            url: '${context.contextPath}/dictCd/getList.do?' + type,
            type: 'POST',//默认以get提交，以get提交如果是中文后台会出现乱码
            dataType: 'json',
            async: true,
            success: function (data) {
                //layer.msg(JSON.stringify(data));
                $("#" + id).html("");
                $("#" + id).append('<option selected="" value="">请选择</option>');
                for (var i = 0; i < data.length; i++) {
                    if (data[i].dictCd == value) {
                        $("#" + id).append('<option selected="" value=' + data[i].dictCd + '>' + data[i].dictNm + '</option>');
                    } else {
                        $("#" + id).append('<option value=' + data[i].dictCd + '>' + data[i].dictNm + '</option>');
                    }


                }
                form.render();//重新渲染
            }
        });
    }

    //普通下拉框
    function pbInitComCombox($, form, url, id, idField, textField, value) {
        $.ajax({
            url: '${context.contextPath}/' + url,
            type: 'POST',//默认以get提交，以get提交如果是中文后台会出现乱码
            dataType: 'json',
            async: true,
            success: function (data) {
                //layer.msg(JSON.stringify(data));
                $("#" + id).html("");
                $("#" + id).append('<option selected="" value="">请选择</option>');
                for (var i = 0; i < data.length; i++) {
                    if (data[i][idField] == value) {
                        $("#" + id).append('<option selected="" value=' + data[i][idField] + '>' + data[i][textField] + '</option>');
                    } else {
                        $("#" + id).append('<option value=' + data[i][idField] + '>' + data[i][textField] + '</option>');
                    }


                }
                form.render();//重新渲染
            }
        });
    }

    /**
     * 如： 传输页面：window.location.href = "xxx.html?obj="+
     * encodeURIComponent(JSON.stringify(obj)); 接收页面：requestParam =
     * getRequestParam(); data = JSON.parse(decodeURIComponent(requestParam.obj));
     */
    function getRequestParam() {
        var urlInfo = window.location.href;
        var argsIndex = urlInfo.indexOf("?");
        var args = urlInfo.substring((argsIndex + 1)).split("&");
        var argsInfo = "{";
        for (var i = 0; i < args.length; i++) {
            var argResult = args[i].split("=");
            argsInfo = argsInfo + "'" + argResult[0] + "':'" + argResult[1] + "'";
            if (i != args.length - 1) {
                argsInfo += ',';
            }
        }
        argsInfo += "}";
        return eval('(' + argsInfo + ')');
    }

    /**
     *无权限提示
     **/
    function noAuthTip(res) {
        if (res.msg != "") {
            pubUtil.msg(res.msg, layer, 2, function () {
            }, 20 * 1000);
        }
    }
</script>
