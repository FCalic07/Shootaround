if global.enemyKillCount == 99 && finalBossSpawned == 0
{
	//create an enemy
	var _inst = instance_create_depth(x, y+30 ,depth-1, oAngryFatman);
	finalBossSpawned = 1;
}