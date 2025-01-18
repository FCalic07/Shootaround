// Hide default cursor
window_set_cursor(cr_none); 

// Get mouse position
var mx = device_mouse_x(0);
var my = device_mouse_y(0);
cursor_sprite = sCrosshairs;

// Draw the custom cursor with scaling
var cursor_scale = 5; // Adjust this value for size
draw_sprite_ext(cursor_sprite, 0, mx, my, cursor_scale, cursor_scale, 0, c_white, 1);
