

ds_list_destroy(drillArray);
path_delete(myPath);
instance_destroy(drillCollider);
instance_destroy(visualSp);
//instance_destroy(nlosPing);

if(audio_is_playing(myAudM))
{
	audio_stop_sound(myAudM);
}