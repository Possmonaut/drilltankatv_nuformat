timer ++;

image_alpha = 0;
draw_self();

lArmX = x+lengthdir_x(16,cDur-25);
lArmY = y+lengthdir_y(16,cDur-25);
rArmX = x+lengthdir_x(16,cDur+25);
rArmY = y+lengthdir_y(16,cDur+25);

if(timer > stpTimer)
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
	timer = 0;
}

if(armStp)
{
	var targX = x+lengthdir_x(reachLength+16,cDur+22);
	var targY = y+lengthdir_y(reachLength+16,cDur+22);
	
	if(rUpdate)
	{
	var tDir = point_direction(armPnt1X,armPnt1Y,targX,targY);
	armPnt1X = approach(armPnt1X,targX,armSpd);
	armPnt1Y = approach(armPnt1Y,targY,armSpd);
	}
	
	if(armPnt1X = targX && armPnt1Y = targY)
	{
		rUpdate = false;
	}

}
else
{
	var targX = x+lengthdir_x(reachLength+16,cDur-22);
	var targY = y+lengthdir_y(reachLength+16,cDur-22);
	
	if(rUpdate)
	{
	var tDir = point_direction(armPnt2X,armPnt2Y,targX,targY);
	armPnt2X = approach(armPnt2X,targX,armSpd);
	armPnt2Y = approach(armPnt2Y,targY,armSpd);
	}
	
	if(armPnt2X = targX && armPnt2Y = targY)
	{
		rUpdate = false;
	}
}

//draw_circle(armPnt1X,armPnt1Y,8,false);
//draw_circle(armPnt2X,armPnt2Y,8,false);

lArm.endpointX = armPnt1X;
lArm.endpointY = armPnt1Y;

rArm.endpointX = armPnt2X;
rArm.endpointY = armPnt2Y;

//var hX = x+lengthdir_x(64,cDur);
//var hY = y+lengthdir_y(64,cDur);
//draw_line(x,y,hX,hY);



for(var i = 0; i <5; i ++)
{
	//if(i = 5)
	//{
	//	exit;
	//}
	var pX = segArray[i].x;
	var pY = segArray[i].y;
	var sX = segArray[i+1].x;
	var sY = segArray[i+1].y;
	var pDir = segArray[i].direction;
	if(i = 0){pDir = cDur+180;}
	var distM = 0.5;
	//if(i = 0){distM = 1};
	var poDir = point_direction(pX,pY,sX,sY);
	var angDif = clamp(angle_difference(poDir,pDir),-58.8,58.8);
	segArray[i+1].direction = pDir + angDif;
	segArray[i+1].x = pX + lengthdir_x(segArray[i+1].sprite_width*distM,segArray[i+1].direction);
	segArray[i+1].y = pY + lengthdir_y(segArray[i+1].sprite_height*distM,segArray[i+1].direction);
	segArray[i+1].image_angle = segArray[i+1].direction+90;
}

draw_sprite_ext(sp_grinder_body,0,x,y,1,1,cDur-90,c_white,1);