//get cam coordinates
var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

var _border = 4;
var _hudX = _camX + _border;
var _hudY = _camY + _border;

//draw the player's hp
//var _hpString ="HP:" + string(playerHp) + "/" + string(playerMaxHp);
//draw_text (_camX,_camY,_hpString);

if instance_exists(oPlayer){
		draw_sprite(sHealthBar, 0, _hudX, _hudY);

	for(var i = 0; i < playerMaxHp; i++){
		//show current hp
		var _img =1;
		if i+1 <= playerHp {_img =2}
	
		var _sep =8;
		draw_sprite(sHealthBar,_img, _hudX + _sep*i,_hudY);
	}
}

var _enemyCountOffset = 55;
var _ecHudX = _hudX + 2;
var _ecHudY = _hudY +_enemyCountOffset;
draw_sprite(sKillCount, 0, _ecHudX, _ecHudY);
draw_sprite(sAmmoCount, 0, _ecHudX, _ecHudY + 30);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(FontKills);
draw_set_color($FFFFFF);

draw_text(_ecHudX + 22, _ecHudY + 2, string(global.enemyKillCount));
draw_text(_ecHudX + 36, _ecHudY + 2, "/" + string(global.enemyRoomMax));
draw_text(_ecHudX + 22, _ecHudY + 32, string(global.weapon.currentMagazineAmmo));
draw_text(_ecHudX + 36, _ecHudY + 32, "/" + string(global.weapon.totalAmmo));