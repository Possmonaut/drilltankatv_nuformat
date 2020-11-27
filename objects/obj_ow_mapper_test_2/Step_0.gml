//if room change
x=target.x;
y=target.y;

timer ++;

if(obj_ow_player_tank.controlBool = 0)
{
activateMap = keyboard_check(ord("M"));
releaseMap = keyboard_check_released(ord("M"));
}
else
{
	if(gamepad_button_check(0,gp_face2)){
			activateMap = true;}
			else{
			activateMap = false;}
	if(gamepad_button_check_released(0,gp_face2)){
			releaseMap = true;}
			else{
			releaseMap = false;}
}

if(!activateMap)
{
	mapWrite = false;
}

tileMapXX = tilemap_get_width(global.Tiles_1) * 3;
tilemapYY = tilemap_get_height(global.Tiles_1) * 3;
