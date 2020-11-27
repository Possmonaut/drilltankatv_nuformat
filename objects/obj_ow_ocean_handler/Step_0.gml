//if room start, create a bunch of particles in square

part_system_depth(global.P_System,1); //draw our particles over everything but shadows 

part_emitter_region(global.P_System, p_emit1, target.x-512, target.x+512, target.y-512, target.y+512, ps_shape_rectangle, ps_distr_linear);

if(streamTrig = true)
{
	part_emitter_stream(global.P_System,p_emit1,global.marineSnow,1);
	streamTrig = false;
}
part_system_depth(global.P_System,obj_ow_particle_handler.depth);


//if intunnel, change gain
//p sure you had the room swapper change volume while going between rooms; double check 


if(target.inTunnel)
{
	if(audio_sound_get_gain(oceanAmb) != 0.5*gainMod)
	{
	audio_sound_gain(oceanAmb,0.5*gainMod,250);
	}
}
else
{
	if(audio_sound_get_gain(oceanAmb) != 1*gainMod)
	{
	audio_sound_gain(oceanAmb,1*gainMod,250);
	}
}

if(audio_is_playing(amb_fungal))
{
	audio_sound_gain(amb_fungal,0,3000);
	if(audio_sound_get_gain(amb_fungal) <= 0)
	{
		audio_stop_sound(amb_fungal);
		audio_sound_gain(amb_fungal,1,0);
	}
}

if(audio_is_playing(amb_crystal))
{
	audio_sound_gain(amb_crystal,0,3000);
	if(audio_sound_get_gain(amb_crystal) <= 0)
	{
		audio_stop_sound(amb_crystal);
		audio_sound_gain(amb_crystal,1,0);
	}
}
