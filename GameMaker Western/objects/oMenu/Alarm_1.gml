if name_sequence_active { 
	audio_play_sound(WinchesterFire, 1, false); 
	alarm[2] = room_speed * 0.2;
}
else {
	alarm[0] = -1;
	alarm[1] = -1;
	alarm[2] = -1;
	alarm[3] = -1;
	alarm[4] = -1;
	alarm[5] = -1;
	alarm[6] = -1;
	alarm[7] = -1;
}
   // Set the timer for the next name
