//pausing on player getting hit
if instance_exists(oScreenPause)
{
	image_speed =0;
	exit;
}else{
	image_speed =1;
}




//code commands
var _wallCollisions = true;
var _getDamage = true;

//state machine
switch (state)
{
	//spawn state
	case -1:
		
		if image_alpha < 1
		{
			spd = 0;
			image_alpha += fadeSpd;
		}
		
		_wallCollisions = false;
		_getDamage = false;
	
		if image_alpha >= 1
		{
			spd = emergeSpd;
			dir = 270;
		}
		
		if !place_meeting(x, y, oWall)
		{
			state = 0;
		}
	
	break;	
	
	case 0:
	//chase the player

		if instance_exists(oPlayer)
		{
			dir = point_direction(x,y,oPlayer.x,oPlayer.y);	
		}
		spd = chaseSpd;
		
		//transition to shooting state
		var _camLeft = camera_get_view_x(view_camera[0]);
		var _camRight = _camLeft + camera_get_view_width(view_camera[0]);
		var _camTop = camera_get_view_y(view_camera [0]);
		var _camBottom = _camTop + camera_get_view_height(view_camera[0]);
		
		
		// only add to timer if on screen 
		if  bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom
		{
			shootTimer ++;
		}
		if shootTimer > coolDownTime
		{
			//go to shoot state
			state =1;
			
			//reset timer
			shootTimer =0;
		}
	
	break;
	//pause and shoot
	case 1:
	#region
		if instance_exists(oPlayer)
		{
			dir = point_direction(x,y,oPlayer.x,oPlayer.y);	
		}
		spd = 0;
		//shoot a bullet 
		shootTimer ++;
		
		//create the bullet
		if shootTimer ==1
		{
			bulletInst = instance_create_depth(x,y,depth,oBulletEnemy);		
		}
		
		//shoot the bullet after the windup time is over
		if shootTimer ==windupTime && instance_exists(bulletInst){
			bulletInst.state =1;
		}
		
		//recover and return to chasing the player 
		
		if shootTimer > windupTime + recoverTime
		{
			//go back to chasing player 
			state =0;
			
			//reset the timer
			shootTimer = 0;
		}
		
		#endregion
	break; 
}


xspd = lengthdir_x(spd, dir)
yspd = lengthdir_y(spd, dir)

//correct face 
if (dir >= 0 && dir < 90) || (dir >= 330 && dir < 360) {
	face = 0;
}

if (dir >= 90 && dir < 210) {
	face = 1;
}

if (dir >= 210 && dir < 330) {
	face = 2;
}


if xspd == 0 && yspd == 0
{
    // miran
    sprite_index = sprite[face];
}
else
{
    // inače hoda
    sprite_index = walkingSprite[face];
}

//collisons
if _wallCollisions == true
	if place_meeting( x + xspd, y, oWall)
	{
		xspd =0;
	}

	if place_meeting(x, y + yspd, oWall)
	{ 
		yspd =0;
	}
	
if place_meeting(x + xspd, y, oEnemyParent)
	xspd = 0;
if place_meeting(x, y + yspd, oEnemyParent)
	yspd = 0;
	
x +=xspd;
y +=yspd;

depth = -y;

// Inherit the parent event (getting damaged and dying)
if _getDamage == true
	event_inherited();

