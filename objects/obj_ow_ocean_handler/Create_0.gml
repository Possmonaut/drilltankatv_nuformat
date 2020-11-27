//todo
/*
handles the unique particles and effects of the ocean biome
needs 2 layesr for parallax
particles need to only sit still but move at differign speeds than the player 
this may require 2 unique particles systems, nd for one to have it's speed changed based on the speed of the player
the other can just stay in one place really 
//let's get our singular one up first

have snow generate offscreen in squared areas and gently drift in a specific direction (down most liekly)
alternatively just weight the chance to spawn in the middle of the screen to very low?
*/

target = obj_ow_player_tank;
streamTrig = true;

global.marineSnow = part_type_create();
part_type_size(global.marineSnow, 0.1, 6, -0.0001, 0);
part_type_colour1(global.marineSnow, c_white);
part_type_alpha3(global.marineSnow, 0.1,0.75,0.1);
part_type_speed(global.marineSnow, 0.04, 0.06, 0, 0); //note, speed at 1,2, creates a really cool living creature effect
part_type_direction(global.marineSnow, 0, 359, 0, 0);
part_type_blend(global.marineSnow, false);
part_type_life(global.marineSnow, 480, 600);

p_emit1 = part_emitter_create(global.P_System);
part_emitter_region(global.P_System, p_emit1, 0, 0, 0, 0, ps_shape_rectangle, ps_distr_linear);

if(!audio_is_playing(amb_ocean))
{
oceanAmb = audio_play_sound(amb_ocean,1,true);
audio_sound_gain(oceanAmb,0,0);
}
else
{
	var b = audio_sound_get_track_position(amb_ocean);
	audio_stop_sound(amb_ocean);
	oceanAmb = audio_play_sound(amb_ocean,1,true);
	audio_sound_gain(oceanAmb,0,0);
	audio_sound_set_track_position(oceanAmb,b);
}

gainMod = 0.01;