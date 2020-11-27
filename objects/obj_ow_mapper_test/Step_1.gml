//m = load dat fookin' map :V 
activateMap = keyboard_check(ord("M"));
releaseMap = keyboard_check_released(ord("M"));

//var xx = ds_grid_width(global.mapGrid);
//var yy = ds_grid_height(global.mapGrid);


//for(var i = 0; i < xx; i ++)
//{
	//for(var o = 0; o < yy; o ++)
	//{
	//	gridMap[i, o] = global.mapGrid[# i, o];
	//}
//}

if(activateMap = true)
{
	//note, later on you can probably only edit the surface when the m key is activated
	if(surface_exists(global.map_surface) = true)
	{
	surface_set_target(global.map_surface);
	draw_clear_alpha(c_black,0); //this clears the screen, presumably it can reset it to a color
	var xx = tilemap_get_width(global.Tiles_1)*4;
	var yy = tilemap_get_height(global.Tiles_1)*4;
	for( var i = 0; i < xx; i ++)
	{
		for(var o = 0; o < yy; o ++)
		{
			if(global.mapGrid[# i, o] = 1)
			{
				draw_point_color(i,o, c_white);
			}
			else
			{
				draw_point_color(i,o,c_black);
			}
		}
	}
	
	}
	mapActive = true;
}
else
{
mapActive = false;	
}

