global.rightKey = keyboard_check(ord("D"));
global.leftKey = keyboard_check( ord("A"));
global.upKey = keyboard_check( ord ("W"));
global.downKey = keyboard_check( ord ("S"));
global.shootKey = mouse_check_button(mb_left);
//weapo swap on mouse scroll
global.scrollUp = mouse_wheel_up();
global.scrollDown = mouse_wheel_down();
global.startKeyPressed = keyboard_check_pressed(ord ("P"))//pause menu 
global.escKey = keyboard_check_pressed(vk_escape)
global.quit = keyboard_check_pressed(ord ("N"))
global.resume = keyboard_check_pressed(ord ("Y"))
global.rKey = keyboard_check_pressed(ord ("R"))