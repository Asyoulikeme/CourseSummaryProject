
	var textlist = document.getElementById('forLabel1');
	var userNumber = document.getElementById('userNumber');
	var submit = document.getElementById('submit');
	var password_check = document.getElementById('password_check');
	var password = document.getElementById('password');
	var userPasswordTips = document.getElementById('userPasswordTips');
	var xmlhttp = new XMLHttpRequest();
	var xmlhttpurl;


	userNumber.onblur= function(){
		var textvalue = (userNumber.value);	/*取得文本框值*/
		if(textvalue.length == 0)			/*清除提示信息*/
		{
			document.getElementById('userNumberTips').classList.remove("tips");
			
			if(textlist.childNodes.length >=1 )
			{
				textlist.removeChild(textlist.childNodes[0]);
			}
		}
		
		if(textvalue.length >= 1)			/*当离开了文本框 且 文本框有值*/
		{
			xmlhttpurl = "AjaxFormCheck?userNumber="+userNumber.value;
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
				{
					isExist();
				}
			} 
			xmlhttp.open("POST", xmlhttpurl);
			xmlhttp.send();
		}
		}
		

	function isExist(){
		var str = xmlhttp.responseText;
		if(str =="true")
		{
			document.getElementById('userNumberTips').classList.add("tips");
			if(textlist.childNodes.length >=1 )								/*确保文本节点没内容*/
			{
				textlist.removeChild(textlist.childNodes[0]);
			}
			if(submit.getAttribute('disabled'))
			{
				submit.removeAttribute('disabled');
			}
		}
		if(str =="isExist")
		{
			document.getElementById('forLabel1').innerHTML = "用户名已被注册 !";
			document.getElementById('userNumberTips').classList.remove("tips");
			submit.setAttribute('disabled', 'disabled');
		}
	}
	password_check.onblur = function(){
		if(password.value == password_check.value)
		{
			console.log("yes");
			userPasswordTips.setAttribute('class', 'tips');
			if(submit.getAttribute('disabled'))
			{
				submit.removeAttribute('disabled');
			}
			console.log(textlist.innerHTML.length);
			if(textlist.innerHTML.length > 0)
			{
				console.log("no you");
				submit.removeAttribute('disabled');
			}
		}
		else
			{
			userPasswordTips.setAttribute('class', 'tipsError');
			submit.setAttribute('disabled', 'disabled');
				
			}
	}