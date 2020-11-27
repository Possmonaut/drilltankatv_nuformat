//spark spray
//damage
//sound
//kill self 


if(target.visualSpriteTank.damageFlash == false)
{
	part_particles_create(global.P_System, target.x+14, target.y+14, global.rockSpark, 6);
	target.HP -= 5;
	target.visualSpriteTank.damageFlash = true;
	
	var u = audio_play_sound(so_grinder_bite,1,false);
	audio_sound_gain(u,0.1,0);
	audio_sound_pitch(u,1.5);
	
	var r = random_range(0.9,1.3);
	var b = audio_play_sound(so_damage,1,false);
	audio_sound_gain(b,0.5,0);
	audio_sound_pitch(b,r);
	
	sc_shake_call(3,30,true);
}

instance_destroy();