get_damaged(oDamageParent);

//show damage
var _healthPercent =1 - (hp/maxHp);
image_index = _healthPercent * image_number

if hp <=0 
{
	//EXPLOSION
	audio_play_sound(TNTexplosion,1000,false);
	instance_create_depth(x, y, -3000, oExplosion);
	instance_destroy();
}


