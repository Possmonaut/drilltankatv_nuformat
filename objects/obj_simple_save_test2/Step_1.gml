//keystrokes here for ease of access

key_back = keyboard_check_released(vk_backspace);
key_enter = keyboard_check_released(vk_enter);
key_active = keyboard_check_released(vk_anykey);
key_load = keyboard_check_released(vk_f1);
key_erase = keyboard_check_released(vk_f2);
key_current = keyboard_lastchar;

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

if(key_enter)
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