if(init = true)
	{
		if(!directory_exists(working_directory + "\Save\ "))
		{
			directory_create(working_directory + "\Save\ ");
		}
		
		if(!file_exists(working_directory + "\Save\savedat.txt"))
		{
			saveLocal = file_text_open_append(working_directory + "\Save\savedat.txt");
			file_text_close(saveLocal);
		}
		//saveLocal = working_directory + "\Save\savedat.txt";
		
		init = false;
	}
	
if(mouse_check_button_released(mb_left))
{
	if(tilemap_get_at_pixel(tilemap,mouse_x,mouse_y) = 0)
	{
		tilemap_set_at_pixel(tilemap,4,mouse_x,mouse_y);
	}
	else
	{
		tilemap_set_at_pixel(tilemap,0,mouse_x,mouse_y);
	}
}

if(saveTrigger = true && init = false)
{
	
	/*
	var yy = tilemap_get_height(tilemap);
	var xx = tilemap_get_width(tilemap);
	
	for(var i = 0; i < xx; i++)
	{
		for(var o = 0; o < yy; o++)
		{
			transGrid[# i,o] = tilemap_get(tilemap,i,o);
		}
	}
	
	var tileMapWrite = ds_grid_write(transGrid);
	saveLocal = file_text_open_append(working_directory + "\Save\savedat.txt");
	file_text_write_string(saveLocal, tileMapWrite);
	file_text_close(saveLocal);
	*/
}

if(saveTrigger = true && init = false)
{
	
	var jsonEncode = json_encode(transMap);
	
	scr_save_string_to_file("save.json",jsonEncode);
	
}

if(loadTrigger = true && init = false)
{
	/*
	var tileMapRead = "";
	
	saveLocal = file_text_open_read(working_directory + "\Save\savedat.txt");
	tileMapRead = file_text_read_string(saveLocal);
	ds_grid_read(transGrid,tileMapRead);
	file_text_close(saveLocal);
	
	var yy = tilemap_get_height(tilemap);
	var xx = tilemap_get_width(tilemap);
	
	for(var i = 0; i < xx; i++)
	{
		for(var o = 0; o < yy; o++)
		{
			tilemap_set(tilemap,transGrid[# i,o],i,o);
		}
	}
	*/
	
	var tempStore = scr_load_jSON_from_file("save.json");
	displayTrigger = tempStore[? "arse"]; 
	
}

if(eraseTrigger = true && init = false)
{
	//file_text_close(saveLocal);
	saveLocal = file_text_open_write(working_directory + "\Save\savedat.txt");
	file_text_write_string(saveLocal, "");
	file_text_close(saveLocal);
	//eraseTrigger = false; // don't forget these!
}

//impliment json filetype 
//impliment to save when at the depot, load when game is active and save slot is selected 