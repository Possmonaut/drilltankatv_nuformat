
//var pd = point_direction(x,y,mDir,mDir);
var pd = mDir;

if(progen.myPath = -1 || progen.state = 3)
{reachLength = 0;}
else
{reachLength = 24}


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
mMove = true;
	
	stpTimer = fStp;
}
else
{
	stpTimer = tStp;
}

clam = pd;