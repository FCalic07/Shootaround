var up_key = keyboard_check_pressed(vk_up);
var down_key = keyboard_check_pressed(vk_down);
var accept_key = keyboard_check_pressed(vk_enter);

option_length = array_length(option[menu_level]);

position += down_key - up_key;

if position >= option_length
{
	position = 0;
}

if position < 0
{
	position = option_length - 1;
}

if accept_key {
	var _sml = menu_level;
	switch(menu_level)
	{
		case 0:
			switch(position)
			{
				case 0:
					room_goto_next();
					surface_resize(application_surface, 1920, 1080);
					window_set_fullscreen(true);
				break;
	
				case 1:
					audio_play_sound(WinchesterFire, 1, false); // Play gunshot
                    name_sequence_active = true;   
					option_offset_Y = 100;
                    alarm[0] = room_speed * 0.2;  
                    menu_level = 1; 
				break;
	
				case 2:
					game_end();
				break;
			}
		break;
		
        case 1:
            switch (position) {
                case 0: // Back
                    menu_level = 0;         // Return to the main menu
                    name_sequence_active = false; // Clear the names
					option_offset_Y = 200;
                    break;
            }
            break;
	}
	
	if _sml != menu_level {position = 0};
	option_length = array_length(option[menu_level]);
}

