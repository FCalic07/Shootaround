
//receive damage 
get_damaged(oDamageEnemy)
// Handle death
if (hp <= 0) {
	global.enemyKillCount++;
	
	//drop health on random
	var _chance = irandom (100)
		 
	if _chance < 20
	{
		instance_create_depth(x,y,depth,oHealthPickup);
	}
    instance_destroy();
}


