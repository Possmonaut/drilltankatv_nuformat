//here we're handling the code for audio, just to keep things clean

//set distance gain
//set nlos gain
//have nlos gain be a cap on dist gain so things can be very slightly heard through walls 

//going to needto have vars for each 3 audio beats 



//use these to change the final volume values according to audio loudess
var gainModGrind = 0.4;
var gainModBite = 0.1;
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

if(state = 0 || state =1 || state = 2)
{
	if(state = 0){gainModGrind = 0.1;}
	audio_sound_gain(myAudM,vDist*gainModGrind,250);
}
else
{
	if(audio_is_playing(myAudM))
	{
		audio_sound_gain(myAudM,0,500);
	}
}

if(state = 2 && strikeTimer = 30)
{
	var b = audio_play_sound(so_grinder_bite,1,false);
	audio_sound_gain(b,vDist*gainModBite,0);
}

