//cleanup segments 

for(var i = 1; i < segNum; i++)
{
	instance_destroy(segArray[i]);
}

//if(instance_exists(nlosPing))
//{
//instance_destroy(nlosPing);
//}

//ds_list_destroy(segArray);

if(audio_is_playing(myAudM))
{
	audio_stop_sound(myAudM);
}

if(audio_is_playing(myAudA))
{
	audio_stop_sound(myAudA);
}