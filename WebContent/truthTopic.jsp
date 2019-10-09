<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.io.*,java.util.*"
import="java.text.*"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link href="umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
     <script type="text/javascript" src="umeditor/third-party/jquery.min.js"></script>
     <script type="text/javascript" charset="utf-8" src="umeditor/umeditor.config.js"></script>
     <script type="text/javascript" charset="utf-8" src="umeditor/umeditor.min.js"></script>
     <script type="text/javascript" src="umeditor/lang/zh-cn/zh-cn.js"></script>
     <script src="js/bootstrap.min.js"></script>
     <title>${topic_title}</title>
     <link href="css/bootstrap.min.css" rel="stylesheet">
     <style type="text/css">
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
     	
     	height:35%;
     	padding:15px;
     	background:#4a8bac url(images/img_avatar.png) content-box 0 / 100% no-repeat;
     }
     .comment_user_head{
          
          height:60%;
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
     	line-height:42px;
     	color:#fff;
     	margin-right:50px;
     }
     .nav-item a{
     	color:#fff;
     	text-decoration: none;
     }
     .topTopic_wrapper{

          height: 500px;
     }
     .topTopic{

         height: 500px;
         padding: 0;
         float: none;
         margin: 0 auto;
         box-shadow: 0 1px 15px -1px rgba(0,0,0,.3);
    }
    .left_user{
     height: inherit;
     background: #f1f4f9;

}
.right_truthTopic{
     height: 500px;
     float: right;
     background: #fff;
     overflow: hidden;
}
.top_topic_title{
     border-bottom: 1px dashed #676767;
     height: 50px;
     text-indent: 1em;
     line-height: 50px;
     font-weight: bold;
     text-align: center;
}
.topic_status{
     border-bottom: 1px dashed #676767;
     height: 50px;
     text-align: center;
     line-height: 50px;
     color:#999;
     font-size: 12px;
}
.user_info{
     height: 65%;
     padding:15px;
     background:#f1f4f9 content-box no-repeat;
}
.comment_user_info{
     height: 40%;
     padding:15px;
     background:#f1f4f9 content-box no-repeat;
     text-align: center;
}
.topic_content_body{
     padding-top: 50px;
     height: auto;
}
.comment_wrapper{
     height: 500px;
     margin-top: 15px;
}
.form_wrapper{
     float: none;
     margin: 0 auto;
     height: 300px;
     position: relative;
     padding: 0;
}
.form-inline{
     width: auto;
     float: right;
     padding: 0;
     position: relative;
}
.edui-btn-toolbar{
     width: 83.33333333%;
}
.edui-container{
     width: 95.33333333%;z-index: 999;
}
.currentUser{
     background: #fff;
     box-shadow: 0 1px 15px -1px rgba(0,0,0,.3);
     height: 100%;
}
.comment-box{
     margin:10px 0; 
     height: 300px;
}
.comment{
     height: 300px;
     float: none;
     margin:0 auto;
     background: #fff;
     box-shadow: 0 1px 15px -1px rgba(0,0,0,.3);
     border-radius:3px; 
}
.head_box{
     background: #f1f4f9;
     height: 300px;
}
.content_box{

     height: 300px;
}
.user_comment_content{
     padding: 50px;
     height: 100%;

}
.user_comment_status{
     padding: 0;
     height: 100%;
     padding: 10px 0;
     position: relative;
}
.layernum{
  width: 44px;
    height: 20px;
    background: #407c98;
    font-style: italic;
    color: #fff;
    text-align: center;
    line-height: 16px;
    box-shadow: 0 1px 15px -1px rgba(0,0,0,.3);
    border-radius: 3px;
    padding: 2px 15px;
    padding-right: 37px;
    position: absolute;
    right: 65px;
}
.user_comment_time{
     height: 10%;
     position: absolute;
     left: 0px;
     bottom: 10px;
     color: #776f6f73;
}

