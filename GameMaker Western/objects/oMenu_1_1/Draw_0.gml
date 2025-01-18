draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

draw_set_font(FontMenu);
draw_set_valign(fa_top);
draw_set_halign(fa_center);

for (var i = 0; i < option_length; i++)
{
	var _c = $4C3B44;

	if name_sequence_active {
		if position == 0 {_c = c_white};
		draw_text_color(x + option_offset_X, 420, option[menu_level, i], _c, _c, _c, _c, 1);
	}
	else {
	if position == i {_c = c_white};
	draw_text_color(x + option_offset_X, y + option_offset_Y + option_space * i, option[menu_level, i], _c, _c, _c, _c, 1);
	}
}

// Draw the current name in the sequence
if name_sequence_active {
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
	var _c = $4C3B44;
	if name_filip {
    draw_text_color(x + option_offset_X, y + option_offset_Y + option_space * 1, "Filip Calic", _c, _c, _c, _c, 1);
	}
	if name_david {		
	draw_text_color(x + option_offset_X, y + option_offset_Y + option_space * 2, "David Jezidzic", _c, _c, _c, _c, 1);
	}
	if name_ivan {		
	draw_text_color(x + option_offset_X, y + option_offset_Y + option_space * 3, "Ivan Lovric", _c, _c, _c, _c, 1);
	}
	if name_gamemaker {
	draw_text_color(x + option_offset_X, y + option_offset_Y + option_space * 2, "Powered by", _c, _c, _c, _c, 1);
	draw_text_color(x + option_offset_X, y + option_offset_Y + option_space * 3, "GameMaker Studio 2", _c, _c, _c, _c, 1);
	}
}

if !name_sequence_active {
	name_sequence_active = false;
	name_filip = false;
	name_david = false;
	name_ivan = false;
	name_gamemaker = false;
}
