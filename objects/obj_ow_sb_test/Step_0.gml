dirGain++;

myDir += dirAdd;

if(HP < 0)
{
	exit;
}

if(forceActivate)
{
	if(!instance_exists(myPing))
	{
	myPing = instance_create_depth(x,y,depth,obj_ow_radar_blip_enemy);
	forceActivate = false;
	}
	else
	{
		instance_destroy(myPing);
	}
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

if(dirGain = 359)
{
	dirAdd *= -1;
	dirGain = 0;
}

if(HP != cHP && bTimer > bTime)
{
	collision = true;
	bTimer = 0;
}

cHP = HP;

collisionVeloX= cos(myDir*2*pi/360)*spd;
collisionVeloY= -sin(myDir*2*pi/360)*spd;

		var veloTrigger = 0;
		
		if(collisionVeloX > 0)
		{
			bbox_side = bbox_right;
		}
		else
		{
			bbox_side = bbox_left;
		}
		
		if(tilemap_get_at_pixel(global.Tiles_1,bbox_side + collisionVeloX, bbox_top) != 0 || tilemap_get_at_pixel(global.Tiles_1,bbox_side + collisionVeloX, bbox_bottom) != 0)
		{
			if(collisionVeloX > 0)
			{
				x = x;
			}
			else
			{
				x = x;
			}
			veloTrigger ++;
		}
		
		if(collisionVeloY > 0)
		{
			bbox_side = bbox_bottom;
		}
		else
		{
			bbox_side = bbox_top;
		}
		if(tilemap_get_at_pixel(global.Tiles_1, bbox_right,bbox_side + collisionVeloY) != 0 || tilemap_get_at_pixel(global.Tiles_1, bbox_left,bbox_side + collisionVeloY) != 0)
		{
			if(collisionVeloY > 0)
			{
				y = y;
			}
			else
			{
				y = y;
			}
			veloTrigger ++;
		}
		
		if(veloTrigger != 0)
		{
			collision = true;
		}


if(collision)
{
	collision = false;
	myDir += 90 * dirAdd;
	//var b = audio_play_sound(so_rock_break,1,false);
	//audio_sound_gain(b,vDist*sMod,0);
}

x+=cos(myDir*2*pi/360)*spd;
y+=-sin(myDir*2*pi/360)*spd;

gasTimer ++;

if(gasTimer == (gasTime / 2))
{
	//create gas particle
}

if(gasTimer > gasTime)
{
	gasTimer = 0;
	var b = instance_create_depth(x+16,y+16,depth-1,obj_ow_toxin_cloud);
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
	if(i = 0)
	{var distM = 0.25;
		pX += 16;
		pY += 16;
		}
	else
	{var distM = 0.9;}
	if(i = 1)
	{var distM = 1.8;}
	
	var poDir = point_direction(pX,pY,sX,sY);
	var angDif = clamp(angle_difference(poDir,pDir),-98.8,98.8); //was 58.8
	if(i = 1)
	{var angDif = clamp(angle_difference(poDir,pDir),0,0);} //was 58.8}
	segArray[i+1].direction = pDir + angDif;
	segArray[i+1].x = pX + lengthdir_x(segArray[i+1].sprite_width*distM,segArray[i+1].direction);
	segArray[i+1].y = pY + lengthdir_y(segArray[i+1].sprite_height*distM,segArray[i+1].direction);
	segArray[i+1].image_angle = segArray[i+1].direction+180;
	segArray[i+1].image_alpha = activeDraw;
}

if(HP<=0)
{
	part_particles_create(global.P_System, x+16, y+16, global.meatChunk, 16);
	instance_destroy();
}