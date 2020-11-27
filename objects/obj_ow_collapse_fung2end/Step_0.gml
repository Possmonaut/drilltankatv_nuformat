if(instance_exists(target.visualSpriteTank))
{
	depth = target.visualSpriteTank.depth + 4;
}

var b = point_distance(target.x+14,target.y+14,x,y,);

if(b < trigDist)
{
	timer ++;
	
	if(timer > trigTime)
	{
		target.controlPause = true;
		sc_shake_call(5,60,true);
		if(myAud = -1)
		{
			myAud = audio_play_sound(so_drill_inrock,1,true);
			audio_sound_gain(myAud,0,0);
			audio_sound_gain(myAud,0.5,250);
		}
		
		target.velocity = 0;
		//target.angleDir = point_direction(x,y,target.x+14,target.y+14) + 180;
		if(image_index < animMax -1)
		{
			image_index += animInt;
		}
		
		distFallCheck += 0.6;
		
		
		if(b < distFallCheck)
		{
			if(fallAng = -1)
			{
			fallAng = target.angleDir;
			}
			
			target.velocity = 0.4;
			target.angleDir = point_direction(x,y,target.x+14,target.y+14) + 180;
			falling = true;
	
			if(target.visualSpriteTank.image_xscale != 0)
			{
				target.visualSpriteTank.image_xscale -= sizeLInt;
				target.visualSpriteTank.image_yscale -= sizeLInt;
				target.visualSpriteDrill.image_xscale -= sizeLInt;
				target.visualSpriteDrill.image_yscale -= sizeLInt;
				target.visualSpriteTank.treadLeft.image_xscale -= sizeLInt;
				target.visualSpriteTank.treadLeft.image_yscale -= sizeLInt;
				target.visualSpriteTank.treadRight.image_xscale -= sizeLInt;
				target.visualSpriteTank.treadRight.image_yscale -= sizeLInt;
			}
			else
			{
				TPTrig = true;
				target.visualSpriteTank.treadLeft.image_xscale = 0;
				target.visualSpriteTank.treadLeft.image_yscale = 0;
				target.visualSpriteTank.treadRight.image_xscale = 0;
				target.visualSpriteTank.treadRight.image_yscale = 0;
			}
		}
	}
}


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


/*
if(TPTrig)
{
	obj_save_boy.TPTrigX = TPTrigX;
	obj_save_boy.TPTrigY = TPTrigY;
	obj_save_boy.roomGoto = nxtRm;
	obj_save_boy.openLoad = false;
	obj_save_boy.roomSwap = true;
}