//ovo je A* pathfinder
global.grid	 = mp_grid_create(0,0, room_width/10, room_height/10, 10, 10);
mp_grid_add_instances(global.grid, oSolidWall, true);