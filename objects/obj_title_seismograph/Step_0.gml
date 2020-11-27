timer ++;

//if(obj_save_boy.opnLoad = true && loadTrig = false)
//{
	//instance_destroy();
//}

if(instance_exists(obj_ow_player_tank))
{
obj_ow_player_tank.controlPause = true;
}

if(instance_exists(obj_super_dumb_opener))
{
	exit;
}

startNewGame = keyboard_check_released(vk_space);
escHold = keyboard_check(vk_escape);
var skip = keyboard_check(vk_f3);

if(loadOp){
if(keyboard_check(vk_f1))
{
	if(!loadTrig)
	{
		var b = audio_play_sound(amb_loader_click,1,false);
		audio_sound_gain(b,0.25,0);
		audio_sound_pitch(b,0.5);
	}
	loadTrig = true;
}
}

if(loadTrig) //needs to move to next room before loading 
{
			/*
			if(obj_save_boy.triggerList[|1] != 0) //are we spawning at the elevator? 
			{
				//if no, kill the opening tut
				activeConvo = true;
				stor_complete = true;
			}
			else
			{
				//if yes, start the tutorial anyway
				startNewGame = true;
				loadTrig = false;
			}
			fade.forward = true;
			*/
			
			if(audio_sound_get_gain(openTheme) != 0)
			{
				audio_sound_gain(openTheme,0,120);	
			}
			
				//if(loadTrig = false)
				//{
				obj_save_boy.openLoad = true;
				obj_save_boy.roomSwap = true;
				loadTrig = true;
			//	}
			
			if(fade.COMPLETE)
			{
				audio_group_set_gain(soundEffects,global.audioGain,240);
				audio_stop_sound(openTheme);
				instance_destroy();
			}
			
			if(instance_exists(obj_ow_tutorial_controller))
			{
				obj_ow_tutorial_controller.tutActive = true;
			}
			
}


/*
var quickKill = keyboard_check(vk_f1);

if(quickKill)
{
	instance_destroy();
	obj_ow_tutorial_controller.fadeDone = true;
}
*/

if(startNewGame)
{	
	if(activeConvo && !stor_complete)
	{
		charCount = string_length(varOpeningTextCrawl);
	}
	
	if(!activeConvo)
	{
	fade.forward = true;
	obj_save_boy.newGame = true;
	activeConvo = true;
		var b = audio_play_sound(amb_loader_click,1,false);
		audio_sound_gain(b,0.25,0);
		audio_sound_pitch(b,0.5);
	}
	
	if(!activeConvo && stor_complete)
	{
		fade.forward = true;
		activeConvo = true;
	}
	
			if(audio_sound_get_gain(openTheme) != 0)
			{
				audio_sound_gain(openTheme,0,120);	
			}
			
	obj_save_boy.triggerList[|0] = false;
	obj_ow_tutorial_controller.tutActive = true;
}

if(skip)
{
	if(activeConvo && stor_complete = false)
	{
	activeConvo = true;
	stor_complete = true;
	fade.forward = true;
	}
}

if(escHold)
{
	escHoldTimer ++;
	if(escHoldTimer = 180)
	{
		game_end();
	}
}
else
{
	escHoldTimer = 0;
}


//have this object handle all the title screen BS, then if we move to the next room, keep the object active until
//the player starts, then kill
//display title
//click "start game" and fade to black
//move to next room, keep black
//keep things paused and scroll out the story blurb
//press space to continue once the thing is done, or hold to skip
//fade words out, then fade black screen out
//then kill this object 


if(!instance_exists(obj_ow_player_tank))
{
	instance_create_depth(0,0,500,obj_ow_player_tank);
}


if(init = false)
{
	
if(!file_exists("save.json"))
{
	loadOp = false;
}
else
{
	var tempStore = scr_load_jSON_from_file("save.json");
	var d = ds_map_find_value(tempStore, "triggerListed");
	var tempTriggerList = tempStore[? "triggerListed"]; //store trigger list into a temp
	var f = bool(tempTriggerList[| 12]);
	
	if(d = undefined)
	{
		loadOp = false;
	}
	else
	{

	}
	
		if(f = false)
		{
			loadOp = false;
		}
}
init = true;
}