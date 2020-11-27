//we'll use this generic object to handle enemy grid functions. This will be pretty handy in the
//event we create enemies who are bigger than 32 pixels
image_alpha = 0;

global.mp_grid32 = mp_grid_create(0, 0,room_width/32, room_height/32,32,32);

timer = 0;
clearTime = 0;

target = obj_ow_player_tank;