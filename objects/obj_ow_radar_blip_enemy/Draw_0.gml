if(fActive = true && !complete)
{
	activated = true;
	eRad = 0;
	circleAlpha = 1;
	forceActivate = false;
	fActive = false;
	if(!audio_is_playing(myAud))
	{
	myAud = audio_play_sound(so_bb_ping,1,false);
	audio_sound_gain(myAud, global.blipVol,0);
	}
}

if(gActive && !complete)
{
	eRad += circleSize;
	circleAlpha = 1 - eRad/radMax;
	if(eRad > radMax)
	{
		eRad = 0;
		circleAlpha = 1;
		activated = false;
		gActive = false;
		complete = true;
	}
	draw_set_alpha(circleAlpha);
	draw_circle(x+xfst,y+yfst,eRad,true);
	draw_set_alpha(1);
}

if(complete)
{
	instance_destroy();
}