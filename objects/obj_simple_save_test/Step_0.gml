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
	//if deirectory not yet set, set directory 
	//if directory not ecists, make directory https://docs.yoyogames.com/source/dadiospice/002_reference/file%20handling/directory_exists.html
	//if file not exist
	//make file
	//if temptext != "";, store 
	//clear temptext
	//add "saving..." text trigger
	//set saveTrigger to false;
	
	//ds_grid_write will turn a grid into a string 
	//save tilemap as a string 
	//store in JSON 
	
	//new test: store tilsets and their changes 
	//if(tempText != "")
	//{
		
		//var tileMapWrite = string(tilemap);
		//file_text_write_string(saveLocal, tempText);
		//file_text_close(saveLocal);
		//saveLocal = file_text_open_append(working_directory + "\Save\savedat.txt");
		//file_text_write_string(saveLocal, tileMapWrite);
		//file_text_close(saveLocal);
	//}
	
	//create temp ds_grid size of tileset_width tileset_height
	//read each tile in positions of tilemap and store in ds_grid(2 for loops)
	//another temp var, store the ds_grid in this var as a string
	//save
	//destroy temp ds_grid
	//clear temp var for string 
	
	
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
}

if(loadTrigger = true && init = false)
{
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