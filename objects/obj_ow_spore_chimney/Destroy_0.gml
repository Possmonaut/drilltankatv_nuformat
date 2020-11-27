if(HP < 0)
{
audio_play_sound(so_meat_break,1,false);
}

audio_stop_sound(myAudA);
part_particles_create(global.P_System, x+16, y+16, global.blood, 12);
part_particles_create(global.P_System, x+16, y+16, global.meatChunk, 6);
