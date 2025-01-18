// Pausing on player getting hit
if (instance_exists(oScreenPause)) || instance_exists(oDoYoYield) {
	image_speed =0;
	path_end();
	exit;
}else{
	image_speed =1;
}

// Initialize movement and attack logic variables
_wallCollisions = true;
_getDamage = true;

var left = (x - 12) div 10;
var right = (x + 12) div 10;
var top = y div 10; 
var bottom = (y + 60) div 10;

var prev_left = (xprevious - 12) div 10;
var prev_right = (xprevious + 12) div 10;
var prev_top = yprevious div 10;
var prev_bottom = (yprevious + 60) div 10;

    // Clear previous cells
    for (var i = prev_left; i <= prev_right; i++) {
        for (var j = prev_top; j <= prev_bottom; j++) {
            mp_grid_clear_cell(global.grid, i/10, j/10);
        }
    }

    // Mark new cells
    for (var i = left; i <= right; i++) {
        for (var j = top; j <= bottom; j++) {
            mp_grid_add_cell(global.grid, i/10, j/10);
        }
    }

// State machine
switch (state) {
    case -1:  // Spawn state
        if (image_alpha < 1) {
            spd = 0;
            image_alpha += fadeSpd;
        } else {
            spd = emergeSpd;
            dir = 270;
            if (!place_meeting(x, y, oWall)) {
                state = 0;  // Transition to chase state after spawn
            }
        }
        _wallCollisions = false;
        _getDamage = false;
        break;

    case 0:  // Chase player state
        if (instance_exists(oPlayer)) {
            dir = point_direction(x, y, oPlayer.x, oPlayer.y);
			if (mp_grid_path(global.grid, path, x, y, oPlayer.x, oPlayer.y, 1)) {
				path_start(path, chaseSpd, path_action_stop, false);
			}
            spd = chaseSpd;
            
            // If the player is within swing range, attack
            if (point_distance(x, y, oPlayer.x, oPlayer.y) < swingRange) {
                state = 1;  // Transition to attacking state
            }
        }
        
        // Set the walking sprite based on direction
        if (dir >= 0 && dir < 90 || dir >= 330) sprite_index = walkingSprite[0];
        else if (dir >= 90 && dir < 210) sprite_index = walkingSprite[1];
        else sprite_index = walkingSprite[2];
        break;

    case 1:  // Attacking state
        spd = 0;  // Stop moving during the attack
        sprite_index = sprite_attacking;  // Attack sprite
        
        // Apply damage if the player is within range
        if (instance_exists(oPlayer) && point_distance(x, y, oPlayer.x, oPlayer.y) < swingRange) {
            oPlayer.hp -= swingDamage;
        }

        // After attack, transition back to chasing state
        if (image_index >= sprite_get_number(sprite_attacking) - 1) {
            state = 0;  // Go back to chasing state
        }
        
        // While attacking, keep facing the player
        if (instance_exists(oPlayer)) {
            dir = point_direction(x, y, oPlayer.x, oPlayer.y);
        }
        break;
}

// Movement and collision checks (only when not in attacking state)
xspd = lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

// Check wall collisions and adjust movement
if (_wallCollisions) {
    if (place_meeting(x + xspd, y, oWall)) xspd = 0;
    if (place_meeting(x, y + yspd, oWall)) yspd = 0;
}

// Prevent movement if colliding with another enemy
if (place_meeting(x + xspd, y, oEnemyParent)) xspd = 0;
if (place_meeting(x, y + yspd, oEnemyParent)) yspd = 0;

// Apply movement only if not in attacking state
if (state != 1) {
    x += xspd;
    y += yspd;
}

// Depth based on Y position
depth = -y;

// Handle damage and death
if (_getDamage) {
    event_inherited();
}
