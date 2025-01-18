// Check if the player exists
if (!instance_exists(oPlayer)) {
    instance_destroy();
}

// Get camera dimensions
var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

// Draw a black rectangle over the screen
draw_set_alpha(alpha * alphaMax);
draw_rectangle_color(
    _camX, _camY, _camX + _camW, _camY + _camH, 
    c_black, c_black, c_black, c_black, false
);

// Draw the text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alpha);
draw_set_font(FontMenu);

// "Game Over"
var _gameoverOffset = -32;
draw_text_transformed(
    _camX + _camW / 2, _camY + _camH / 2 + _gameoverOffset, 
    "Do you really want to exit the game?", 
    0.5, 0.5, 0
);

// "Press shoot to restart"
var _restartOffset = 50;
draw_text_transformed(
    _camX + _camW / 2, _camY + _camH / 2 + _restartOffset, 
    "Y to confirm N to resume", 
   0.5, 0.5, 0
);

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);

// Input Logic for Quit and Resume
if (keyboard_check_pressed(ord("Y"))) {
	mp_grid_destroy(global.grid);
    game_end(); // Quit the game
}

if (keyboard_check_pressed(ord("N"))) {
    instance_destroy(); // Resume the game by removing the game-over object
}
