//get input
rightKey = global.rightKey;
leftKey = global.leftKey;
upKey = global.upKey;
downKey = global.downKey;
shootKey = global.shootKey;
//weapo swap on mouse scroll
scrollUp = global.scrollUp;
scrollDown = global.scrollDown;
startKeyPressed =global.startKeyPressed;
escKey = global.escKey;
nKey = global.quit;
yKey = global.resume;
rKey = global.rKey;

/**/
if startKeyPressed
{
		if !instance_exists(oScreenPause)
		{
			instance_create_depth(0,0,0, oScreenPause);
		}else{
			instance_destroy(oScreenPause)}

}


//////pause menu
if escKey
{
	if !instance_exists(oDoYoYield)
	{
		instance_create_depth(0,0,0, oDoYoYield);
	}else{
		instance_destroy(oDoYoYield)
	}

}	


//ESC menu
//pause menu
//if escKey
//{
//	room_goto(1);
//}
if(rKey && !isReloading && weapon.totalAmmo > 0) {
	isReloading = true;
    reloadTimer = weapon.reloadTime;
	//audio_play_sound(weapon.soundOfReload, 10, false);
}

//pausing 
if instance_exists(oScreenPause) || instance_exists(oDoYoYield)
{
	image_speed =0;
	exit;
}else{
	image_speed =1;
}


//player movement
#region
var _horizKey = rightKey - leftKey;
var _vertKey = downKey - upKey; 
moveDir = point_direction(0,0 , _horizKey,_vertKey);

//x and y speeds

var _spd =0;
var _inputLevel = point_distance(0,0,_horizKey,_vertKey);
_inputLevel = clamp(_inputLevel,0,1)
_spd = moveSpd * _inputLevel;

xspd= lengthdir_x(_spd,moveDir)
yspd= lengthdir_y(_spd,moveDir)

//collisions
if place_meeting(x +xspd, y, oWall)
{
	xspd =0;
}

if place_meeting(x,y+yspd, oWall)
{
	yspd =0;
}

//move the player
x += xspd;
y +=yspd;

//depth
depth = -bbox_bottom;
#endregion


//screen shake on damagep
if (get_damaged(oDamagePlayer)) {
    show_debug_message("Player damaged!"); // Debug message to ensure this block runs
	//audio_play_sound(hitSound, 1, 0);
    screen_shake(3);
}

//player aiming
centerY = y +centerYoffset;
//aim
aimDir =point_direction(x,centerY,mouse_x,mouse_y)



// sprite control
#region
//set the player sprite

if (aimDir >= 0 && aimDir < 90) || (aimDir >= 330 && aimDir < 360) {
	face = 0;
}

if (aimDir >= 90 && aimDir < 210) {
	face = 1;
}

if (aimDir >= 210 && aimDir < 330) {
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



#endregion



// Weapon swapping
var _playerWeapons = global.PlayerWeapons;

// Cycle weapons based on scroll direction
if (scrollUp) {
    // Scroll up - previous weapon
    selectedWeapon--;
    if (selectedWeapon < 0) {
        selectedWeapon = array_length(_playerWeapons) - 1; 
    }
    
}
weapon = _playerWeapons[selectedWeapon];
global.weapon = weapon;

if (scrollDown) {
    // Scroll down - next weapon
    selectedWeapon++;
    if (selectedWeapon >= array_length(_playerWeapons)) {
        selectedWeapon = 0; 
    }
   
}
 weapon = _playerWeapons[selectedWeapon];
 
//shoot the weapon
if shootTimer > 0 {shootTimer --};


if (!isReloading && shootKey && shootTimer <=0 && weapon.currentMagazineAmmo ==0)
{
	audio_play_sound(emptyMag, 10, false);
	shootTimer =15;
}

if !isReloading && shootKey && shootTimer <=0 && weapon.currentMagazineAmmo > 0
{ 
	show_debug_message(isReloading)
	//reset the timer 
	shootTimer = weapon.cooldown;
	
	weapon.currentMagazineAmmo--;
	//create the bullet with correct offset from end of gun 
	var _xOffset = lengthdir_x(weapon.length + weaponOffSetDist, aimDir);
	var _yOffset = lengthdir_y(weapon.length + weaponOffSetDist, aimDir);
	var _spread = weapon.spread;
	var _spreadDivison = _spread / max (weapon.bulletNum -1,1); 
	
	//create the correct num of bullets
	for ( var i =0; i< weapon.bulletNum; i++) {
		var _bulletInst = instance_create_depth(x+ _xOffset,centerY + _yOffset,depth-100,weapon.bulletObj);
		//change the bullet direction
		with (_bulletInst)
		{
		dir = other.aimDir - _spread/2 + _spreadDivison *i;
		}
	}
	
	
// Start sound sequence
    soundStage = 1; // Set the stage to play the first sound
    soundTimer = room_speed * 0.1; // 0.5-second delay
	//audio_play_sound(gunshotCock, 10, false); // Play the cocking sound

}

//reload logic

if (isReloading) {
    if (reloadTimer) {
		_ammo = weapon.magazineAmmo - weapon.currentMagazineAmmo;
		
		if(_ammo > weapon.totalAmmo) {
			reloadTimer = 0;
			alarm[2] = 1;
		}
		else {
			reloadTimer = 0;
			alarm[0] = 1;
		}
		
    }
}




// shooting sound handle
#region

// Sound effects 
if (soundTimer > 0) {
    soundTimer--;
} else if (selectedWeapon == 0) { //SOUND EFFECT FOR COLT
    if (soundStage == 1) {
        // Play the gunshot sound
        audio_play_sound(gunshotCOLT_fire, 10, false);
        soundStage = 2;
        soundTimer = room_speed * 0.5; // 0.5-second delay
    } else if (soundStage == 2) {
        // Play the casing sound
        audio_play_sound(gunshotSoundCasing, 10, false);
        soundStage = 0; // Reset the stage
    }
} else if (selectedWeapon == 1) { // SOUND EFFECT FOR SMITH AND WESSON
    if (soundStage == 1) {
        // Play the gunshot sound
        audio_play_sound(gunShotSmithAndWesson_fire, 10, false);
        soundStage = 2;
        soundTimer = room_speed * 0.5; // 0.5-second delay
    } else if (soundStage == 2) {
        // Play the casing sound
        audio_play_sound(gunshotSoundCasing, 10, false);
        soundStage = 0; // Reset the stage
    }
} else if (selectedWeapon == 2) { // SOUND EFFECT FOR SHOTGUN 
    if (soundStage == 1) {
        // Play the gunshot sound
        audio_play_sound(gunshotShotgun_fire, 10, false);
        soundStage = 2;
        soundTimer = room_speed * 0.5; // 0.5-second delay
    } else if (soundStage == 2) {
        // Play the casing sound
        audio_play_sound(gunshotSoundCasing, 10, false);
        soundStage = 0; // Reset the stage
    }
}  else if (selectedWeapon == 3) { // SOUND EFFECT FOR SHOTGUN 
    if (soundStage == 1) {
        // Play the gunshot sound
        audio_play_sound(WinchesterFire, 10, false);
        soundStage = 2;
        soundTimer = room_speed * 0.5; // 0.5-second delay
    } else if (soundStage == 2) {
        // Play the casing sound
        audio_play_sound(gunshotSoundCasing, 10, false);
        soundStage = 0; // Reset the stage
    }
}

#endregion


//death 
if hp <= 0
{
	//create game over object
	instance_create_depth(0,0,-10000,oGameOverScreen);
	//destroy player
	instance_destroy();
}




