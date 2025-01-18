
		draw_self();

		draw_turret();

		//draw hp
		var _healtPercent = hp / maxHp;
		var _hpImage = _healtPercent * (sprite_get_number (sEnemyHealth) -1)
		draw_sprite_ext(sEnemyHealth, _hpImage, x,y - sprite_height/2 - 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

		//draw hp as a string
		//draw_text(x,y,string (hp));

