//state machine0

image_angle = dir;

switch (state)
{
	//wait for enemy
	case 0:
		//aim for the player
		if instance_exists(oPlayer)
		{
			dir = point_direction(x,y,oPlayer.x,oPlayer.y);
		}
		
		depth = -y -50;
	break;
	
	//shoot
	case 1:
		//movement
		xspd = lengthdir_x(spd, dir);
		yspd = lengthdir_y(spd, dir);
		x += xspd;
		y += yspd;
		
		depth = -y;
	break;
	
}

// Cleanup: Destroy the bullet if it's outside the room bounds
if bbox_right < 0 || bbox_left > room_width || bbox_bottom < 0 || bbox_top > room_height {
    destroy = true; 
}


//player collision
if hitConfirm == true && playerDestroy == true {destroy = true};

if destroy == true {instance_destroy(); };

//wall collision
if place_meeting(x,y, oWall) {destroy =true }