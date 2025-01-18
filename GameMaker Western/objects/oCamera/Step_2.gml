//get the camera's width and height
var _camW =camera_get_view_width(view_camera[0]);
var _camH =camera_get_view_height(view_camera[0]);



//center on the player
if instance_exists(oPlayer)
{
	x = oPlayer.x -_camW/2;
	y = oPlayer.y - _camH /2;
}

//camera shaking

//xShake

if xShakeAmount > 0
{
	xShakeDir +=xShakeDirSpd;
	xShakeAmount -=xShakeAmounSpd;
}else{
	xShakeAmount=0;
	xShakeDir=0;
}
xShake = dsin(xShakeDir) * xShakeAmount;

//add in the camera shake



//y shake

if yShakeAmount > 0
{
	yShakeDir +=yShakeDirSpd;
	yShakeAmount -=yShakeAmounSpd;
}else{
	yShakeAmount=0;
	yShakeDir=0;
}
yShake = dsin(yShakeDir) * yShakeAmount;

//add in the camera shake
y +=yShake;
x +=xShake;



//clamp camera to room borders
x = clamp(x, 0, room_width-_camW);
y = clamp(y,0,room_height- _camH);
//camera position
camera_set_view_pos(view_camera[0],x,y);