.addlink{

    width: 58px;
    height: 42px;
    background: #fb7299;
    border-radius: 0 0 5px 5px;
    color: white;
    font-size: 13px;
    font-family: "Microsoft yahei";
    text-align: center;
    line-height: 42px;
    text-decoration: none;
    position:absolute;
    top:0;
    left:0;
    
}
.addlink:hover {
	color: white;
	text-decoration: none;
}
.item-warpperr{
	width:185px;
	position:relative;
}
.toptop{
     position: absolute;
     right: -30px;
     top: 10px;
     width: 100px;
     height: 25px;
     background: #ff6600;
     text-align: center;
     color:#fff;
     line-height: 25px;
     transform: rotate(45deg);
}
.mask{
display:block;
  height: 100%;
  background: rgba(0,0,0,.5);
  width: 1030px;
  position: absolute;
  z-index: 9999;
  right: 0;
  text-align: center;
  line-height: 300px;
  color: #fff;
}
.mask a{
  color:#fb7299;
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
                        <li class="nav-item"><a href="topic/index.jsp">主站</a></li>
                        <li class="nav-item"><a href="#">修改个人信息</a></li>
                        <li class="nav-item"><a href="#">联系我们</a></li>
                   </ul>
                   <div class="item-warpperr">
                        <div class="userName">
							<c:if test="${!empty currentUserName}">
								<a id="person" href="person.jsp">${currentUserName}</a>
							</c:if>	
                        </div>
                        <div id="face-box">
                              <c:if test="${!empty currentUserName}">
                  				<a href="umeditor/add.jsp" class="ulink">发布</a>
                  			  </c:if>
                       </div>
                  </div>
             </div>
        </div>
   </div>
   <div class="col-sm-12 topTopic_wrapper">
     <div class="col-sm-8 topTopic">
          <div class="col-sm-2 left_user">
               <div class="col-sm-12 user_head">

               </div>
               <div class="col-sm-12 user_info">

               </div>
          </div>
          <div class="col-sm-10 right_truthTopic">
               <div class="toptop">楼主</div>
               <div class="col-sm-12 top_topic_title" id = "topicID">
                   ${topic_title}
              </div>
              <div class="col-sm-12 topic_status">
               本贴最后由 ${topic_user} 修改 发布 时间 ${topic_publish_time}
          </div>
          <div class="col-sm-12 topic_content_body">
               ${topic_content}
          </div>
     </div>
</div>
</div>
<!--
<div class="col-sm-12 comment-box">
     <div class="col-sm-8 comment">
          <div class="col-sm-2 head_box">
               <div class="col-sm-12 comment_user_head">
                    
               </div> 
               <div class="col-sm-12 comment_user_info">
                    
               </div>
          </div>
          
          <div class="col-sm-10 content_box">
               <div class="col-sm-10 user_comment_content">
                    
               </div>
               <div class="col-sm-2 user_comment_status">
                    <span class="layernum">
                         21#
                    </span>
                    <span class="col-sm-12 user_comment_time" >
                         2019-01-8 12:00:12
                    </span>
               </div>
          </div>
         -->
     </div>
</div>
<div class="col-sm-12 comment_wrapper">

     <div class="col-sm-8 form_wrapper">
    
				<span class="mask">
     				你还没有<a href="">登陆</a>，请先登陆再进行操作
     			</span>
			

          <div class="col-sm-2 currentUser"></div>
          <form action="Commentsubmit" class="col-sm-10 form-inline" role="form"  method="post" style="position: relative;">
               <script type="text/plain" id="myEditor" name="topic-content" style="width:100%; height:240px;"></script>
               <input type="text" name = "topic_id" id="currentTopicID" value="${topic_id}" style="display:none">
               <input type="text" name = "" id="currentUserID" value="${currentUserName}" style="display:none">
               <button type="submit" id="commentSubmit" class="btn btn-primary btn-block"  style="width: 30%;margin-top: 20px;">提交</button>
          </form>
     </div>
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

var body = document.getElementsByTagName('body')[0];
body.onload = function(){
     var xmlhttp;
     xmlhttp = new XMLHttpRequest();
     xmlhttp.onreadystatechange = function(){
          if(xmlhttp.readyState==4 && xmlhttp.status==200)
          {
               console.log(xmlhttp.responseText);

               var commentMSG = eval('('+ xmlhttp.responseText +')');

               if (commentMSG.length > 0) {
                    pushCommentMessage(commentMSG);
               }
               
          }
     };
     var currentTopicID = document.getElementById("currentTopicID").value;
     xmlhttp.open("POST","LoadComment?topic_id=" + currentTopicID);
     xmlhttp.send();
     
     var currentUserID = document.getElementById("currentUserID").value;
     console.log(currentUserID);
     if(currentUserID)
     {
    	 var mask = document.getElementsByClassName('mask')[0];
    	 mask.style.display = "none";
     }
     else
    	 {
    	 mask.style.display = "block";
    	 }
}
function pushCommentMessage(MSG){
     console.log("yes");
     var parents = document.getElementsByClassName('content-box')[0];
     console.log(parents.childNodes);
     for(var i = 0 ; i < MSG.length ; i ++)
     {    

          var commentBox = document.createElement('div');
          commentBox.setAttribute("class","col-sm-12 comment-box");
          parents.insertBefore(commentBox,parents.childNodes[4]);

          var comment = document.createElement('div');
          comment.setAttribute("class","col-sm-8 comment");
          commentBox.appendChild(comment);

          var headBox = document.createElement('div');
          headBox.setAttribute("class","col-sm-2 head_box");
          comment.appendChild(headBox);

          var commentUserHead = document.createElement('div');
          commentUserHead.setAttribute("class","col-sm-12 comment_user_head");
          headBox.appendChild(commentUserHead);

          var commentUserInfo = document.createElement('div');
          commentUserInfo.setAttribute("class","col-sm-12 comment_user_info");
          headBox.appendChild(commentUserInfo);
          commentUserInfo.innerHTML = MSG[i].reply_user;

          var contentBox = document.createElement('div');
          contentBox.setAttribute("class","col-sm-10 content_box");
          comment.appendChild(contentBox);

          var userCommentContent = document.createElement('div');
          userCommentContent.setAttribute("class","col-sm-10 user_comment_content");
          contentBox.appendChild(userCommentContent);
          userCommentContent.innerHTML = MSG[i].reply_content;

          var userCommentStatus = document.createElement('div');
          userCommentStatus.setAttribute("class","col-sm-2 user_comment_status");
          contentBox.appendChild(userCommentStatus);

          var layernum = document.createElement('span');
          layernum.setAttribute("class","layernum");
          userCommentStatus.appendChild(layernum);
          layernum.innerHTML = (i+1) + "#";

          var userCommentTime = document.createElement('span');
          userCommentTime.setAttribute("class","col-sm-12 user_comment_time");
          userCommentStatus.appendChild(userCommentTime);
          userCommentTime.innerHTML = MSG[i].reply_time;
     }
}
</script>
</body>
</html>