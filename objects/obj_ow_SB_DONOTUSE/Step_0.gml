if(HP < 0)
{
	exit;
}

var clampAud = 0;
var sMod = 0.5; //set the gain mod for the bounce sound
	
if(activeDraw = 1)
{
	clampAud = 0.1;
}
else
{
	clampAud = 1;
}

var vDist = sc_gainFalloff(384, 0);
if(vDist > clampAud){vDist = clampAud;}

audio_sound_gain(myAudA,vDist*0.25,250);




collisionVeloX= cos(myDir*2*pi/360)*spd; //generate these same values for the drill collider, but from the lengthdir
collisionVeloY= -sin(myDir*2*pi/360)*spd;
var tSpd = spd;

if(place_meeting(x + collisionVeloX, y, obj_ow_nopass)){
	while(!place_meeting(x+ collisionVeloX,y,obj_ow_nopass))
	{
		x+=collisionVeloX;
	}
tSpd = 0;
collision = true;
}

if(place_meeting(x, y + collisionVeloY, obj_ow_nopass)){
	while(!place_meeting(x, y+collisionVeloY,obj_ow_nopass))
	{
		y+=collisionVeloY;
	}
tSpd = 0;
collision = true;
}


if(collision)
{
	for(var i = 0; i < 16; i++)
	{
		var xx = x+ lengthdir_x(32,i*22.5);
		var yy = y+ lengthdir_y(32,i*22.5);
		var b = instance_position(xx,yy,obj_ow_nopass);
		if(b = !noone)
		{refOccu[|i] = 1;}
	}

	for(var i = 0; i < 16; i++)
	{
		if(refOccu[|i] = 0)
		{
			ds_list_add(refPList,i);
		}
	}

	var b = ds_list_size(refPList);
	var t = irandom(b);
	myDir = t*22.5;

	ds_list_clear(refPList);
	for(var i = 0; i < 16; i++)
	{
		refOccu[|i] = 0;
	}
	

	
	var b = audio_play_sound(so_rock_break,1,false);
	audio_sound_gain(b,vDist*sMod,0);
}

x+=cos(myDir*2*pi/360)*tSpd;
y+=-sin(myDir*2*pi/360)*tSpd;

collision = false;

gasTimer ++;

if(gasTimer == (gasTime / 2))
{
	//create gas particle
}

if(gasTimer > gasTime)
{
	gasTimer = 0;
	var b = instance_create_depth(x,y,depth-1,obj_ow_toxin_cloud);
	b.image_angle = irandom(359);
}

if(segDir != myDir)
{
	if(segDir > 360){segDir = 0;}
	if(segDir < 0){segDir = 360;}

	if (angle_difference(segDir, myDir) > 0 ){
	segDir = segDir - dSpd;
	}

	if(angle_difference(segDir, myDir) < 0 ){
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
	if(i = 0){pDir = segDir+180;}
	var distM = 0;
	if(i = 1 || i = 0)
	{var distM = 0.25;}
	else
	{var distM = 0.5;}
	var poDir = point_direction(pX,pY,sX,sY);
	var angDif = clamp(angle_difference(poDir,pDir),-58.8,58.8);
	segArray[i+1].direction = pDir + angDif;
	segArray[i+1].x = pX + lengthdir_x(segArray[i+1].sprite_width*distM,segArray[i+1].direction);
	segArray[i+1].y = pY + lengthdir_y(segArray[i+1].sprite_height*distM,segArray[i+1].direction);
	segArray[i+1].image_angle = segArray[i+1].direction+180;
	segArray[i+1].image_alpha = activeDraw;
}