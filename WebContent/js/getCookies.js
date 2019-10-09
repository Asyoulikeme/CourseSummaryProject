var body = document.getElementsByTagName('body')[0];
body.onload=function(){
	var cookie  = getCookie();
	if(cookie.userNumber != undefined)
	{
		var userNumber = document.getElementById('userNumber');
		var userPassword = document.getElementById('userPassword');

		userNumber.value = cookie.userNumber;
		userPassword.value = cookie.userPassword;
	}

};
function getCookie(){
	var loginCookie = {}; //初始化最后要返回的对象
	var all = document.cookie;	// 取出存储的 cookie
	//console.log("the all:" + all); //打印出来 会是
	if (all === "")
	 {
	 	return loginCookie;		//这个函数的回退原则 出口
	 }
	 var list = all.split("; ");	// 将所有的cookie
	// console.log("the list:" + list); //会把字符串分割为一个 字符串数组  这里的格式将会是  value1,value2,value .... 像数组一样被逗号分开
	for(var i = 0; i < list.length ; i++)
	{
		
		var cookie = list[i];
		var p = cookie.indexOf("="); //将等于号的下标记录
		var name = cookie.substring(0,p); // 这个函数不是驼峰命名法

		if(name == "userNumber" || name == "userPassword")	// 当取出的cookie list 里面有 用户名 或者 用户密码 的时候 才
		{
			var value = cookie.substring(p+1); // stat 必须 stop 可选
			value = decodeURIComponent(value); // 一般保存 cookie 时 值不能有 分号 逗号 空白符 所以存值的时候 要 encodeURIComponent 进行编码 取出也得 解码 这里作为回退原则

			// 可使用 cookie.name 动态的修改对象  向对象中添加一条 叫name的属性
			loginCookie[name] = value; 			// 牢记 ArrayName.name 等价于 ArrayName["name"] 这里要求 name 是个字符串,  这一行的 name 已经在 line 19 定义
		}
		
	}
	 
	 return loginCookie;	  //userNumber 等于 1195862472 
}