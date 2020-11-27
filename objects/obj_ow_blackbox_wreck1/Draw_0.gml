//draw_self();

if(forceActivate = true)
{
	activated = true;
	eRad = 0;
	circleAlpha = 1;
	forceActivate = false;	
}

if(activated = true)
{
	eRad += circleSize;
	circleAlpha = 1 - eRad/radMax;
	if(eRad > radMax)
	{
		eRad = 0;
		circleAlpha = 1;
		activated = false;
	}
	draw_set_alpha(circleAlpha);
	draw_circle(x+xfst,y+yfst,eRad,true);
	draw_set_alpha(1);
}

