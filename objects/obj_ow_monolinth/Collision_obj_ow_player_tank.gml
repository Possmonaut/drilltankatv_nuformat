if(other.velocity > 0.5){ other.velocity = 0.5;}

if(target.visualSpriteTank.damageFlash == false && death != true && animTimer > animMax*0.5)
{
	target.HP -= 5;
	target.visualSpriteTank.damageFlash = true;
	var r = random_range(0.9,1.3);
	var b = audio_play_sound(so_damage,1,false);
	sc_shake_call(3,30,true);
	audio_sound_gain(b,0.5,0);
	audio_sound_pitch(b,r);
	
}