if(collide  && shake = true)
{
	var hGain = 20;
	if(obj_ow_player_tank.HP < 25)
	{hGain = 40;}
	
	obj_ow_player_tank.HP += clamp(obj_ow_player_tank.HPMax - obj_ow_player_tank.HP, 0, hGain); 
	shake = false;
	var b = audio_play_sound(so_ore_grab,1,false);
	audio_sound_gain(b,0.5,0);
}


if(shake = true)
{
	draw_self();
}

if(shake = false)
{
	depth = -1;
	letterTimer ++;
	draw_text_color(x, y - letterTimer, "Hull Repaired", c_black, c_black, c_black,c_black,1);
	draw_text_color(x + 4, y + 4 - letterTimer, "Hull Repaired", c_white, c_white, c_white,c_white,1);
	if(letterTimer >= 120)
	{
		instance_destroy();
		instance_destroy(mySpawn);
	}
	
}