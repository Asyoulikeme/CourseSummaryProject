
var body = document.getElementsByTagName('body')[0];
body.onload = function(){
	var xmlhttp = new xmlhttpRequest();
	var xmlurl = "servlet";
	xmlhttp.onreadystatechange = function(){
		if (xmlhttp.readyState == 4 && xmlhttp.status ==200) {
			pushUserMsg();
		}
	};
	xmlhttp.open("POST",xmlurl);
	xmlhttp.send();

};
function pushUserMsg(){
	document.getElementById('userName-top').innerHTML = xmlhttp.responseText;
}