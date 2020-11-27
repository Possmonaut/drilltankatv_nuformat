
/*
if(target.drilling = true)
{depth = target.depth +2;}
else
{
	depth = target.depth - 1;
	treadLeft.depth = depth+1;
	treadRight.depth = depth+1;
}
*/

if(instance_exists(obj_ow_test_radar_mapper_d2)){
	
	/*
if(obj_ow_test_radar_mapper_d2.radarComplete = true)
{
	depth = target.depth - 1;
	treadLeft.depth = depth+1;
	treadRight.depth = depth+1;
}

if(target.drilling = false && obj_ow_test_radar_mapper_d2.radarComplete = false)
{
	depth = target.depth - 1;
	treadLeft.depth = depth+1;
	treadRight.depth = depth+1;
}
*/

if(obj_ow_test_radar_mapper_d2.keypress = false)
{
	depth =  -10;
	treadLeft.depth = depth+1;
	treadRight.depth = depth+1;
	target.visualSpriteDrill.depth = depth - 1;
	
}
else
{
	depth =  originDepth;
	treadLeft.depth = depth+1;
	treadRight.depth = depth+1;
	target.visualSpriteDrill.depth = depth - 1;
}


}

timer ++;

//image_angle += obj_ow_player_tank.angleDir - rotation;


rotation = obj_ow_player_tank.angleDir;

/*
if(rotation > 67.5 && rotation < 112.5){image_index = 4;image_angle = rotation - 90;} //up 6/7
if(rotation > 247.5 && rotation < 292.5){image_index = 0;image_angle = rotation + 90;} //down 4/5
if(rotation > 337.5 || rotation < 22.5){image_index = 2;image_angle = rotation;} //right 2/3
if(rotation > 157.5 && rotation < 202.5){image_index = 6;image_angle = rotation - 180;} //left 0/1

if(rotation > 22.5 && rotation < 67.5){image_index = 3;image_angle = rotation - 45;} //upright
if(rotation > 112.5 && rotation < 157.5){image_index = 5;image_angle = rotation - 135;} //upleft
if(rotation > 202.5 && rotation < 247.5){image_index = 7;image_angle = rotation +135;} //downleft
if(rotation > 292.5 && rotation < 337.5){image_index = 1;image_angle = rotation +45;} //downright
*/


if(target.HP <= target.HPMax / 2)
{
	maxSmoke = 3;
	if(target.HP <= target.HPMax - (target.HPMax * 0.9))
	{
		maxSmoke = 7;
	}
	
	if(smokeTimer <= timer)
	{
		var minSmoke = maxSmoke - 2;
		part_particles_create(global.P_System,x + 16, y + 16, global.smokeParticle, irandom_range(minSmoke,maxSmoke));
		smokeTimer = timer + 30;
	}
}


if(target.controlPause = true)
{
	flashlight.image_alpha = 0;
}
else
{
	flashlight.image_alpha = 1;
}

treadLeft.x = x - lengthdir_x(trdOfst,rotation+90);
treadLeft.y = y - lengthdir_y(trdOfst,rotation+90);

treadRight.x = x + lengthdir_x(trdOfst,rotation+90);
treadRight.y = y + lengthdir_y(trdOfst,rotation+90);

treadLeft.image_angle = rotation - 90;
treadRight.image_angle = rotation - 90;

if(treadTimer < timer)
{
	part_system_depth(global.P_System,treadRight.depth+1);
	part_type_orientation(global.treadPart,rotation,rotation,0,0,false);
	part_particles_create(global.P_System,treadRight.x,treadRight.y,global.treadPart,1);
	part_particles_create(global.P_System,treadLeft.x,treadLeft.y,global.treadPart,1);
	part_system_depth(global.P_System, obj_ow_particle_handler.depth);
	treadTimer = timer +10;
}

//code should be something more like 
//right = trdSpd * target.velocity + 0.02 * (2 + target.angleAccel);
//left = trdSpd * target.velocity + 0.02 * (-2 + target.angleAccel);
//half max tread speed + half tread speed, reduced by the speed at which we're rotating.
//a sine probably fixes this handily 

treadLeft.image_speed = trdSpd * target.velocity;
treadRight.image_speed = trdSpd * target.velocity;

if(target.angleAccel > 0) //turning left
{
treadRight.image_speed -= (trdSpd * 0.25 * target.angleAccel);
}
else //turning right 
{
treadLeft.image_speed += (trdSpd * 0.25 * target.angleAccel);
}


var bTest = irandom(120);

if(bTest = 1 && target.velocity != 0 )
{
	bump = true;
	tSelect = irandom(1);
}

if(bump)
{
	bumpTimer ++;
	if(tSelect = 0)
	{
	treadRight.image_xscale = 1.3;
	treadRight.image_yscale = 1.1;
	}
	else
	{
	treadLeft.image_xscale = 1.3;
	treadLeft.image_yscale = 1.1;
	}
	sc_shake_call(0.5,5,true);
	if(bumpTimer >= 5)
	{
	treadLeft.image_xscale = 1.2;
	treadLeft.image_yscale = 1;
	treadRight.image_xscale = 1.2;
	treadRight.image_yscale = 1;
	bumpTimer = 0;
	bump = false;
	}
	
}