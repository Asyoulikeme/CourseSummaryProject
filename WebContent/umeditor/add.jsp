<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <title>发表主题</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="third-party/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="umeditor.min.js"></script>
    <script type="text/javascript" src="lang/zh-cn/zh-cn.js"></script>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="js/bootstrap.min.js"></script>
	  <style type="text/css">
	  a{
	  	color:#fff;
	  	    text-decoration: none;
	  }
	  a:hover {
	  	color:#fff;
	  	    text-decoration: none;
	  }
     body{
          background: #f1f4f9;
     }
     .content-box{
     	padding: 0;
     }
     .header{
     	height: 100px;
     	padding: 0;
     	background: #4a8bac; /*要使用媒体查询 这里在手机端出了问题*/
     }
     .title-nav{
     	height: 42px;
     	background: rgba(0,0,0,.3);
     }

     .col-sm-8,.col-sm-6{
     	padding-left: 0;
     	padding-right: 0;
     }

     .userName{
     	display:inline-block;
     	height:inherit;
     	color:#fff;
     	margin-right:50px;
     	line-height:3em;
     }
     .block-select{
        width: 110px;
        padding-left: 10px;
        background: url(images/pub_post_bg.png) no-repeat 0px -96px;
        border-radius: 5px;
        outline: none;
        height: 31px;
        line-height: 31px;
        font-size: 12px;
        color: #666;
        -webkit-appearance:none;
        -moz-appearance:none;
        -ms-appearance:none;
        appearance:none;
    }
 </style>
  <link href="css/top_item.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="col-sm-12 content-box">
		<div class="col-sm-12 header">
			<div class="col-sm-12 blur-user">
				
			</div>
			<div class="col-sm-12 user">
				<div class="col-sm-8 item-warpper">
					<ul class="item-warpperl">
						<li class="nav-item home"><a href="../topic/index.jsp">主站</a></li>
						<li class="nav-item"><a href="#">修改个人信息</a></li>
						
						<li class="nav-item"><a href="#">联系我们</a></li>
					</ul>
					<div class="item-warpperr">
						<div class="userName">
							<c:if test="${!empty currentUserName}">
									<a id="person" href="../person.jsp">${currentUserName}的发表页</a>
							</c:if>
						</div>
						<div id="face-box">
							&nbsp;
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
	<form action="../PublishStorageServlet" class="form-inline" role="form" style="margin-bottom: 30px;" method="post">
			<select name="topic-block" class="block-select">
                        <option value="">选择主题分类</option>
                        <option value="游戏">游戏</option>
                        <option value="科技">科技</option>
                        <option value="生活">生活</option>
                        <option value="娱乐圈">娱乐圈</option>
                        <option value="ACG">ACG</option>
                        <option value="电竞">电竞</option>
                        <option value="死肥宅">死肥宅</option>
                        <option value="音乐">音乐</option>
                        <option value="数码">数码</option>
                        <option value="明星">明星</option>
                        <option value="经验杂谈">经验杂谈</option>
                        <option value="测评">测评</option>
                        <option value="时尚">死肥宅</option>
                        <option value="谈天说地">谈天说地</option>
                    </select>
			<input type="text" id="title" name="topic-title" class="form-control" style="width:calc(998px - 112px);" placeholder="请输入标题">
				<script type="text/plain" id="myEditor" name="topic-content" style="width:1000px;height:240px;">
	
	</script>
			<button type="submit" class="btn btn-primary btn-block"  style="width: 30%;margin-top: 20px;">提交</button>
	</form>

	
	
</div>
</div>
<script type="text/javascript">
    var um = UM.getEditor('myEditor');
    function postContent() {
        var arr = [];
        arr.push("这里使用Ajax提交给服务器");
		arr.push("标题："+document.getElementById("title").value)
        arr.push("内容：");
        arr.push(UM.getEditor('myEditor').getContent());
        alert(arr.join("\n"));
    }
</script>
</body>
</html>