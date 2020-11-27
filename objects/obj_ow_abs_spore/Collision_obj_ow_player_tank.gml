if(target.visualSpriteTank.damageFlash == false && death != true)
{
	target.HP -= 5;
	target.visualSpriteTank.damageFlash = true;
	var r = random_range(0.9,1.3);
	var b = audio_play_sound(so_damage,1,false);
	audio_sound_gain(b,0.25,0);
	audio_sound_pitch(b,r);
	sc_shake_call(3,30,true);
	part_particles_create(global.P_System,x+16,y+16,global.meatChunk,8);
	instance_destroy();
}