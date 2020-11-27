//draw_self();

headAnim += hAnimInt;
if(headAnim > headAnimMax)
{
	headAnim = 0;
}

if(headAnim <= (headAnimMax * 0.5) + hAnimInt && headAnim >= (headAnimMax * 0.5) - hAnimInt)
{
	var shkDist = distance_to_object(target);
	if(!audio_is_playing(myBite) && shkDist < 256)
	{
	myBite = audio_play_sound(so_grinder_bite,1,false);
	audio_sound_gain(myBite,0.05,0);
	audio_sound_pitch(myBite,0.5);
	}
	
}



draw_sprite_ext(sp_head_swap_animated,headAnim,x,y+32,1,1,segDir-90,c_white,1);

/*
if(global.debug)
{
draw_self();
draw_line(x-112,y-46,x+112,y-46);
}

//var wobble = (sineGain*dsin(timer));
//draw_text(x,y,spd+wobble);