var click_check = mouse_check_button(mb_left);

if(click_check)
{
	nPoint = true;
	pointcX = mouse_x;
	pointcY = mouse_y;
}



var pd = point_direction(x,y,pointcX,pointcY);


if(cDur > 360){cDur = 0;}
if(cDur < 0){cDur = 360;}


if (angle_difference(cDur, pd) > 0 ){
cDur = cDur - durSpd;
}

if(angle_difference(cDur, pd) < 0 ){
cDur = cDur + durSpd;
}


if(cDur <= pd+23 && cDur >= pd-22)
{
	if(x != pointcX)
	{
	x+=cos((cDur)*2*pi/360)*spd;
	}

	if(y != pointcY)
	{
	y+=-sin((cDur)*2*pi/360)*spd;
	}
	
	stpTimer = fStp;
}
else
{
	stpTimer = tStp;
}

clam = pd;