//fade in 
shootKey = global.shootKey;
alpha +=alphaSpd;
alpha = clamp(alpha, 0,1);

//restart
if shootKey && alpha >= 1
{
	
	room_restart();
	//game_restart(); // old school restart  
}