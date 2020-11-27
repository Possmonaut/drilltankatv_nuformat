
/*
if(TPTrig)
{
	obj_save_boy.TPTrigX = TPTrigX;
	obj_save_boy.TPTrigY = TPTrigY;
	obj_save_boy.roomGoto = nxtRm;
	obj_save_boy.openLoad = false;
	obj_save_boy.roomSwap = true;
}
*/

if(saveWait = false){
	//obj_save_boy.TPTrigX = TPTrigX;
	//obj_save_boy.TPTrigY = TPTrigY;
	//obj_save_boy.TPTrig = true;
	//obj_save_boy.triggerList[|2] = nxtRm; 
	bombs = obj_ow_player_tank.bombs;
	HP = obj_ow_player_tank.HP;
	audio_group_stop_all(soundEffects);
	audio_group_set_gain(soundEffects,global.audioGain,0);
	saveWait = false;
	TPTrig = false;
	room_goto(nxtRm);
	}

if(TPTrig)
{
	if(fade.COMPLETE = true && saveWait = true)
	{
		//obj_save_boy.TPTrigX = TPTrigX;
		//obj_save_boy.TPTrigY = TPTrigY;
		//obj_save_boy.TPTrig = true;
		//obj_save_boy.triggerList[|2] = nxtRm;
		//obj_save_boy.saveTrigger = true;
		saveWait = false;
	}
	fade.forward = true;
	audio_group_set_gain(soundEffects,0,1000);
}

if(room = nxtRm)
{
	
	obj_ow_player_tank.x = TPTrigX;
	obj_ow_player_tank.y = TPTrigY;
	obj_ow_player_tank.HP = HP;
	obj_ow_player_tank.bombs = bombs;
	fade.back = true;
	instance_destroy();
}