
if(shake = true)
{
draw_sprite_ext(sp_ore_chunk,0,x+12,y+12,1,1,myDir,c_white,1);
}

if(shake = false)
{
	depth = -1;
	letterTimer ++;
	draw_text_color(x, y - letterTimer, "+1 ore", c_black, c_black, c_black,c_black,1);
	draw_text_color(x + 4, y + 4 - letterTimer, "+1 ore", c_white, c_white, c_white,c_white,1);
	if(letterTimer >= 120)
	{
		instance_destroy();
	}
	
}