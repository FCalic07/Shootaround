depth = -y;


 floatDir =0;
 floatSpd =6;
 
 if image_index == 0
 {
	  weapon = global.WeaponList.Winchester;
 }
 if image_index == 1
 {
	  weapon = global.WeaponList.Shotgun;
 }
  if image_index == 2
 {
	  weapon = global.WeaponList.SawedShotgun;
 }
 
 sprite_index =weapon.pickupSprite;
 image_index =0;
 
 //does player already posses this weapon
 var _size = array_length(global.PlayerWeapons);
 for (var i =0;  i < _size;i++ ){
	if weapon ==global.PlayerWeapons[i]
	{
		instance_destroy()
	}
	
 }
 
 
 
 
 