// Pausing when player is hit
if instance_exists(oScreenPause) || instance_exists(oDoYoYield) {
    image_speed = 0;
    exit;
} else {
    image_speed = 1;
}

// State machine
switch (state) {
    case 0: // Shooting State
		sprite_index = sprite[1];


		if instance_exists(oPlayer)
		{
			dir = point_direction(x,y,oPlayer.x,oPlayer.y);	
		}



        // Shoot bullets at intervals
        if (shoot_timer <= 0) {
            // Create a bullet
            bulletInst = instance_create_depth(x, y, depth, oBulletEnemy);
            if (instance_exists(bulletInst)) {
                bulletInst.state = 1; // Bullet starts moving immediately
                bulletInst.dir = dir; // Shoot toward the player
				
				soundTimer = room_speed * 0.2; // 0.5-second delay
				soundStage = 1;
            }

            // Reset the shoot timer
            shoot_timer = shoot_interval;
        } else {
            shoot_timer--;
        }

        // Track the duration of shooting
        state_timer++;
        if (state_timer >= shoot_duration) {
            // Transition to cooldown state
            state = 1;
            state_timer = 0;
        }
        break;

    case 1: // Cooldown State
		sprite_index = sprite[0];
        spd = 0; // Stay stationary

        // Increment cooldown timer
        state_timer++;
        if (state_timer >= cooldown_time) {
            // Transition back to shooting state
            state = 0;
            state_timer = 0;
        }
        break;
}

if(soundTimer > 0) {
	soundTimer--;
}
else if(soundStage == 1) {
	audio_play_sound(gunShotSmithAndWesson_fire, 10, false);
	soundStage = 0;
}

// Update position (no movement, but keeping this for consistency)
xspd = lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

// Collision handling
if place_meeting(x + xspd, y, oWall) xspd = 0;
if place_meeting(x, y + yspd, oWall) yspd = 0;
if place_meeting(x + xspd, y, oEnemyParent) xspd = 0;
if place_meeting(x, y + yspd, oEnemyParent) yspd = 0;

x += xspd;
y += yspd;

// Depth for drawing order
depth = -y;

// Inherit the parent event (getting damaged and dying)
event_inherited();
