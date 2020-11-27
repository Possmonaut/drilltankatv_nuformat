/*

if(room != cRoom) //this tells us if we swapped rooms, so that we can run updates and such
{	
	
	if(cRoom = rm_setup || room = rm_new_demo || room = rm_final_boss_1 || cRoom = rm_new_demo)
	{ //this keeps the game from saving too much data about the main room during transfers
		if(cRoom = rm_new_demo)
		{
			cRoom = room;
		}
	}
	else
	{
	rSwap = true;
	cRoom = room;
	triggerList[|2] = room;
	loadTrigger = true;
	roomLoad = true;
	}
	
	if(instance_exists(obj_ow_player_tank))
	{
		target = obj_ow_player_tank;
	}
}
*/


if(room = rm_final_boss_1 || roomGoto = rm_final_boss_1)
{
roomLoad = false;
}


if(object_exists(obj_title_seismograph)) //this checks if we're on the title screen or not
{
	displayObj = obj_title_seismograph;
	displayActive = true;
}
else
{
	displayObj = 0;
	//displayActive = false;
}

if(init = true) //generates a save file if one is not detected 
	{ //later on change this to create a save file if the player starts a new game
		if(!file_exists("save.json"))
		{
				var jsonEncode = json_encode(transMap);
				scr_save_string_to_file("save.json",jsonEncode);
				saveTrigger = true; //saves current data to file; if trigger1 is set to 0, will start tutorial
		}
		else
		{
			//if we do detect a file, load our save data for easy load access
			var tempStore = scr_load_jSON_from_file("save.json");
			var tempTriggerList = tempStore[? "triggerListed"]; //store trigger list into a temp
			var listLeng  = ds_list_size(tempTriggerList);
			for(var p = 0; p < listLeng; p++)
			{
				triggerList[| p] = tempTriggerList[| p];
			}
		}
		init = false;
	}

var tMap = ""; //these and the below code determines what key is used to store and load map data
var rMap = "";
if(room = rm_setup){tMap = rmStrList[0]; rMap = rmStrList[1];} //for debug
if(room = rm_new_demo){tMap = rmStrList[0]; rMap = rmStrList[1];}
if(room = rm_ocean_1){tMap = rmStrList[2]; rMap = rmStrList[3];}
if(room = rm_crystal_1){tMap = rmStrList[4]; rMap = rmStrList[5];}
if(room = rm_fungal_1){tMap = rmStrList[6]; rMap = rmStrList[7];}


