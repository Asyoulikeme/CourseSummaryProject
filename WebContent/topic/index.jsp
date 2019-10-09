<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>index</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8"> 
	<!-- 引入 Bootstrap -->
	<link href="js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
	<!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
      <!--[if lt IE 9]>
         <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
         <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    body{
     background: #f1f4f9;
}
a{
    color:#fff;
    text-decoration: none;
}
a:hover {
    color:#fff;
    text-decoration: none;
}
.content-box{
 padding: 0;
}
.header{
 height: 100px;
 padding: 0;
 background: #4a8bac; /*要使用媒体查询 这里在手机端出了问题*/
}
#person{
 color:white;
}
.title-nav{
 height: 42px;
 background: rgba(0,0,0,.3);
}
.content-warrper{
     /*border: 1px solid red;*/
}
.main-content{
 width:933.5px;
 /*border: 1px solid red;*/
 margin: 0 auto;
 height: calc(768px);
 float: none;
 /*overflow:hidden;*/
}
.col-sm-8,.col-sm-6{
 padding-left: 0;
 padding-right: 0;
}

h3{
 color: #666;
}

.user_head{
 border-right:1px dashed #8F8F8F;
 height:100%;
 padding:15px;
 background:#4a8bac url(images/img_avatar.png) content-box 0 / 100% no-repeat;
}
.topic{
 width:933.5px;		
 padding:0;
 /*border:1px dashed #03a9f4;*/
 height:calc(16.66667%);
 background:#fff;
 transition:all .4s ease-in-out;
 border-radius:5px;
 box-shadow:0 1px 15px -1px rgba(0,0,0,.3);
 margin-bottom:10px;
 cursor:pointer;
}
.topic:hover{
 transform:scale(1.03);
}
.title_content_wrapper{
 height:100%; 
}
.title{
 display:block;
 height:70%;
 padding:20px 0;
 border-bottom:1px dashed #8F8F8F;
 font-family:"consolas","Microsoft yahei";
 margin:0;
 line-height:2.5em;
}
.content{
 display:block;
 font-family:"Microsoft yahei";
 font-style:italic;
}
.userName{
 display:inline-block;
 height:inherit;
 color:#fff;
 margin-right:50px;
}
.btn_box{
     /*border: 1px solid red;*/
     position: absolute;
     bottom: 5%;
     left:26.2%;
}
.btn_box button{
     background: #4a8bac;
     border: none;
     color:#fff;
     padding: 10px 25px;
     border-radius:5px;
     text-align:center;
}
.fixedSearch_wrapper{
    position: fixed;
    z-index: 999;
    height: 290px;
    background-color: #fff;
    float: none;
    right: 4vw;
    top: 50%;
    transform: translateY(-50px);
    border-radius: 5px;
    padding: 2px;
    padding-left: 14px;
    padding-top: 10px;
    padding-bottom: 15px;
    width: 13%;
}

.fixedSearch_wrapper button{
     margin: 2px;
}
.fixedSearch_wrapper button:hover{
     animation:fixbutton .1s cubic-bezier(.46,-0.59,.63,1.51);
}
@keyframes fixbutton{
     from{
          transform: translateX(-5px);
     }
     20%{
          transform: translateX(0px);
     }
     40%{
     	transform: translateX(5px);
     }
     60%{
     	transform: translateX(0px);
     }
     80%{
     	transform: translateX(-5px);
     }
     to{
          transform: translateX(5px);
     }
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
						<li class="nav-item home"><a href="index.jsp">主站</a></li>
						<c:if test="${empty currentUserName}">
							<li class="nav-item"><a href="../login.jsp">登陆</a></li>
						</c:if>
						<li class="nav-item"><a href="../regiest.html">注册</a></li>
						<li class="nav-item"><a href="#">联系我们</a></li>
					</ul>
					<div class="item-warpperr">
						<div class="userName">
							<c:if test="${!empty currentUserName}">
                                  <a id="person" href="../person.jsp">${currentUserName}</a>
                            </c:if>
                             <c:if test="${empty currentUserName}">
                             	你好游客，请<a href="../login.jsp">登陆</a>
                        </c:if>

                   </div>
                   <div id="face-box" style="color:#fff">
                  
                  	<c:if test="${!empty currentUserName}">
                  		<a href="../umeditor/add.jsp" class="ulink">发布</a>
                  	</c:if>
                  	当前在线人数：${applicationScope.userCount}
                 </div>
            </div>
       </div>
  </div>
</div>
<div class="col-sm-12 content-warrper">
   <div class="col-sm-2 fixedSearch_wrapper">
          <div class="search_tips">
               
          </div>
       <button type="button" class="btn btn-success col-sm-7">科技</button>
       <button type="button" class="btn btn-info col-sm-4" >生活</button>
       <button type="button" class="btn btn-warning col-sm-3">游戏</button>
       <button type="button" class="btn btn-danger col-sm-8">谈天说地</button>
       <button type="button" class="btn btn-info col-sm-7" >ACG</button>
       <button type="button" class="btn btn-success col-sm-4">电竞</button>
       <button type="button" class="btn btn-danger col-sm-6">死肥宅</button>
       <button type="button" class="btn btn-warning col-sm-5">音乐</button>
       <button type="button" class="btn btn-primary col-sm-4">娱乐圈</button>
       <button type="button" class="btn btn-info col-sm-7">欢迎加入论坛</button>
       <button type="button" class="btn btn-info col-sm-6" >数码</button>
       <button type="button" class="btn btn-danger col-sm-5">明星</button>
       <button type="button" class="btn btn-primary col-sm-3">测评</button>
              <button type="button" class="btn btn-warning col-sm-5">经验杂谈</button>
       <button type="button" class="btn btn-success" style="width: 23.3%">时尚</button>


  </div>
  <div class="col-sm-12 main-content" id="main_content">

  </div>
  <div class="btn_box">
     <button value="" type="button" id="before">上一页</button>
     <button value="" type="button" id="after">下一页</button>
</div>

</div>
</div>
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="js/jquery.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/search.js"></script>
<script>

// location Ajax 
var body = document.getElementsByTagName('body')[0];
var xmlhttp = new XMLHttpRequest();
body.onload = function(){
     var xmlurl = "../TopicCount";

     xmlhttp.onreadystatechange = function(){
      if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
       pushUserMsg();
  }
};
xmlhttp.open("POST",xmlurl);
xmlhttp.send();
};

