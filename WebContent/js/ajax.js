  var xmlhttp;
xmlhttp = new XMLHttpRequest();
xmlhttp.onreadystatechange = function(){
	if(xmlhttp.readyState==4 && xmlhttp.status==200)
	{
		document.getElementById("userInfo").innerHTML = responseText;
	}
};
xmlhttp.open("GET","../src/project4/DBCquery", true);
xmlhttp.send();