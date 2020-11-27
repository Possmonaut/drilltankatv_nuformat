target = obj_ow_player_tank;

if(init = true)
{
	for(var i = 0; i < listSize; i ++)
	{
	ds_list_add(trackPListX,target.x);
	ds_list_add(trackPListY,target.y);
	
	}
	init = false;
}

timer ++;


if(timer > timerMax)
{
	timer = 1;
	updateInt = 0;
}


if(timer > updateInt)
{
	ds_list_delete(trackPListX,0);
	ds_list_delete(trackPListY,0);
	ds_list_add(trackPListX,target.x);
	ds_list_add(trackPListY,target.y);

	updateInt = timer + updateTime; 
}



angleDir = point_direction(x,y,trackPListX[|0],trackPListY[|0]);

var wobble = (sineGain*dsin(timer));
var shkDist = distance_to_object(target);
if(shkDist > 256)
{
	wobble = 1;
}

x+=cos(angleDir*2*pi/360)*(spd+wobble);
y+=-sin(angleDir*2*pi/360)*(spd+wobble);

if(spd < baseSpd)
{
	spd += 0.01;
}

if(segDir != angleDir)
{
	if(segDir > 360){segDir = 0;}
	if(segDir < 0){segDir = 360;}

	if (angle_difference(segDir, angleDir) > 0 ){
	segDir = segDir - dSpd;
	}

	if(angle_difference(segDir, angleDir) < 0 ){
	segDir = segDir + dSpd;
	}
}


for(var i = 0; i <segNum-1; i ++)
{
	var pX = segArray[i].x;
	var pY = segArray[i].y;
	var sX = segArray[i+1].x;
	var sY = segArray[i+1].y;
	var pDir = segArray[i].direction;
	var distM = 0.5;
	if(i = 0)
	{var distM = 0.1;
		pDir = segDir+180;
		pY += 32;
		}
	//else
	//{var distM = 0.5;}
	var poDir = point_direction(pX,pY,sX,sY);
	var angDif = clamp(angle_difference(poDir,pDir),-58.8,58.8);
	segArray[i+1].direction = pDir + angDif;
	segArray[i+1].x = pX + lengthdir_x(segArray[i+1].sprite_width*distM,segArray[i+1].direction);
	segArray[i+1].y = pY + lengthdir_y(segArray[i+1].sprite_height*distM,segArray[i+1].direction);
	segArray[i+1].image_angle = segArray[i+1].direction+90;
	//segArray[i+1].image_alpha = activeDraw;
}

//if interval, curl away from player towards dif point
//wait until fully OOB of main track (about 2 seconds at double speed or so)
//target pouint on track ahead of player (y, x is the same as endX)
//have rumbly rocks come out of wall where appearing
//burst from that side of the wall, wiggle for a bit
//back out, spawn back BEHIND the player, and continue chase 


if(shkDist < 160)
shkStr = ((160 - shkDist) * 0.009) * shkMod;
sc_shake_call(shkStr,30,true);

if(rockAud != 0)
{
	rockAud -= 0.5;
}