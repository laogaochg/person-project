<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>系统登录</title>
<#include "common/baseImport.ftl" />
    <link href="${context.contextPath}/css/login/login.css" rel="stylesheet" rev="stylesheet" type="text/css"
          media="all"/>

</head>

<body>
<div class="content">
    <div class="login-aside">
        <div id="o-box-up"></div>
        <div id="o-box-down" style="table-layout:fixed;">
            <div class="error-box"></div>
            <div class="bt">
                登录
            </div>
        <#if message?exists>
            <div style="color:#F00">${message}</div>
        </#if>
            <form class="form-horizontal loginForm" action="login" role="form" method="post">
                <div class="fm-item">
                    <input class="form-control username grey" name="username" id="fusername" type="text"
                           value="alice@test.com">
                </div>
                <div class="fm-item">
                    <input type="password" name="password" class="form-control password grey" id="inputPassword"
                           value="123">
                </div>
                <div class="fm-item pos-r">
                    <input class="form-control yzm grey verifyCode" name="verifyCode" id="yzm" type="text"
                           value="请输入你的验证码">
                    <div class="yz-img">
                        <img id="authImage" src="${context.contextPath}/authImage" class="yzm-img"/>
                    </div>
                </div>
                <div class="checkbox fm-item">
                    <label>
                        <input type="checkbox">记住密码
                    </label>
                </div>
                <div class="fm-item">
                    <button type="button" id="send-btn">登录</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="footer">
    <p>power By 中国南方航空有限公司 Copyright 2017 all Rights Rersserved</p>
</div>
<script type="text/javascript">
    var authImage = document.getElementById("authImage");
    authImage.onclick = function changeImg() {
        var img = document.getElementById("authImage");
        img.src = "${context.contextPath}/authImage?date=" + new Date();
    };
    $(".username").focus(function () {
        var username = $(this).val();
        if (username == '请输入你的用户名') {
            $(this).val('').addClass("black").removeClass("grey");
            ;
        }
    });

    $(".username").focusout(function () {
        var username = $(this).val();
        if (username == '') {
            $(this).val('请输入你的用户名').addClass("grey").removeClass("black");
        }
    });


    $(".password").focus(function () {
        var username = $(this).val();
        if (username == '请输入你的密码') {
            $(this).val('').addClass("black").removeClass("grey");
            ;
        }
    });
    $(".password").focusout(function () {
        var username = $(this).val();
        if (username == '') {
            $(this).val('请输入你的密码').addClass("grey").removeClass("black");
            ;
        }
    });

    $(".yzm").focus(function () {
        var username = $(this).val();
        if (username == '请输入你的验证码') {
            $(this).val('').addClass("black").removeClass("grey");
            ;
        }
    });

    $(".yzm").focusout(function () {
        var username = $(this).val();
        if (username == '') {
            $(this).val('请输入你的验证码').addClass("grey").removeClass("black");
            ;
        }
    });
    $("#send-btn").click(function () {
        var verifyCode = $(".verifyCode").val();
        if ("请输入你的验证码" == verifyCode || !verifyCode) {
            $(this).val('').addClass("black").removeClass("grey");
            $(".verifyCode").focus();
        } else {
            $("[name=verifyCode]").parents("form").submit();
        }
    });
</script>
</body>

</html>
