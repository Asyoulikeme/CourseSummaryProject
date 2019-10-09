var btnlist = document.getElementsByClassName('btn');

for(var i = 0 ; i < btnlist.length ; i ++)
{
	sendObjecAddOnclick(btnlist[i]);
}

function sendObjecAddOnclick( obj ){
	obj.onclick = function(){
		var searchContent = obj.innerHTML;
		console.log(searchContent);

		var xmlhttp;
		xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				var MSG = eval('(' + xmlhttp.responseText +')');
				if (MSG.length > 0) {

					displaySearch(MSG);
				}
				else
				{
					alert("还没有该类帖子哦,快去发表吧！");
				}
				
			}
		};
		xmlhttp.open("GET","../SearchContent?topic_to_block=" + searchContent);
		xmlhttp.send();
	}
}

function displaySearch(MSG){
	// 如果有这个列表的帖子就 先 擦除 DOM list 然后再填入 调用之前写的函数 或者重载那个函数
	console.log(MSG);

	 checkRemove();

	 for(i = 0; i < MSG.length ; i++)
	 {
	 	topicMsgFactory(MSG[i].topic_id,MSG[i].topic_title,MSG[i].topic_user,MSG[i].topic_publish_time,MSG[i].topic_to_block);
	 }
	 

}