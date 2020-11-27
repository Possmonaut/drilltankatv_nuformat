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
		///obj_save_boy.TPTrigX = TPTrigX;
		//obj_save_boy.TPTrigY = TPTrigY;
		//.TPTrig = true;
		//obj_save_boy.triggerList[|2] = nxtRm;
		obj_save_boy.saveTrigger = true;
		saveWait = false;
	}
	fade.forward = true;
	obj_audio_controlboy.fade = true;
}
