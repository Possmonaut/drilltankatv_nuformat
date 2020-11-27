if(image_index > image_num *0.5 && image_index < (image_num *0.5) + 1)
{
	velo = 1;
}

if(velo > 0)
{
	velo -= veloDecay;
}

if(x > 8000)
{
	x = 0;
	dir = irandom(359);
		image_angle = dir;
}

if(y > 8000)
{
	y = 0;
	dir = irandom(359);
		image_angle = dir;
}

if(x < 0)
{
	x = 8000;
	dir = irandom(359);
		image_angle = dir;
}

if(y < 0)
{
	y = 8000;
	dir = irandom(359);
		image_angle = dir;
}

x+=cos(dir*2*pi/360)*velo;
y+=-sin(dir*2*pi/360)*velo;