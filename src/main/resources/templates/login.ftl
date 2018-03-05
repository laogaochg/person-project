<!DOCTYPE html>
<html>
<head>
<title>LaySSH开发框架</title>
	<script type="text/javascript">

        var path = '${context.contextPath}';
        var basePath = window.location.protocol + "//"
				+window.location.host
				 + path + "/";
	</script>
<#include "inc.ftl" />
<link rel="stylesheet" type="text/css" href="${context.contextPath}/css/login.css"></link>
<style>
body {
	text-align: center
}
</style>
</head>
<body class="loginbody">
	<div id="top">
		<h1 style="margin-top:25px;color:#FFFFFF">LaySSH快速开发框架</h1>
	</div>
	<div id="loginbg" class="loginbg" style="margin:0 auto; width:500px; height:500px;">
		<div id="login_form" class="login_form">
			<p class="form_name">登录管理系统</p>
			<#if message?exists>
				<div style="color:#F00">${message}</div>
			</#if>
			<div id="table_login">
				<form name="loginForm" id="Login_loginForm" method="post" action="">
					<input type="text" placeholder="请输入用户名" value="admin" name="operCd" id="Login_operCd" class="name" /> 
					<input type="password" placeholder="请输入密码" value="1" class="password" name="operPwd" id="Login_operPwd" />
					<div class="yzm">
						<input type="text" placeholder="请输入验证码" class="code" name="code" id="Login_code" /> 
						<img id="Login_code_img" src="${context.contextPath}/authImage" style="cursor:pointer;" onclick="changeValidateCode()" title="点击图片刷新验证码" />
					</div>
						<button class="layui-btn"  style="width:200px" lay-submit="" lay-filter="btnSubmit">立即登录</button>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

layui.use(['form', 'layedit', 'laydate','jquery'], function(){
  var form = layui.form;
  var $ = layui.jquery;
		  
 
//监听提交
  form.on('submit(btnSubmit)', function(data){
	  	var operCd = $('#Login_operCd').val();//用户名
		var operPwd = $('#Login_operPwd').val();//密码
		var code = $('#Login_code').val();//验证码

		if (operCd == '') {
			pubUtil.msg("请输入用户名!", layer,1, function() {
			}, 1 * 1000);
			return false;
		}

		if (operPwd == '') {
			pubUtil.msg("请输入密码!", layer,1, function() {
			}, 1 * 1000);
			return false;
		}
		if (code == '') {
			pubUtil.msg("请输入验证码！", layer, 1, function() {
			}, 1 * 1000);
			return false;
		}
  	 var index = layer.load(1);//开启进度条
     $.ajax({
		url : '${context.contextPath}/login',
		 method:"post",
		data :{
            username:$("#Login_operCd").val(),
            password:$("#Login_operPwd").val(),
			code:$("#Login_code").val()
		},
		type : 'POST',//默认以get提交，以get提交如果是中文后台会出现乱码
		dataType : 'json',
		success : function(obj) {
			layer.close(index);//关闭   
			if (obj && obj.success) {
			 	layer.close(index);//关闭   
				window.location.href = "${context.contextPath}/"+"main";
			} else {
				layer.close(index);//关闭   
				changeValidateCode();//修改验证码
				$('#Login_operPwd').val('');//密码
				$('#Login_code').val('');//验证码
				pubUtil.msg(obj.msg, layer,2, function() {
				}, 1 * 1000);
			}
		}
	});
	return false;
});
  
		  
});

/**
 *刷新验证码
 */
function changeValidateCode() {
	var obj = $('#Login_code_img');
	var timenow = new Date().getTime();
	var url = "${context.contextPath}/authImage?d=" + timenow;
	$(obj).attr("src", url);
}

</script>
</html>
