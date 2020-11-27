if(instance_position(x + 16, y + 16, obj_ow_rock) != noone)
{
	
}
else
{
	if(shake = true)
	{
	draw_self();
	letterTimer = 0;
	}
}

if(shake = false)
{
	depth = -1;
	letterTimer ++;
	draw_text_color(x, y - letterTimer, "+1 possum", c_black, c_black, c_black,c_black,1);
	draw_text_color(x + 4, y + 4 - letterTimer, "+1 possum", c_white, c_white, c_white,c_white,1);
	if(letterTimer >= 120)
	{
		instance_destroy();
	}
	
}