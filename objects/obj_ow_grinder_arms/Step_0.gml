
if(armType = 1)
{
	x = progen.lArmX;
	y = progen.lArmY;
}
else
{
	x = progen.rArmX;
	y = progen.rArmY;
}



//length from base to endpoint
armLength = point_distance(x,y,endpointX,endpointY);
halfLength = point_distance(x,y,endpointX,endpointY) / 2;

//halfway between base to endpoint
centerPointX = x + lengthdir_x(halfLength,point_direction(x,y,endpointX,endpointY));
centerPointY = y + lengthdir_y(halfLength,point_direction(x,y,endpointX,endpointY));

//solves for midpoint using pythag theorem
var lengthCalc1 = sqr(jointLength/2) - sqr(halfLength);
lengthCalc1 = abs(lengthCalc1);
var lengthCalc2 = sqrt(lengthCalc1);

//direction and point 90 degrees from the centerpoint
centerDirX = centerPointX + lengthdir_x(lengthCalc2,point_direction(x,y,endpointX,endpointY) - (90*armType));
centerDirY = centerPointY + lengthdir_y(lengthCalc2,point_direction(x,y,endpointX,endpointY) - (90*armType));

//distance between middle of armLength and the point 90 degrees above
midLength = point_distance(centerPointX,centerPointY,centerDirX,centerDirY);

midjointX = centerDirX;
midjointY = centerDirY;


//anim loop: lerp to start, pause, lerp, pause, move x/y, pause, lerp, pause, reset, pause, etc
//if player releases space, lerp back to resting point
//note: when implimented, have it at least reach pnt 1, then return. 
//also note: can have the 4 points be randomly generated

//have it move up and down the y axis on it's "base"
//have it deploy slowly, yhen move quickly to each weld point 
//reduce size? 
/*
if(keySpace)
{
	if(targetPoint = 0)
	{
		targetPoint = irandom_range(1,4);
	}
	
	targX = targetList[# targetPoint - 1, 0];
	targY = targetList[# targetPoint - 1, 1];
	
	if(armSpeed != activeSpeed)
	{
		armSpeed += 0.001;
	}
	
	if(endpointX != targX)
	{
		endpointX += (targX - endpointX) * armSpeed;
	}
	else
	{
		endpointX = targX;
		posLockX = true;
	}
	
		if(endpointY != targY-16)
	{
		endpointY += (targY-16 - endpointY) * armSpeed;
	}
	else
	{
		endpointY = targY-16;
		posLockY = true;
	}
	
	if(posLockX && posLockY)
	{
		
		part_particles_create(global.P_System,endpointX,endpointY+24,global.sparkParticle,5);
		waitTimer ++;
		if(waitTimer >= 30)
		{
			
			targetPoint += 1;
			if(targetPoint > 4){targetPoint = 1;}
			waitTimer = 0;
			posLockX = false;
			posLockY = false;
		}
	}
	
	
}
else
{	
	armSpeed = deploySpeed;
	
	if(endpointX != restingPointX)
	{
		endpointX += (restingPointX - endpointX) * armSpeed;
	}
	
	if(endpointY != restingPointY)
	{
		endpointY += (restingPointY - endpointY) * armSpeed;
	}
	waitTimer = 0;
}