part_system_depth(global.P_System,1); //draw our particles over everything but shadows 

part_emitter_region(global.P_System, p_emit1, target.x-512, target.x+512, target.y-512, target.y+512, ps_shape_rectangle, ps_distr_linear);

if(streamTrig = true)
{
	part_emitter_stream(global.P_System,p_emit1,global.marineSnow,1);
	streamTrig = false;
}
part_system_depth(global.P_System,obj_ow_particle_handler.depth);

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

if(audio_is_playing(amb_crystal))
{
	audio_sound_gain(amb_crystal,0,3000);
	if(audio_sound_get_gain(amb_crystal) <= 0)
	{
		audio_stop_sound(amb_crystal);
		audio_sound_gain(amb_crystal,1,0);
	}
}

if(audio_is_playing(amb_ocean))
{
	audio_sound_gain(amb_ocean,0,3000);
	if(audio_sound_get_gain(amb_ocean) <= 0)
	{
		audio_stop_sound(amb_ocean);
		audio_sound_gain(amb_ocean,1,0);
	}
}

/*
var _x = cos(target.angleDir*2*pi/360)*target.xVelo;
var _y = sin(target.angleDir*2*pi/360)*target.yVelo;

layer_vspeed(fg_fungal_layer,_y*0.5);
layer_hspeed(fg_fungal_layer,_x*0.5);
*/
