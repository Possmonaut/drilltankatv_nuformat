if(fade_alpha >= 1 && otrigger1 = false)
{
	global.opener = false;
	instance_create_depth(x,y,depth,obj_super_dumb_fader);
	instance_destroy();
}


if(otrigger1)
{
	fade_alpha -= fSpeed;
}
else
{
	fade_alpha += fSpeed;
}

if(fade_alpha <= 0)
{
	openerTimer ++;
	if(openerTimer > 180)
	{
	otrigger1 = false;
	}
}



draw_sprite_ext(sp_trash_splash,0,0,0,1,1,0,c_white,1);

var midWX = window_get_width() * 0.5;
var midWY = window_get_height() * 0.5;

draw_set_font(pixelette32);
var _b = string_width("TRASHTRONAUT");
draw_text(midWX - (_b*0.5),midWY+200,"TRASHTRONAUT");
draw_set_font(pixelette16);
draw_sprite_ext(sp_bigassBlackBG,0,0,0,1,1,0,c_white,fade_alpha);