//read line word by word
//for eat word, check the lngth of the line + said word 


//if(keyboard_check_released(vk_space))
//{
//	ds_list_add(msgSpooler,0);
//	ds_list_add(msgSpooler,1);

//}
if(instance_exists(obj_ow_player_tank))
{
	if(obj_ow_player_tank.controlBool = 0)
	{
		if(keyboard_check_released(ord("T")))
		{
			if(keyClose)
			{
				keyClose = false;
				obj_save_boy.triggerList[|11] = 0;
			}
			else
			{
				keyClose = true;
				obj_save_boy.triggerList[|11] = 1;
			}
			newMsg = false;
		}
	}
	else
	{
		if(gamepad_button_check_released(0,gp_shoulderr))
		{
			if(keyClose)
			{
				keyClose = false;
				obj_save_boy.triggerList[|11] = 0;
			}
			else
			{
				keyClose = true;
				obj_save_boy.triggerList[|11] = 1;
			}
			newMsg = false;
		}
	}
}

if(ds_list_size(msgSpooler) > 0)
{
	lineSelect = msgSpooler[|0];
	readLine = true;
}

//the calling object has to set readLine to true, and supply a value for lineSelect
if(readLine = true)
{
	var lineLength = string_length(lineList[|lineSelect]);
	var targetLine = lineList[|lineSelect];
	var tempStore = "";
	var totalStore = "";
	ds_list_add(printList, " ");
	ds_list_add(printList, nameSpooler[|0] + ":");
	for (var i = 1; i < lineLength; i ++)
	{
		tempStore += (string_char_at(targetLine, i));
		
		if(string_char_at(targetLine,i) == " ")
		{
			if(string_width(totalStore) + string_width(tempStore) >= maxlineLeng+offSet)
			{
				//totalStore += string(string_width(totalStore));
				
				ds_list_add(printList, totalStore);
				totalStore = "";
				totalStore += tempStore;
				tempStore = "";
			}
		}
		else
		{
			totalStore = tempStore;
		}
		if(i = lineLength-1)
		{
			totalStore += string_char_at(targetLine, i+1);
			ds_list_add(printList, totalStore);
		}
		
	}
	
	
	//ds_list_add(printList, "");
	newEncode = true;
	if(ds_list_size(msgSpooler) > 0)
	{
		ds_list_delete(msgSpooler,0);
		ds_list_delete(nameSpooler,0);
		readLine = false;
	}
	else
	{
		readLine = false;
	}
	
}

//so do all this, shuttle the printList off to the GUI draw event, and have it draw and move things around 

//we'll actually do the printlist creation HERE. so just read the printList data into the displayList

//bump everything up, top to bottom
//read the printlist into the displayList backwards. so line 0 goes into position 9, etc
//do this one letter at a time, just like we mentioned
//we'll have to make this an expanded for loop since it'll add data per frame 

//so type out sentence
//once length reached, bump up everything, erase said sentence from the printlist, write the next one at position 0


if(newEncode = true)
{
	var line = string(printList[|0]);
	debug0 = line;
	
	if(charCount < string_length(line))
	{

		charCount += typeSpeed;
		textPart = string_copy(line, 0, charCount);
		displayList[|displayLines-1] = textPart;
		if(!keyClose)
		{
			if(!audio_is_playing(amb_trans_beep))
			{
			var _b = audio_play_sound(amb_trans_beep,1,false);
			audio_sound_gain(_b,0.01,0);
			var _r = random_range(1,1.1);
			audio_sound_pitch(_b,_r);
			}
		}
	}
	else
	{
	charCount = 0;
	newEncode = false;
	}
}


if(ds_list_size(printList) > 0 && charCount = 0)
{
	
	for(var o = 1; o < displayLines; o++)
	{
		var storeLine = displayList[|o];
		displayList[|o-1] = storeLine;
		if(o = displayLines-1)
		{
			displayList[|o] = ">";
			
		}
	}
	
	ds_list_delete(printList,0);
	if(ds_list_size(printList) > 0)
	{
	newEncode = true;
	}
}

if(ds_list_size(printList) = 0)
{
	readComplete = true;
}
else
{
	readComplete = false;
}