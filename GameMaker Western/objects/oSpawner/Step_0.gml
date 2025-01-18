//spawn an enemy
timer++;

if instance_number(oEnemyParent) >= global.activeEnemyMax || global.totalEnemySpawned >= global.enemyRoomMax - 1
{
	timer = 0;
}

if timer >= spawnTime && !place_meeting(x, y, oEnemy)
{
	//create an enemy
	var _inst = instance_create_depth(x, y + 30 ,depth-1, oEnemy);
	with(_inst)
	{
		image_alpha = 0;
		state = -1;
	}
	//reset the timer
	timer = 0;
	
}