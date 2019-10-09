var can;
var ctx;

var lastTime;
var deltaTime;

var bgPic = new Image();

var start;
document.body.onload = gameStar;
function gameStar(){
	gameInit();
	gameLoop();
}
function  gameInit(){
	 can = document.getElementById('canvas1');
	 ctx = can.getContext('2d');

	bgPic.src ="images/2.jpg";

	lastTime = Date.now();
	deltaTime = 0;

	start = new startObj();
	start.init();

}
function  gameLoop(){
	window.requestAnimFrame(gameLoop);
	var now = Date.now();
	deltaTime = now - lastTime;
	if(deltaTime > 40)
	{
		deltaTime = 40;
	}

	ctx.drawImage(bgPic,0,0,1920,1080);
	start.draw();
}
