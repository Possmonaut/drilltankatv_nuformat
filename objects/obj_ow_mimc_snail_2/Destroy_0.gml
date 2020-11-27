path_delete(myPath);
instance_destroy(visualSp);

if(audio_is_playing(myAudM))
{
	audio_stop_sound(myAudM);
}

if(audio_is_playing(myAudE))
{
	audio_stop_sound(myAudE);
}

if(audio_is_playing(myAudI))
{
	audio_stop_sound(myAudI);
}