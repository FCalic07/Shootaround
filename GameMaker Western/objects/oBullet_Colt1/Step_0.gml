//pausing on player getting hit
if instance_exists(oScreenPause)
{
	image_speed =0;
	exit;
}else{
	image_speed =1;
}



//move
xspd = lengthdir_x(spd,dir)
yspd = lengthdir_y(spd,dir)

x += xspd;
y += yspd;

//~~~~~~~~~hit confirm cleanup ~~~~~~~~~~~

if hitConfirm == true && enemyDestroy == true {destroy =true; };

//destroy
if destroy == true  {instance_destroy(); }

//collision
if place_meeting(x,y, oSolidWall)  {destroy = true;}

 //deleting bullets out of screen
 if point_distance(xstart, ystart, x,y) > maxDist {destroy = true; }

