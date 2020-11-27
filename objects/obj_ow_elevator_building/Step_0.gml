if(collision_rectangle(x,y,x+(8*32),y+(8*32),target,false,true) != noone)
{
	depth = -103;
	if(image_alpha!= 0)
	{
		image_alpha -= 0.01;
	}
}
else
{
	if(image_alpha!= 1)
	{
		image_alpha += 0.01;
	}
}