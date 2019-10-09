<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登陆</title>
<link rel="stylesheet" type="text/css" href="./css/login.css">
</head>
<body>
		<div class="layout">
		<div class = "header">橘子账号登陆</div>
		<div class = "contents">
		<div class = "regiestbox">
		<form action="loginServlet" method="post">
			<div class="label1"><span id = "forLabel1">${msg}</span><input type="text" id="userNumber" name="userNumber" maxlength="12" required="required" placeholder="账号："><span id="userNumberTips"> </span></div>
			<input type="password" id="userPassword" name="userPassword" required="required" placeholder="密码：">
			<div class="ex-function">
			<a href="regiest.html" id="autoLogin">立即注册</a>
			<input type="checkbox" id="rememberMe"><label for="rememberMe">记住密码</label>
			</div>
			
			<input type="submit" name="userSubmit" id="submit" value="登陆">
		</form>
		</div>
		</div>
		</div>

<script type="text/javascript" src="./js/loginAjax.js"></script>
<script type="text/javascript" src="./js/getCookies.js"></script>
<script>
var userNumber = document.getElementById('userNumber');
userNumber.onfocus = function(){
	console.log("in onfocus");
	userNumber.onkeydown = function(){
		console.log("in onkeydown");
		setTimeout(clearform,100);

	}
function clearform(){
	if(userNumber.value == ""){
		console.log("deleted");
		var userPassword = document.getElementById('userPassword');
		userPassword.value = "";
	}
}
	
}
</script>
</body>
</html>