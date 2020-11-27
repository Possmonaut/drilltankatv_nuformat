if((instance_position(x + 16, y +16, obj_ow_player_tank) || instance_position(x + 16, y +16, obj_ow_tank_drill))  && shake = true)
{
	obj_ow_player_tank.ore ++;
	shake = false;
	var b = audio_play_sound(so_ore_grab,1,false);
	audio_sound_gain(b,0.5,0);
}

