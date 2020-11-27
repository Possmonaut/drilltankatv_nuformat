//states
//0 = idle wander
//1 = chasing
//2 = attacking 
//3 = eating
//4 = death

timer ++;

if(activated)
{
	fadeVal -= 0.005;
	visualSp.image_alpha = fadeVal;
}

if(visualSp.image_alpha <= 0 && activated)
{
	activated = false;
	fadeVal = 0.85;
}

if(forceActivate)
{
	visualSp.image_alpha = 0.85;
	forceActivate = false;
}

if(HP <= 0)
{
	state = 4;
}

drillCollider.x = x + 16 + lengthdir_x(16,direction);
drillCollider.y = y + 16 + lengthdir_y(16,direction);

visualSp.x = x + 16;
visualSp.y = y + 16;


if(visualSp.image_angle != direction - 90)
{
	if(visualSp.image_angle > direction - 90)
	{
	visualSp.image_angle -=2;
		if(visualSp.image_angle < direction - 90 + 2)
		{
			visualSp.image_angle = direction - 90;
		}
	}
	
	if(visualSp.image_angle < direction - 90)
	{
	visualSp.image_angle +=2;
	if(visualSp.image_angle > direction - 90 - 2)
		{
			visualSp.image_angle = direction - 90;
		}
	}
}

var tCharge = false;

if(visualSp.image_angle <= direction - 90 +23 && visualSp.image_angle <= direction - 90 -23)
{
	tCharge = true;
}

/*
if(state = 0 || state = 3)
{
visualSp.image_angle = direction - 90;
}
*/


//visualSp.image_angle = direction - 90;
drillCollider.image_angle = direction - 90;

if(distance_to_object(obj_ow_player_tank) <= detectRange)
{
	if(collision_line(x+16,y+16,target.x,target.y,obj_ow_nopass_enemy,false,true) = noone)
	{
		if(state != 2)
		{
		state = 1;
		}
	}
}
else
{
	if(state != 3)
	{
		chaseTimer --;
		if(chaseTimer <= 0)
		{
			state = 0;
			chaseTimer = chaseTimerInterval;
		}
	}
}

if(state = 0)
{
	//x+=cos(direction*2*pi/360)*mySpeed;
	//y+=-sin(direction*2*pi/360)*mySpeed;
	
	collision_rectangle_list(drillCollider.bbox_left,drillCollider.bbox_top,drillCollider.bbox_right,drillCollider.bbox_bottom,obj_ow_rock_parent,false,true,drillArray,false);

	var listLeng = ds_list_size(drillArray);

	for(var i = 0; i < listLeng; i ++)
	{
		if(instance_exists(drillArray[|i]))
		{
			state = 3;
			eatInterval = timer + irandom_range(480,960);
		}
	}
	ds_list_clear(drillArray);
}

if(state = 1)
{
	if(timer >= updateTimer)
	{
		target_x = tilemap_get_cell_x_at_pixel(global.Tiles_1,target.x,target.y);
		target_y = tilemap_get_cell_y_at_pixel(global.Tiles_1,target.x,target.y);
		//I dunno why but you need those +16s in the below code because ???
		if(mp_grid_path(global.mp_grid32,myPath,x+16,y+16,(target_x*32)+16,(target_y*32)+16,true) = true)
		{
			path_start(myPath,mySpeed,path_action_stop,false);
		}
		else
		{
			path_end();
		}
		updateTimer = timer + updateInterval;
		if(distance_to_object(obj_ow_player_tank) <= rammingDistance)
		{
			path_end(); //this might cause issues
			state = 2;
		}
	}
}

if(state = 2) //update this attack to have a ramming motion
{
	//rotate towards player 
	//charge forwards w/ damage box in front of it
	//if end run or if box collider confirms, stop grinder 
	//go back to idle
	//later change it to charge slightly AHEAD of the player using the angle to point prediction 
	
	strikeTimer ++;

	if(strikeTimer < windUpTimer)
	{
	direction = point_direction(x+16,y+16,target.x+16,target.y+16);
	damageTrigger = true
	}
	
	if(strikeTimer >= windUpTimer)
	{
		if((strikeTimer < strikeInterval) && tCharge)
		{
			x+=cos(direction*2*pi/360)*chrgeSpd;
			y+=-sin(direction*2*pi/360)*chrgeSpd;
			if(damageTrigger = true)
			{
				collision_rectangle_list(drillCollider.bbox_left,drillCollider.bbox_top,drillCollider.bbox_right,drillCollider.bbox_bottom,obj_ow_rock_parent,false,true,drillArray,false);
				collision_rectangle_list(drillCollider.bbox_left,drillCollider.bbox_top,drillCollider.bbox_right,drillCollider.bbox_bottom,obj_ow_player_tank,false,true,drillArray,false);

				var listLeng = ds_list_size(drillArray);

				for(var i = 0; i < listLeng; i ++)
				{
					if(instance_exists(drillArray[|i]))
					{
						if(drillArray[|i].object_index = obj_ow_player_tank)
						{
							obj_ow_player_tank_sp.damageFlash = true;
							obj_ow_player_tank.HP -= 10;
							obj_ow_camera.shake = true;
							obj_ow_camera.shakeForce = 10;
							obj_ow_camera.centerShake = true;
							damageTrigger = false
						}
						chrgeSpd = 0;
						damageTrigger = false
					}
				}
				ds_list_clear(drillArray);
			}
		}
		else
		{
			state = 1;
			chrgeSpd = chrgeBase;
			damageTrigger = false;
			strikeTimer = 0;
		}
	}
}

if(state = 3)
{
	if(timer >= eatInterval)
	{
		path_end();
		direction = irandom(360);
		state = 0;
	}
}

if(state = 4)
{
	//need animation here 
	instance_destroy();
}