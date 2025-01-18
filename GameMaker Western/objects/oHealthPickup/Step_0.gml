//float

floatDir += floatSpd;
y = ystart +lengthdir_y(2,floatDir);




//collection
if place_meeting(x,y,oPlayer)
{
	oPlayer.hp += heal;
	instance_destroy()
	
}