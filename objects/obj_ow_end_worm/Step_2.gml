if(collision_line(x-112,y-46,x+112,y-46,target,false,true) != noone)
{
	if(target.visualSpriteTank.damageFlash == false)
	{
	target.HP -= 5;
	target.visualSpriteTank.damageFlash = true;
	if(target.angleDir >=197.5 && target.angleDir<= 22.5)
	{
		target.angleDir = 90;
	}
	target.velocity = 3;
	var r = random_range(0.9,1.3);
	var b = audio_play_sound(so_damage,1,false);
	audio_sound_gain(b,bumpGain,0);
	audio_sound_pitch(b,r);
	}
	
}

//80