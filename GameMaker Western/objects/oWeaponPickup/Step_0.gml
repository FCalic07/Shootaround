sprite_index = weapon.pickupSprite;

if place_meeting(x,y,oPlayer)
{
		array_push(global.PlayerWeapons, weapon);
		
		//auto swap
		oPlayer.selectedWeapon = array_length(global.PlayerWeapons) -1
		instance_destroy()
}

//float


floatDir += floatSpd;
y = ystart +lengthdir_y(2,floatDir);




//collection
if place_meeting(x,y,oPlayer)
{
	oPlayer.hp += heal;
	instance_destroy()
	
}


 //does player already posses this weapon
 var _size = array_length(global.PlayerWeapons);
 for (var i =0;  i < _size;i++ ){
	if weapon ==global.PlayerWeapons[i]
	{
		instance_destroy();
		exit;
	}
	
 }
 
 