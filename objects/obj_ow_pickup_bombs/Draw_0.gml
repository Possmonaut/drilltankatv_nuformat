if(collide  && shake = true)
{
	var bGain = 1;
	if(obj_ow_player_tank.bombs <4)
	{
		bGain = 2;
	}
	
		obj_ow_player_tank.bombs += bGain;
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
	draw_text_color(x, y - letterTimer, "+1 Charge", c_black, c_black, c_black,c_black,1);
	draw_text_color(x + 4, y + 4 - letterTimer, "+1 Charge", c_white, c_white, c_white,c_white,1);
	if(letterTimer >= 120)
	{
		instance_destroy();
		instance_destroy(mySpawn);
	}
	
}