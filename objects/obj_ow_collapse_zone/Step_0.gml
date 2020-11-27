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
		if(!TPTrig)
		{
		sc_shake_call(5,60,true);
		}
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

if(TPTrig)
{
	obj_save_boy.TPTrigX = TPTrigX;
	obj_save_boy.TPTrigY = TPTrigY;
	obj_save_boy.roomGoto = nxtRm;
	obj_save_boy.roomSwap = true;
	audio_sound_gain(myAud, 0, 1000);
	if(audio_sound_get_gain(myAud) = 0)
	{
		audio_stop_sound(myAud);
	}
}
