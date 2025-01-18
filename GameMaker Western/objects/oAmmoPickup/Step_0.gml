//float

floatDir += floatSpd;
y = ystart +lengthdir_y(2,floatDir);




//collection
if place_meeting(x,y,oPlayer)
{
	global.weapon.totalAmmo += ammoAmount;
	instance_destroy()
	
}