//add this: if room change, change tilemap
if(room != rm_setup)
{
	triggerList[|16] += 1; //used for end game timer 
if(saveTrigger = true && init = false)
{
	
	if(newGame = true)
	{
		if(file_exists("save.json"))
		{
			file_delete("save.json");
		}
		init = true;
		newGame = false;
		exit;
	}
	
	var tempStore = scr_load_jSON_from_file("save.json");
	
	
	//file_text_write_string(saveLocal, "");
	//file_text_close(saveLocal);
	
	var yy = tilemap_get_height(tilemap);
	var xx = tilemap_get_width(tilemap);
	
	for(var i = 0; i < xx; i++)
	{
		for(var o = 0; o < yy; o++)
		{
			transGrid[# i,o] = tilemap_get(tilemap,i,o);
			//var _b = tilemap_get(tilemap,i,o)
			//transGrid[# i,o] = tile_get_index(tilemap,i,o);
		}
	}
	
	var tileMapWrite = ds_grid_write(transGrid);
	var radarMapWrite = ds_grid_write(global.mapGrid);
	//ds_map_clear(transMap); //note: this will delete triggerList. it looks as though it is unneeded
	
	//00000000000>>ds_map_add(transmap,"radarMap",radarMapWrite
	
	var b = ds_map_find_value(tempStore, rMap);
	if(b = undefined)
	{
		ds_map_add(tempStore,rMap,radarMapWrite);
	}
	else
	{
		tempStore[? rMap] = radarMapWrite;
	}
	
	var c = ds_map_find_value(tempStore, tMap);
	if(c = undefined)
	{
		ds_map_add(tempStore,tMap,tileMapWrite);
	}
	else
	{
		tempStore[? tMap] = tileMapWrite;
	}
	
	var d = ds_map_find_value(tempStore, "triggerListed");
	if(d = undefined)
	{
		ds_map_add_list(tempStore,"triggerListed",triggerList);
	}
	else
	{
		ds_map_replace_list(tempStore,"triggerListed",triggerList);
		//tempStore[? "triggerListed"] = triggerList;
	}
	
	
	//ds_map_add(transMap,tMap,tileMapWrite);
	//here, clear the save file and write the tempstore to transmap, then write it all to the save
	saveLocal = file_text_open_write("save.json");
	file_text_write_string(saveLocal, "");
	file_text_close(saveLocal);
	
	//ds_map_add_list(transMap,"triggerListed",triggerList);
	var jsonEncode = json_encode(tempStore);
	scr_save_string_to_file("save.json",jsonEncode);
	//note that if you have issues with the above, you most likely need to erase the savefile data,
	//though the script you borrowed should do it for you
	
	obj_ow_camera.saveAlpha = 1;
	saveTrigger = false;
	saveSwitch = true;
}

if(loadTrigger = true && init = false && displayActive = true)
{
	var tempStore = scr_load_jSON_from_file("save.json"); //pulls the map into a temp var
	
	if(trigLoad = true)
	{
		var tempTriggerList = tempStore[? "triggerListed"]; //store trigger list into a temp
		var listLeng  = ds_list_size(tempTriggerList); //this read and writes the trigges from the save to saveBoy
		for(var p = 0; p < listLeng; p++)
		{
			triggerList[| p] = tempTriggerList[| p];
		}
		
		//if(room != triggerList[|2]) //if we're not the room we need to be in associated with these triggers
		//{							// load said room; used mostly because we only ever load triggers from
			//room_goto(triggerList[|2]); //the main menu
			//exit;
		//}
		//if(openLoad)
		//{
		//	roomGoto = triggerList[|2];
		//	TPTrigX = triggerList[|3]; //x of the depot to spawn in
		//	TPTrigY = triggerList[|4]; //y of the depot to spawn in 
		//}
		target.HP = triggerList[|5]; //health
		target.HPMax = triggerList[|6]; //hpMax
		target.ore = triggerList[|7]; //ore
		target.paycheck = triggerList[|8]; //paycheck 
		target.bombs = triggerList[|9]; //bombs
		
		if(!instance_exists(obj_ow_transponder_controller_temp))
		{
		instance_create_depth(x,y,-1,obj_ow_transponder_controller_temp);
		}	
		obj_ow_transponder_controller_temp.keyClose = triggerList[|11]; //bombs
	
		trigLoad = false;
		debug1 ++;
	}
	
	if(roomLoad = true)
	{
		if(room = rm_setup){tMap = rmStrList[0]; rMap = rmStrList[1];} //for debug
		if(room = rm_new_demo){tMap = rmStrList[0]; rMap = rmStrList[1];}
		//if(room = rm_crash_zone_demo){tMap = rmStrList[0]; rMap = rmStrList[1];}
		if(room = rm_ocean_1){tMap = rmStrList[2]; rMap = rmStrList[3];}
		if(room = rm_crystal_1){tMap = rmStrList[4]; rMap = rmStrList[5];}
		if(room = rm_fungal_1){tMap = rmStrList[6]; rMap = rmStrList[7];}
		
		var b = ds_map_find_value(tempStore,tMap); //check if above data exists. if not, cancels load (aka we haven't been to the associated room before)
		if(is_undefined(b)){loadTrigger = false; roomLoad = false;  loadSwitch=true; exit;}
		
		ds_grid_read(transGrid, tempStore[? tMap]); //stores the tileMap grid into a grid 
		ds_grid_read(global.mapGrid,tempStore[? rMap]);
		obj_ow_mapper_test_2.update = true;

		//00000000>> var store radar map
		//00000000>> write map to the current radar map for specific rooms
		//00000000>> set the mapUdate to true 
	
		var yy = tilemap_get_height(tilemap); //this reads and writes the tilemap to the game
		var xx = tilemap_get_width(tilemap);
	
		for(var i = 0; i < xx; i++)
		{
			for(var o = 0; o < yy; o++)
			{
				tilemap_set(tilemap,transGrid[# i,o],i,o);
				//var b = tilemap_get(tilemap,i,o); //<<<<<<<<<<<<<<<<<<<<<<<<<<<<
				//tile_set_index(b,transGrid[# i,o]);
			}
		}
	obj_ow_auto_tile_dark.update = true;
	roomLoad = false;
	}
	
	loadTrigger = false;
	loadSwitch = true;
}



if(eraseTrigger = true && init = false) //clean this up 
{
	//file_text_close(saveLocal);
	saveLocal = file_text_open_write("save.json");
	file_text_write_string(saveLocal, "");
	file_text_close(saveLocal);
	//eraseTrigger = false; // don't forget these!
}
}

/*
if(TPTrig && rSwap)
{
	obj_ow_player_tank.x = TPTrigX;
	obj_ow_player_tank.y = TPTrigY;
	TPTrig = false;
	rSwap = false;
	//probably need to add in a clause to only do this once the room has swapped
}
*/
/*
if(obj_ow_fade_handler.COMPLETE = true)
{
	obj_ow_fade_handler.back = true;
}