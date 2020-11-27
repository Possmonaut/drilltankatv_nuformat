var gainModDrag = 0.1; //use these to change the final volume values according to audio loudess
var gainModOpen = 0.5;
var gainModBite = 0.5;
var pitchModDrag = 1.75;
var clampAud = 0;

var t = collision_line(x+32,y+32,target.x+14,target.y+14,obj_ow_nopass_enemy,false,true);
if(t != noone)
{
	clampAud = 0.1;
}
else
{
	clampAud = 1;
}

var vDist = sc_gainFalloff(384, 0);
if(vDist > clampAud){vDist = clampAud;}

if(pullT)
{
	if(!audio_is_playing(myAudM))
	{
	myAudM = audio_play_sound(so_grinder_move,1,false);
	audio_sound_gain(myAudM,vDist*gainModDrag,0);
	audio_sound_pitch(myAudM,pitchModDrag);
	}
}


if(state = 1 && swipeTimer = 1 )
{
	var b = audio_play_sound(so_grinder_bite,1,false);
	audio_sound_gain(b,vDist*gainModBite,0);
}

if(state = 2 || state = 5)
{
	
	if(!audio_is_playing(myAudE))
		{
		myAudE = audio_play_sound(so_drill_inrock,1,true);
		audio_sound_gain(myAudE,0,0);
		audio_sound_gain(myAudE,vDist*gainModOpen,250);
		}
	}
	else
	{
		if(audio_is_playing(myAudE))
		{
			if (audio_sound_get_gain(myAudE) > 0)
			{
				audio_sound_gain(myAudE,0,250);
			}
			else
			{
				audio_stop_sound(myAudE);
			}
		}
}