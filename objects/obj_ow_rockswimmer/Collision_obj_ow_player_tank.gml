
//if target no invuln and not fleeing and not dead, deal damage
if(target.visualSpriteTank.damageFlash == false && fleeing == false && death != true)
{
	target.HP -= 5;
	target.visualSpriteTank.damageFlash = true;
	var r = random_range(0.9,1.3);
	var b = audio_play_sound(so_damage,1,false);
	audio_sound_gain(b,0.5,0);
	audio_sound_pitch(b,r);
	sc_shake_call(3,30,true);
}