var startObj = function(){
	this.x = [];
	this.y = [];
	this.alive = [];
	this.size = [];
	this.speed = [];
}
startObj.prototype.num = 500;
startObj.prototype.init = function () {
	for(var i = 0 ; i < this.num ; i ++)
	{
		this.x[i] = 0;
		this.y[i] = 0;
		this.alive[i] = true;
		this.size[i] = 0;
		this.speed[i] = 0;
		start.born(i);
	}

}
var temp = 1;
startObj.prototype.born = function(i){


		if(temp > 100)  // i 控制数组下标 而 temp 每次都 1 ~ 100 的分布散开
		{

			temp = 1;
		}
		this.x[i] = temp * 20 + Math.random() * 20; temp ++;
		this.y[i] = 1080 + Math.random()*450;
		this.size[i] = Math.random()*3;
		this.alive[i] = true;
		this.speed[i] = Math.random() * 0.017 + 0.0009;

}
startObj.prototype.draw = function(){
	for(var i = 0 ; i < this.num ; i++)
	{
		if (this.alive[i] == true)
		{
			ctx.beginPath();
			ctx.fillStyle = "#FFFFFF";
			ctx.fillRect(this.x[i],this.y[i] = this.y[i] - this.speed[i]*800,this.size[i],this.size[i]);
			ctx.closePath();
		}

		if(this.y[i] < 10 || this.x[i] < 0 )
		{
			this.alive[i] = false;
			start.born(i);
		}
	}


	
}