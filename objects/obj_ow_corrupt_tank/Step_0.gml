//this is all code for movement

if(myDir > 360){myDir = 0;}
if(myDir < 0){myDir = 360;}

if(death = false)
{
	if (angle_difference(myDir, angleDir) > 0 ){
	myDir = myDir - durSpd;
	trTurn = 1;
	}

	if(angle_difference(myDir, angleDir) < 0 ){
	myDir = myDir + durSpd;
	trTurn = -1;
	}
}


/*
if(myDir <= angleDir+23 && myDir >= angleDir-22)
{
mMove = true;
trTurn = 0;
}
else
{
mMove = false;
}
*/

//if(mMove = true)
//{
var bbox_side = 0;
var veloX = velocity;
var veloY = velocity;

collisionVeloX= cos(myDir*2*pi/360)*velocity;
collisionVeloY= -sin(myDir*2*pi/360)*velocity;


// /*

	if(place_meeting(x + collisionVeloX, y, obj_ow_nopass)){
		while(!place_meeting(x+ collisionVeloX,y,obj_ow_nopass))
		{
			x+=collisionVeloX;
		}
	
	veloX = 0;
	}

	if(place_meeting(x, y + collisionVeloY, obj_ow_nopass)){
		while(!place_meeting(x, y+collisionVeloY,obj_ow_nopass))
		{
			y+=collisionVeloY;
		}
	veloY = 0;
	}
	
	
	if(place_meeting(x + collisionVeloX, y, obj_ow_enemy_passable)){
		while(!place_meeting(x+ collisionVeloX,y,obj_ow_enemy_passable))
		{
			x+=collisionVeloX;
		}
	
	veloX = 0;
	}

	if(place_meeting(x, y + collisionVeloY, obj_ow_enemy_passable)){
		while(!place_meeting(x, y+collisionVeloY,obj_ow_enemy_passable))
		{
			y+=collisionVeloY;
		}
	
	veloY = 0;
	}
	
// */

x+=cos(myDir*2*pi/360)*veloX;
y+=-sin(myDir*2*pi/360)*veloY;
