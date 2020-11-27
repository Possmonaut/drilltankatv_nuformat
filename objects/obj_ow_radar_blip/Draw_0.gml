if(point_distance(x+16,y+16,target.x+16,target.y+16) > 512)
{
	instance_destroy();
}

if(!instance_exists(progen))
{
	instance_destroy();
}

if(forceActivate = true)
{
	activated = true;
	eRad = 0;
	circleAlpha = 1;
	forceActivate = false;
	if(!audio_is_playing(myAud))
	{
	myAud = audio_play_sound(so_bb_ping,1,false);
	audio_sound_gain(myAud, global.blipVol,0);
	}
}

if(activated = true)
{
	eRad += circleSize;
	circleAlpha = 1 - eRad/radMax;
	if(eRad > radMax)
	{
		eRad = 0;
		circleAlpha = 1;
		activated = false;
	}
	draw_set_alpha(circleAlpha);
	draw_circle(x+xfst,y+yfst,eRad,true);
	draw_set_alpha(1);
}