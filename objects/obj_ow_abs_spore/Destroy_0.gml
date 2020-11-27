//instance_destroy(nlosPing);
part_particles_create(global.P_System, x+16, y+16, global.blood, 12);
part_particles_create(global.P_System, x+16, y+16, global.meatChunk, 6);
var b = instance_create_depth(x,y,depth-1,obj_ow_toxin_cloud);
b.image_angle = irandom(359);
if(instance_exists(progen))
{
progen.sporeOut --;
}
audio_stop_sound(myAudA);