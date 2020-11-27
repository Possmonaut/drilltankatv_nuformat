ds_grid_destroy(transGrid);
ds_map_destroy(transMap);
ds_list_destroy(triggerList);

/*
//this went in the being step. nott used but saved here just in case 
//keystrokes here for ease of access
	

key_back = keyboard_check_released(vk_backspace);
key_enter = keyboard_check_released(vk_enter);
key_active = keyboard_check_released(vk_anykey);
//key_load = keyboard_check_released(vk_f1);
//key_erase = keyboard_check_released(vk_f2);
key_save = keyboard_check_released(vk_f3);

key_current = keyboard_lastchar;
//add simple save function here to create a file at the start of the game so you can save / load


if(key_active = true)
{
	if(key_back = false && key_enter = false)
	{
		if(string_length(tempText) <= 16)
		{
		tempText += key_current;
		}
	}
}

if(key_back)
{
	tempText = string_delete(tempText,string_length(tempText),1);
	key_current = "";
}

if(key_save)
{
	saveTrigger = true;
	key_current = "";
}

if(key_load)
{
	loadTrigger = true;
	key_current = "";
}

if(key_erase)
{
	eraseTrigger = true;
	key_current = "";
}
*/