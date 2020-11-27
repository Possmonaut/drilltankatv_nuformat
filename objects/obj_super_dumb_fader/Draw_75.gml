fade_alpha -= fSpeed;


if(fade_alpha <= 0)
{
	otrigger1 = false;
}

if(fade_alpha >= 1 && otrigger1 = false)
{
	instance_destroy();
}


draw_sprite_ext(sp_bigassBlackBG,0,0,0,1,1,0,c_white,fade_alpha);