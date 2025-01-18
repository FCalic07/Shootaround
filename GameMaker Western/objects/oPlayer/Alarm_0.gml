if(_ammo > 0) {
	weapon.currentMagazineAmmo++;
	weapon.totalAmmo--;
	_ammo--;
	audio_play_sound(weapon.soundOfReload, 1, false);
	alarm[0] = room_speed * 0.2;
}
else {
	if(weapon.sprite == sSmith_Wesson_Model_3 || weapon.sprite == sColt_Single_Action_Army){
		audio_play_sound(spinningChamber, 1, false);
	}
    alarm[1] = room_speed * 0.9 //da ne puca odmah
}