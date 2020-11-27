x = target.x +14;
y = target.y +14;

//keypress = keyboard_check(ord("R"));

if(obj_ow_player_tank.controlBool = 0)
{
	var keyCheck = keyboard_check_released(ord("R"));

	if(keyCheck)
	{
		if(keypress)
		{
			keypress = false;
		}
		else
		{
			keypress = true;
		}
	}
}
else
{
	if(gamepad_button_check_released(0,gp_shoulderl)){
			keypress = !keypress;}
}

if(keypress && radarComplete) //if these button pressed and now runnign radar sweep
{
	radarComplete = false;
}

squareX = round(target.x / 32) * 32;
squareY = round(target.y / 32) * 32;

if(radarComplete = false)
{
	if(scanCheck = false)
	{
	for(var xx = 0; xx < endCellGen; xx ++)
	{
		for(var yy = 0; yy < endCellGen; yy ++)
		{
		
			var posX = squareX - (32 * (startCellGen - xx));//change these values to lengthen the box. later on, add a var to change these more easily
			var posY = squareY - (32 * (startCellGen - yy));
			var temp1 = tilemap_get_at_pixel(global.Tiles_1,posX, posY);
			var temp2 = tile_get_index(temp1);

			if(temp2 > 0 && temp2 < obj_ow_auto_tile_dark.arrayMax && temp2 != 7 && temp2 != 5)
			{	
				var x1 = tilemap_get_cell_x_at_pixel(global.Tiles_1, posX, posY);
				var y1 = tilemap_get_cell_y_at_pixel(global.Tiles_1, posX, posY);
				for(var l = 0; l < 3; l++)
				{
					for(var k = 0; k < 3; k ++)
					{   //below code adds a block to the map
						var x2 = (x1*3) + l; //was originally xx * 4 + l, same for below
						var y2 = (y1*3) + k;
						global.mapGrid[# x2, y2] = 1;
						obj_ow_mapper_test_2.update = true;
					}
				}
			}
		}
	}
	scanCheck = true;
	}


	collision_line_list(x, y, x + lengthdir_x(512, rotateDir), y + lengthdir_y(512, rotateDir), obj_ow_ping_block, false, true, radarList, true);
	//collision_line_list(x, y, x + lengthdir_x(512, rotateDir-45), y + lengthdir_y(512, rotateDir-45), obj_ow_ping_block, false, true, radarList, true);
	//collision_line_list(x, y, x + lengthdir_x(512, rotateDir), y + lengthdir_y(512, rotateDir), obj_ow_ping_enemy, false, true, radarList, true);
	collision_line_list(x, y, x + lengthdir_x(512, rotateDir), y + lengthdir_y(512, rotateDir), obj_ow_enemy_passable, false, true, radarList, true);
	collision_line_list(x, y, x + lengthdir_x(512, rotateDir), y + lengthdir_y(512, rotateDir), obj_ow_bbox, false, true, radarList, true);

	var listLeng = ds_list_size(radarList);
	
	for(var i = 0; i < listLeng; i ++)
	{
		radarList[|i].activated = true;
		radarList[|i].forceActivate = true;
	}
	
	ds_list_clear(radarList);
	

	rotateDir += scanSpd;
	if(rotateDir >= 360)
		{
		scanCheck = false;
		radarComplete = true;
		rotateDir = 0;
		var b = audio_play_sound(so_radar_sweep,1,false);
		audio_sound_gain(b,0.05,0);
		eRad = 0;
		circleAlpha = 1;
		}
}
