if(point_distance(x+16,y+16,target.x+14,target.y+14) < fleeDist && fled = false)
{
	fled = true;
	fleeDir = point_direction(x+16,y+16,target.x+14,target.y+14) + 180;
	image_angle = fleeDir;
}

if(fled = true)
{
	fleeTimer ++;
	x+=cos(fleeDir*2*pi/360)*fleeSpeed;
	y+=-sin(fleeDir*2*pi/360)*fleeSpeed;
	if(fleeTimer > fleeTime)
	{
		instance_destroy();
	}
}