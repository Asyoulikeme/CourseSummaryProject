
var userNumber = document.getElementById("userNumber");
var userPassword = document.getElementById("userPassword");
var submit = document.getElementById("submit");
var rememberMe = document.getElementById("rememberMe");

var xmlhttpAddCookie = new XMLHttpRequest();
var xmlhttpAddCookieURL;
xmlhttpAddCookieURL = "/project4/AddLoginCookies"; /*将用户信息放到Cookie*/


submit.onclick = function(){
	if(rememberMe.checked){		/*这是直接完成  提交信息正确*/
		xmlhttpAddCookie.onreadystatechange = function(){
			if(xmlhttpAddCookie.readyState == 4 && xmlhttpAddCookie.status == 200){
				return true;
			}
		};
		xmlhttpAddCookie.open("POST", xmlhttpAddCookieURL);
		xmlhttpAddCookie.setRequestHeader("Content-type","application/x-www-form-urlencoded"); /*必须设置请求头*/
		xmlhttpAddCookie.send("userNumber=" + userNumber.value + "&" + "userPassword=" + userPassword.value);
	}
};


	




