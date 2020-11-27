
if(TPTrig)
{
	//white fade
	//room transfer
	
	if(target.angleDir != 90)
	{

		if(angle_difference(target.angleDir, 90) > 0 ){
		target.angleDir = target.angleDir - 1;
		}

		 if(angle_difference(target.angleDir, 90) < 0 ){
		 target.angleDir = target.angleDir + 1;
		 }
	}
	
	target.velocity = 1;
	
	
	audio_group_set_gain(soundEffects,0,500);
	audio_group_set_gain(ambMusic,0,500);
	
	if(drawFade >= 1)
	{
		audio_group_stop_all(soundEffects);
		audio_group_stop_all(ambMusic);
		audio_group_set_gain(ambMusic,1,0);
		audio_group_set_gain(soundEffects,1,0);
		room_goto(rm_victory_1);
	}
}

/*
if(saveWait = false){
	obj_save_boy.TPTrigX = TPTrigX;
	obj_save_boy.TPTrigY = TPTrigY;
	obj_save_boy.TPTrig = true;
	obj_save_boy.triggerList[|2] = nxtRm; 
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
		obj_save_boy.saveTrigger = true;
		saveWait = false;
	}
	fade.forward = true;
}
*/