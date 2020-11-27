var gainModActive = 0.5; //use these to change the final volume values according to audio loudess
var gainModOpen = 0.25;
var gainModClosed = 0.1;
var pitchModDrag = 1.75;
var clampAud = 0;

var t = collision_line(x+16,y+16,target.x+14,target.y+14,obj_ow_nopass_enemy,false,true);
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

if(state = 1 || state = 3 || state = 2)
{
	audio_sound_gain(myAudI,gainModOpen,500);
}
else
{
	audio_sound_gain(myAudI,gainModClosed*vDist,500);
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