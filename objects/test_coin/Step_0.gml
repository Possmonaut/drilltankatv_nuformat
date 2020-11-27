timer ++;

if(switch1 = false)
{
	if(gravDecay >=1)
	{
	byDecay -= gravDecay;
	}
	
	by+=byDecay;
	x = swapAnim(ax, bx, cx, timer/120);
	y = swapAnim(ay, by, cy, timer/30);
}
else
{
}

if(x = targetX  || y = targetY && switch1 = false)
{
	//targetX = targetX/2;
	ax = x;
	ay = y;
	bx = (targetX)/2;
	//by = (by)/2;
	cx = targetX; // End position of the arc.
	cy = targetY;
	timer = 0;

}


if(by >= cy)
{
	
	by = cy;
	
	switch1 = true;
}
