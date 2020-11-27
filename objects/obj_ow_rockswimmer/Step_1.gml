//emerge 
//ambNoise
//ambTunnel

if(!deathAnim || !dAnimComplete)
{

	var tMod = 0.25;
	var aMod = 0.20;
	var vDist = sc_gainFalloff(384, 0);


	if(collision_line(x,y,target.x+14,target.y+14,obj_ow_nopass,false,true) = noone)
	{
		audio_sound_gain(myAudA,vDist*tMod,100);
	}
	else
	{
		if(audio_is_playing(myAudA))
		{
			audio_sound_gain(myAudA,0,500);
		}
	}

	audio_sound_gain(myAudM,vDist*aMod,0);
}