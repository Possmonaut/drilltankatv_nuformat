if(cDest = true)
{
	instance_create_depth(x,y,depth,obj_ow_supsat_gen);
	var a  = audio_play_sound(so_crys_break,1,false);
	var i = irandom_range(0.9,1.4);
	audio_sound_pitch(a,i);
	part_particles_create(global.P_System, x+16, y+16, global.crystalPart, 6);
	part_particles_create(global.P_System, x+16, y+16, global.rockSpark, 6);
}

