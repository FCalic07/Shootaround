if createdDamageObjects == false
{
	//damage enemy
	enemyDamageInst = instance_create_depth(x,y,0,oDamageEnemy);
	with(enemyDamageInst)
	{
		damage = other.damage;
		mask_index = other.sprite_index;
		image_xscale =other.image_xscale
		image_yscale =other.image_yscale
	}
	
	//damage player
	playerDamageInst = instance_create_depth(x,y,0,oDamagePlayer);
	with(playerDamageInst)
	{
		damage = other.damage;
		mask_index = other.sprite_index;
		image_xscale =other.image_xscale
		image_yscale =other.image_yscale
	}
	
	createdDamageObjects = true;
}

//what frame of explosion animation damages object
if floor(image_index) >2
{
	if instance_exists(enemyDamageInst)
	{
		instance_destroy(enemyDamageInst)
	}
	
	if instance_exists(playerDamageInst)
	{
		instance_destroy(playerDamageInst)
	}
} 


//pausing 
if instance_exists(oScreenPause)
{
	image_speed =0;
	exit;
}else{
	image_speed =1;
}

//screen shake
screen_shake(8)