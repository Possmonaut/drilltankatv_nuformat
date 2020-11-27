//might need to update which object is being referenced betwene room swaps 

if(room != cRoom && (room != rm_deadth_screen || room != rm_victory_1))
{
	target = obj_ow_player_tank;
	cRoom = room;
}

if(fade)
{
	if(audio_sound_get_gain(soundEffects) = global.audioGain)
	{
		audio_group_set_gain(soundEffects,0,1000);
		audio_group_set_gain(ambMusic,0,1000);
	}
	
	if(audio_sound_get_gain(soundEffects) = 0)
	{
		audio_group_stop_all(soundEffects);
		audio_group_stop_all(ambMusic);
		audio_group_set_gain(soundEffects,global.audioGain,5000);
		audio_group_set_gain(ambMusic,global.audioGain,5000);
	}
	
	if(audio_sound_get_gain(soundEffects) = global.audioGain)
	{
		fade = false;
	}
}

//also do stuff for ambient
//also do distance control for lava

if(room != rm_deadth_screen || room != rm_victory_1)
{
	if(instance_exists(target))
	{
		if(target.inMagma)
		{
			if(!audio_is_playing(lavaAmb) || lavaAmb = -1)
			{
				lavaAmb = audio_play_sound(amb_magma,1,true);
				audio_sound_gain(lavaAmb,0,0);
			}
	
			if(audio_sound_get_gain(lavaAmb) != global.audioGain)
			{
			audio_sound_gain(lavaAmb,global.audioGain*lavaMod,250); 
			}
		}
		else
		{
			if(audio_sound_get_gain(lavaAmb) != 0)
			{
			audio_sound_gain(lavaAmb,0,250); 
			}
		}
	}
}

var keyAudioDebugU = 0;
var keyAudioDebugD = 0;

	if(instance_exists(obj_ow_player_tank))
	{
		if(obj_ow_player_tank.controlBool = 0)
		{
			 keyAudioDebugU = keyboard_check_released(vk_f9);
			 keyAudioDebugD = keyboard_check_released(vk_f8);
		}
		else
		{
			depressTimer ++;
			if(depressTimer > 20)
			{
			 keyAudioDebugU = gamepad_button_check_pressed(0,gp_padr);
			 keyAudioDebugD = gamepad_button_check_pressed(0,gp_padl);
			depressTimer = 0;
			}
		}
	}

	if(!instance_exists(obj_title_seismograph))
	{
		if(keyAudioDebugU)
		{
			global.audioGain += debugAudGain;
			audio_group_set_gain(ambMusic,global.audioGain,250);
			audio_group_set_gain(soundEffects,global.audioGain,250);
			obj_save_boy.triggerList[|14] = global.audioGain;
			obj_ow_camera.volAlpha = 1;
			obj_ow_camera.volGain = false;
		}
	
		if(keyAudioDebugD)
		{
			global.audioGain -= debugAudGain;
			audio_group_set_gain(ambMusic,global.audioGain,250);
			audio_group_set_gain(soundEffects,global.audioGain,250);
			obj_save_boy.triggerList[|14] = global.audioGain;
			obj_ow_camera.volAlpha = 1;
			obj_ow_camera.volGain = true;
		}
	}
	
	global.audioGain = obj_save_boy.triggerList[|14];
	