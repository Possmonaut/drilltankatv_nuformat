// detect where player is heading according to their velocity
// target that point 
// curl back around towards said point 
// repeat adnaeseum
// have segments run detect code for collision with drilling drill collider / bomb
// if either are true, lose health 

//if player leaves radius of spawning location, arc back towards spawning location and despawn 

//depth = 301;

//show nlosping above rock to show this thing digs 
if(collision_line(x+16,y+16,target.x+14,target.y+14,obj_ow_nopass,false,true) = noone)
{
	//if(instance_exists(nlosPing)){
	//nlosPing.image_alpha = 0;
	//}
}

if(forceActivate)
{
	if(!instance_exists(myPing))
	{
	myPing = instance_create_depth(x-16,y-16,depth,obj_ow_radar_blip_enemy);
	forceActivate = false;
	}
	else
	{
		instance_destroy(myPing);
	}
}

//change the nlosping position when it's not being scanned
//if(instance_exists(nlosPing))
//{
	//if(nlosPing.image_alpha <= 0)
	//{
		//nlosPing.x = x-16;
		//nlosPing.y = y-16;
	//}
//}

//if our HP changes, enter flee mode
if(cHP > HP)
{
	cHP = HP;
	if(fleeing == false)
	{
		fleeing = true;
		tDir = irandom(360)
		tDist = 128;
		myAudS = audio_play_sound(so_rs_ambient,1,false);
		audio_sound_gain(myAudS,0.20,0);
		audio_sound_pitch(myAudS,2);
	}
}

//if HP = 0, begin death animation. if death anim compplete, drop ore
if(HP <= 0)
{
	death = true;
	deathAnim = true;
	if(dAnimComplete && dSpawn)
	{
		dSpawn = false;
		instance_create_depth(x,y,49,obj_ow_ore_chunk); 
	}
}

//begin timing flee behavior until we start attacking again
if(fleeing = true)
{
	fleeTimer ++;
	if(fleeTimer > fleeTime){fleeing = false;fleeTimer=0;}
}

//if not fleeing, target the player (or in front of them) and approach. probably wanna reenter the "in front of" parts
if(fleeing = false)
{
//tPointX = target.x + 14 + lengthdir_x(target.velocity * tDist,target.angleDir);
//tPointY = target.y + 14 + lengthdir_y(target.velocity * tDist,target.angleDir);
tPointX = target.x;
tPointY = target.y;
tDir = point_direction(x+16,y+16,tPointX,tPointY);
tDist = point_distance(x+16,y+16,target.x+14,target.y+14);
}

//alternatively, if we're returning to spawn, target spawn
if(comeBack = true)
{
	tDir = point_direction(x+16,y+16,progen.x+16,progen.y+16);
	tDist = point_distance(x+16,y+16,progen.x+16,progen.y+16);
}

//these are calculations for target DIR and SPEED
dSpd = 0.1 + round(tDist * 0.01);
//spd = 1 + clamp(6- round(tDist * 0.01),0,100);
//maybe have a detect circle cut in half. if player BEHIND then slow. if player in front, then speed up
if(tDir > myDir - 90 && tDir < myDir + 90)
{
	spd += 0.01;
	spd = clamp(spd,minSpeed,topSpeed);
}
else
{
	spd -= 0.005;
	spd = clamp(spd,minSpeed,topSpeed);
}

if(!death)
{
	if(myDir != tDir)
	{
		if(myDir > 360){myDir = 0;}
		if(myDir < 0){myDir = 360;}

		if (angle_difference(myDir, tDir) > 0 ){
		myDir = myDir - dSpd;
		}

		if(angle_difference(myDir, tDir) < 0 ){
		myDir = myDir + dSpd;
		}
	}
}

//if we're not death, actually move towards the target
x+=cos(myDir*2*pi/360)*spd;
y+=-sin(myDir*2*pi/360)*spd;

//segment control
for(var i = 0; i <segNum-1; i ++)
{
	var pX = segArray[i].x;
	var pY = segArray[i].y;
	var sX = segArray[i+1].x;
	var sY = segArray[i+1].y;
	var pDir = segArray[i].direction;
	if(i = 0){pDir = myDir+180;}
	var distM = 0.5;
	if(i = segNum-2){distM = 0.15}; //adjusted endsegment position
	var poDir = point_direction(pX,pY,sX,sY);
	var angDif = clamp(angle_difference(poDir,pDir),-58.8,58.8);
	segArray[i+1].direction = pDir + angDif;
	segArray[i+1].x = pX + lengthdir_x(segArray[i+1].sprite_width*distM,segArray[i+1].direction);
	segArray[i+1].y = pY + lengthdir_y(segArray[i+1].sprite_height*distM,segArray[i+1].direction);
	segArray[i+1].image_angle = segArray[i+1].direction+180;
	segArray[i+1].image_alpha = activeDraw;
}


//run collision checks on each segment, and set depth accordingly
//if collision / inrock = true, depth = whatever, collision = false

//var emgX = x + lengthdir_x(16,myDir);
//var emgY = y + lengthdir_y(16,myDir);
/*(
if(instance_position(emgX,emgY,obj_ow_nopass_enemy) = noone)
{
	if(emerge = false)
	{
		part_particles_create(global.P_System, emgX, emgY, global.rockDeath, 6);
		emerge = true;
	}
}
else
{
	if(emerge = true)
	{
		emerge = false;
		part_particles_create(global.P_System, emgX, emgY, global.rockDeath, 6);
		//make hole
	}
}
*/

if(instance_position(x+16,y+16,obj_ow_nopass_enemy) = noone)
{
	emerge = true;
}
else
{
	emerge = false;
}

//also check point at tip of head; if point no longer in rock, generate a temp sprite just to see if it works 
//also spray rock chunks 
//set a SWITCH to "OUT" and then when the tip goes back IN, generate another emergent point as it digs back in 

bHitTime ++;
if(bHitTime > bHitTimer)
{
	bHitTime = 0;
	blastHit = false;
}