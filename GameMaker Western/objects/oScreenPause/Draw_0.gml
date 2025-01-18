if !instance_exists(oPlayer){instance_destroy();};
var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);



//draw a black rectangle over the screen
draw_set_alpha(alpha*alphaMax);
draw_rectangle_color(_camX,_camY,_camX + _camW, _camY + _camH, c_black, c_black, c_black, c_black,false);

//draw the text 
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alpha);
draw_set_font(FontMenu)
//"game over"
var _gameoverOffset = -32;
draw_text_transformed(_camX + _camW/2, _camY + _camH/ + 2 + _gameoverOffset, "PAUSED",3,3,0)

//"press shoot to restart"

var _restartOffset = 50;
draw_text_transformed (_camX + _camW/2, _camY + _camH/2 + _restartOffset, "-Press P to Resume-", 1,1,0)

//reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);