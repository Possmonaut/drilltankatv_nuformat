timer ++;

if(!audGainTrig && timer > 120)
{
	myAud = audio_play_sound(amb_end_theme,1,false);
	audio_sound_gain(myAud,0,0);
	audio_sound_gain(myAud,audGain,9000);
	audio_sound_pitch(myAud,0.9);
	audGainTrig = true;
}


if(timer > 370000)
{
	if(!audio_is_playing(amb_beach))
	{
		myAudC = audio_play_sound(amb_beach,1,1);
		audio_sound_gain(myAudC,0,0);
		audio_sound_gain(myAudC,audGain*0.25,9000);
	}
}
//also have audio fade out if going back to main menu