var topicCount = 0;
var lastPage = 0;

// fill topic info 
function pushUserMsg(){
     console.log("原始数据为:" + xmlhttp.responseText);

     var jsonText = eval("("+ xmlhttp.responseText +")");

     console.log("处理后的数据为:" + jsonText);
     var i ;
     for(i = 0; i < jsonText.length-1 ; i++)
     {
		/*console.log(jsonText[i].title);
		console.log(jsonText[i].user);
		console.log(jsonText[i].publishTime);*/
		topicMsgFactory(jsonText[i].id,jsonText[i].title,jsonText[i].user,jsonText[i].publishTime,jsonText[i].toBlock);
	}

     topicCount = parseInt(jsonText[i].count,10);
     //console.log("转换后的: " + topicCount + Number(topicCount) + isNaN(topicCount));
     console.log("topicCount is:" + topicCount);
     lastPage = (topicCount%5) > 0 ? Math.ceil(topicCount/5):(topicCount/5);
     console.log("THE LAST PAGE "+lastPage);
}
var topic;
var userHead;
var titleContentWrapper;
var h3Title;
var h4Content;
var alink;

var mainContent = document.getElementById('main_content');
var before = document.getElementById('before');
var after = document.getElementById('after');


var start = 5;
var stop = 5; // sql limit value2 forever is 5



var currentPage = 1;
before.onclick = function(){
     if (currentPage-1 == 0)
     {
          console.log("已经到了第一页了");
          currentPage = 1;
          return false;
     }
     
     checkRemove(); // init 

     currentPage--;
     console.log("currentPage:" + currentPage);
     start = (currentPage -1) * 5;

     var xmlurl = "../TopicCount?start=" + start +"&stop=" + stop;
     xmlhttp.onreadystatechange = function(){
          if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
               pushUserMsg();
          }
     };

     xmlhttp.open("POST",xmlurl);
     xmlhttp.send();
}

after.onclick = function(){

     console.log("TAST PAGE NUM:"+lastPage);
     if (currentPage == lastPage)
     {    

          console.log("已经到了最后了");
          currentPage = lastPage;
          return false;
     }
     
     checkRemove(); // init 
     currentPage++;
     console.log("currentPage:" + currentPage);
     start = (currentPage -1) * 5;

     var xmlurl = "../TopicCount?start=" + start +"&stop=" + stop;
     xmlhttp.onreadystatechange = function(){
          if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
               pushUserMsg();
          }
     };

     xmlhttp.open("POST",xmlurl);
     xmlhttp.send();
}
// ElementsFactory
function topicMsgFactory(a,e,t,c,b){

     //checkRemove();

     topic = document.createElement('div'); /**/

     //console.log("this is topic: " + topic);
     topic.setAttribute('class','col-sm-12 topic'); /*跳转链接先不做*/
     mainContent.appendChild(topic);

     userHead = document.createElement('div'); /**/
     userHead.setAttribute('class','col-sm-2 user_head');
     topic.appendChild(userHead);

     titleContentWrapper = document.createElement('div'); /**/
     titleContentWrapper.setAttribute('class','col-sm-10 title_content_wrapper');
     topic.appendChild(titleContentWrapper);


     alink = document.createElement('a');
     alink.setAttribute("href","../ShowTopic?topic_id=" + a);  /*链接在此！！！！！！*/
     titleContentWrapper.appendChild(alink);


     h3Title = document.createElement('h3'); /**/
     h3Title.setAttribute('class','title');
     alink.appendChild(h3Title);

     h3Title.innerHTML = "["+ b +"] " + e;

     h4Content = document.createElement('h4'); /**/
     h4Content.setAttribute('class','content');
     titleContentWrapper.appendChild(h4Content);
     h4Content.innerHTML = t +" 发表于 "+ c;

     topic.setAttribute("title","ShowTopic?topic_id=" + a);

    // fromIndexJspCreated();

}
function checkRemove(){

     if (
          Object.prototype.toString.call(topic) === '[object HTMLDivElement]' &&
          Object.prototype.toString.call(userHead) === '[object HTMLDivElement]'&& 
          Object.prototype.toString.call(titleContentWrapper) === '[object HTMLDivElement]'&&
          Object.prototype.toString.call(h3Title) === '[object HTMLHeadingElement]'&&
          Object.prototype.toString.call(h4Content) === '[object HTMLHeadingElement]'
          ) 
     {
          //console.log("yes");

          while(mainContent.hasChildNodes())
          {
               mainContent.removeChild(mainContent.firstChild);
               //console.log("child be removed");
          }
     }    
     else
     {
          console.log("no");
     }
}


</script>

</body>
</html>