instance_destroy(visualSp);
//instance_destroy(nlosPing);
instance_destroy(treadLeft);
instance_destroy(treadRight);
if(instance_exists(meleeSp))
{
	instance_destroy(meleeSp);
}

part_particles_create(global.P_System, x+16, x+16, global.blood, 6);
part_particles_create(global.P_System, x+16, x+16, global.meatChunk, 6);
var b = audio_play_sound(so_meat_break,1,false);
audio_stop_sound(myAudA);