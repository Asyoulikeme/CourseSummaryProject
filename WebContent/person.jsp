<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.io.*,java.util.*"
import="java.text.*"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>${currentUserName}的个人空间</title>
     <link href="css/bootstrap.min.css" rel="stylesheet">
     <style type="text/css">
     body{
          background: #f1f4f9;
          height: 1080px;
          overflow: hidden;
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
     .content-warrper{
     	
     	height: 500px;
     }
     .main-content{
     	width:933.5px;
     	/*border: 1px solid red;*/
     	margin: 0 auto;
     	height: calc(768px);
     	float: none;
     }
     .loopbg{
     	height: 500px;
     	padding: 0;
     	margin: 0;
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
     	height:300px;
     	padding:15px;
     	background:#4a8bac url(images/img_avatar.png) content-box top / 100% no-repeat;
          border-radius:5px; 
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
     .user_info{
          height: 1080px;
          float: none;
          margin: 0 auto;
          margin-top: 100px;
          padding-top: 50px;
          background: #fff;
     }
     .item-warpperr{
      width:185px;
      position:relative;
 }
 .user_person_info{
     height: 300px;
     padding: 15px;
}
.user_info_calc{
     height: 300px;
     padding: 15px;
}
.panel-default{
     height: 100%;
}
.panel-title{
     text-align: center;
}
.panel-body{
     padding-left: : 5em;
}
.panel-body .info_title{
     display: block;
     width: 100%;
     height: 40px;
     line-height: 40px;
}
.info_content{
    display: block;
    height: 40px;
    line-height: 40px;
    width: 90%;
    position: absolute;
    right: 0;
    top: 0;
}
.info_title{
     position: relative;
}
.link{
     display: inline-block;
     position: absolute;
     right: 10%;
     top: 10%;
}
#lastAccessTime{
     display: block;
     height: 40px;
     line-height: 40px;
     width: 90%;
     position: absolute;
}
#topicNum{
     text-indent: 3em;
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
           <a href="topic/index.jsp"><li class="nav-item home">主站</li></a>
           <a href="modify.jsp"><li class="nav-item">修改个人信息</li></a>

           <a href="#"><li class="nav-item"><a href="LogoutServlet">注销</a></li></a>
      </ul>
      <div class="item-warpperr">
           <div class="userName">

           </div>
           <div id="face-box">
            <a href="umeditor/add.jsp" class="ulink">发布</a>
       </div>
  </div> 
</div>
</div>
</div>
<div class="col-sm-8 user_info">
     <div class="col-sm-2 user_head"></div>
     <div class="col-sm-8 user_person_info">
          <div class="panel panel-default">
               <div class="panel-heading">
                    <h3 class="panel-title" style="text-align: left; padding-left: 0.5em; transform: translateY(5px); ">
                         个人信息
                    </h3>
                    <h6><a class="link" href="modify.jsp">完善个人信息</a></h6>
               </div>
               <div class="panel-body">
                    <span class="info_title">账号：<span class="info_content" id="personID">${currentUserName}</span></span>
                    <span class="info_title">昵称：<span class="info_content" id="personName"></span></span>
                    <span class="info_title">性别：<span class="info_content" id="personSex"></span></span>
                    <span class="info_title">邮箱：<span class="info_content" id="personEmail"></span></span>
                    <span class="info_title">自我介绍：<span class="info_content" id="personSelfTalk"></span></span>
               </div>
          </div>
     </div>
     <div class="col-sm-2 user_info_calc">
          <div class="panel panel-default">
               <div class="panel-heading">
                    <h3 class="panel-title">
                         信息统计
                    </h3>
               </div>
               <div class="panel-body">
                    <span class="info_title">发帖数：<span class="info_content" id = "topicNum"></span></span>
                    <span class="info_title">最后登陆时间：
                         <span id="lastAccessTime">
                              <% 
                              Date lastAccessTime = new Date(session.getLastAccessedTime());
                              SimpleDateFormat timeformat = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
                              out.print(timeformat.format(lastAccessTime));
                              %>
                         </span>
                    </span>

               </div>
          </div>
     </div>
</div>
</div>
</div>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
     var body = document.getElementsByTagName('body')[0];
     body.onload = function(){
        var xmlhttp;
        xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function(){
          if(xmlhttp.readyState==4 && xmlhttp.status==200)
          {
              // document.getElementById("userInfo").innerHTML = responseText;
              console.log("yes");

              var MSG = eval('('+ xmlhttp.responseText +')');
              console.log(MSG);
              pushUserMSG(MSG);
         }
    };
    var personID = document.getElementById('personID').innerHTML;
    xmlhttp.open("POST","GetPersonInfo?userNumber=" + personID);
    xmlhttp.send();
}
function pushUserMSG(MSG){
     var personName = document.getElementById('personName');
     var personSex = document.getElementById('personSex');
     var personEmail = document.getElementById('personEmail');
     var personSelfTalk = document.getElementById('personSelfTalk');
     var topicNum = document.getElementById('topicNum');

     if (MSG[0].user_name) 
     {
          personName.innerHTML = MSG[0].user_name;

     }
     else  personName.innerHTM = "none";
     if (MSG[0].user_sex)
     {
          personSex.innerHTML = MSG[0].user_sex;
     }
     else personSex.innerHTML = "未知";
     if (MSG[0].user_email){
          personEmail.innerHTML = MSG[0].user_email;
     }
     if (MSG[0].user_self_talk){
          personSelfTalk.innerHTML = MSG[0].user_self_talk;
     }
     else
     {
          personSelfTalk.innerHTML = "这个人很懒，什么都没留下";
     }

     topicNum.innerHTML = MSG[1].topic_num;
}
</script>
</body>
</html>