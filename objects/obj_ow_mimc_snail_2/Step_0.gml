//this controls the endpoint of the arm

armTimer ++;

var pd = point_direction(x+16,y+16,target.x+14,target.y+14);
if(state = 4)
{
	pd = point_direction(x+16,y+16,startX+16,startY+16);
}

if(pullT = false)
{
if(cDur > 360){cDur = 0;}
if(cDur < 0){cDur = 360;}

if(death = false)
{
	if (angle_difference(cDur, pd) > 0 ){
	cDur = cDur - durSpd;
	}

	if(angle_difference(cDur, pd) < 0 ){
	cDur = cDur + durSpd;
	}
}

if(cDur <= pd+23 && cDur >= pd-22)
{
	circRotation = true;
}
}

lArmX = x+lengthdir_x(32,cDur);
lArmY = y+lengthdir_y(32,cDur);

if(armTimer > stpTimer)
{
	if(armStp = true)
	{
		armStp = false;
		rUpdate = true;
	}
	else
	{
		armStp = true;
		rUpdate = true;
	}
	armTimer = 0;
}
else
{
	pullT = true;
}

var startPX = x + 16+ lengthdir_x(16,cDur);
var startPY = y +16+ lengthdir_y(16,cDur);
var reachbonus = 32; //

if(armStp)
{
	var targX = startPX+lengthdir_x(reachLength+reachbonus,cDur);
	var targY = startPY+lengthdir_y(reachLength+reachbonus,cDur);
	
	if(rUpdate)
	{
	//var tDir = point_direction(armPnt1X,armPnt1Y,targX,targY);
	armPnt1X = approach(armPnt1X,targX,armSpd);
	armPnt1Y = approach(armPnt1Y,targY,armSpd);
	}
	
	if(armPnt1X = targX && armPnt1Y = targY)
	{
		rUpdate = false;
	}
pullT = false;

}
else
{
}

//draw_circle(armPnt1X,armPnt1Y,8,false);
//draw_circle(armPnt2X,armPnt2Y,8,false);


if(state = 3 || state = 4) //if we're not swiping)
{
endpointX = armPnt1X;
endpointY = armPnt1Y;
}
else
{

}

	if(circRotation && state = 4)
	{
		//endpointX = startPX+lengthdir_x(reachLength+reachbonus,cDur);
		//endpointY = startPY+lengthdir_y(reachLength+reachbonus,cDur);
		pullT = false;
		circRotation = false;
	}


if(handPointX != endpointX)
{
	handPointX = approach(handPointX,endpointX,armSpd);
}

if(handPointY != endpointY)
{
	handPointY = approach(handPointY,endpointY,armSpd);
}

//lArm.image_alpha = activeDraw;