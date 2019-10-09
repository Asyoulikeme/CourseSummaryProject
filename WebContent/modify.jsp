<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息修改页</title>
<link rel="stylesheet" type="text/css" href="css/clock.css"/>
<link rel="stylesheet" type="text/css" href="css/spiders.css"/>
<style type="text/css">
	textarea{
		min-width: 360px;
		min-height: 100px;
		max-width: 360px;
		max-height: 100px;
	}
	*{
	margin:0;
	padding:0;
	
}
body{
	width: 100vw;
	height: 1080px;		
	overflow: hidden;
	background:  #f5f5f5;
}
.layout{
    width: 854px;
    min-height: 620px;
    background-color: #fff;
    margin: 0 auto 200px;
    position: relative;
    top:8vw;
    font:20px bold;
    box-shadow:0 10px 15px -10px rgba(0,0,0,.3);
}


.header{
	width:inherit;
	height:192px;
	text-align:center;	
	line-height:380px;
	padding:0px 0px 50px 0;
	background:rgba(255,255,255,.1) url(../images/header.png) no-repeat center center/100px;
	
}
.contents{
	width:inherit;
	height:349px;
	margin-top:50px;
	font:"Microsoft Yahei";
}
.label1{
	position:relative;

}
#forLabel1{
	position:absolute;
	top:-30px;
	left:1em;
	font-size:5px;
	color:red;
}
.regiestbox{
	width:50%;
	height:192px;
	margin:0 auto;

	transform:translateX(30px);
}
.regiestbox input{
	
	width:calc(359px - 13px);
	margin-bottom:14px;
    padding: 13px 0 13px 10px;
    font-size:14px;
    background:transparent;
    border:1px solid #8299ae;
}

#userNumber{
	margin-top;50px;
}
#userNumberTips{
	display:block;
	width:46px;
	height:46px;
	position:absolute;
	top:0;
	right:5%;
	/*transform:translateY(-6px);*/
}
.tips{
	background:url(../images/true.png) no-repeat 0 / 100%;
}
#submit{
		cursor:pointer;
		display:block;
		width:359px;
		border:none;
		background:#8299ae;
		padding:13px 0px;
		color:#fff;
		margin-top:10px;
}
.ex-function{
	width:359px;
	height:20px;
	font-size:12px;
	color:rgba(0,0,0,.5);
	line-height:20px;
}
.ex-function input{
	display:inline-block;
	width:auto;
	transform:translateY(2px);
}
.ex-function label{
	display:inline-block;
	margin-left:2px;
}

	.opacitybox{
		background:rgba(0,0,0,.1);
	}
	#canvas1{
	position: absolute;
	top:0;
	left: 0;
	z-index: -1;
}
#selfIntroduce{
    background:transparent;
    border:1px solid #8299ae;
}
</style>
</head>
<body>
			<div>
				<div>
					<div id="main-body">			
						<div id="canvas">
							<div id='spidersOne'></div>
							<div id='spidersTwo'></div>
							<div id='spidersThree'></div>
						</div>	
					</div>
				</div>
				<div>
					<p id="clock">00:00</p>
					<p id="seconds">00</p>
					<p id="date">1.1.2017</p>
				</div>
			</div>
			<canvas id="canvas1" width="1920" height="1080">
			"Your browser is not support"
			</canvas>
		<div class="layout opacitybox">

		<div class = "contents">
		<div class = "regiestbox">
		<form action="Modify" method="post">
			<div class="label1"><span id = "forLabel1"></span><input type="email" id="userEmail" name="userEmail" maxlength="20" required="required" placeholder="邮箱："><span id="userNumberTips"> </span></div>
			<input type="text" id="userName" name="userName" placeholder="昵称：">
			<div class="ex-function">
				<input type="radio" id="male" name="sex_radio" value="男"><label for="male">男</label>
				<input type="radio" id="fmale" name="sex_radio" value="女"><label for="fmale">女</label>
			</div>
			<textarea id="selfIntroduce" name="selfIntroduce">
				
			</textarea>
			<input type="text" name="currentUserNumber" value="${currentUserName}" style="display:none;">
			<input type="submit" name="userSubmit" id="submit" value="提交">

		</form>
		</div>
		</div>
		</div>
<script type="text/javascript" src="js/modifyJS/js/clock.js" charset="utf-8"></script>
<script type="text/javascript" src="js/modifyJS/js/main.js"></script>
<script type="text/javascript" src="js/modifyJS/js/start.js"></script>
<script type="text/javascript" src="js/modifyJS/js/commonFunctions.js"></script>
</body>
</html>