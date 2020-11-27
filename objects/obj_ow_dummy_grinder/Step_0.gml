//states
//0 = idle wander
//1 = chasing
//2 = attacking 
//3 = eating
//4 = death

timer ++;

/*

//if(state != 2){visualSp.mDir = direction;}
if(state = 1 || state = 2)
{
visualSp.mDir = point_direction(x,y,target.x,target.y);
}
else
{
	visualSp.mDir = direction;
}
visualSp.x = x + 16;
visualSp.y = y + 16;
if(instance_exists(nlosPing))
{
	if(nlosPing.image_alpha <= 0)
	{
		nlosPing.x = x+16;
		nlosPing.y = y+16;
	}
}

if(instance_exists(obj_ow_blast_manager)) // here is where we detect explosions
{
	if(distance_to_object(obj_ow_blast_manager) < 96)
	{
		state = 1;
	}
}

if(collision_line(x+16,y+16,target.x+14,target.y+14,obj_ow_nopass,false,true) = noone)
{
	activeDraw=1;
	if(instance_exists(nlosPing)){
	nlosPing.image_alpha = 0;
	}
}
else
{
	activeDraw=0;
}

/*
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
*/

if(death2 = true)
	{
		if(HP <= 0)
		{
			//create chunk particles 
			//stop drawing death sprite
			//stop drawing ALL sprites
			//remove collisions by changing collision sprites to n/a
			sprite_index = noone;
			mask_index = noone;
			activeDraw = 0;
		}
	}

if(HP <= 0 || death = true)
{
	state = 4;
	if(instance_exists(nlosPing)){instance_destroy(nlosPing);}
	exit;
}


drillCollider.x = x + 16 + lengthdir_x(atkdist,visualSp.mDir);
drillCollider.y = y + 16 + lengthdir_y(atkdist,visualSp.mDir);


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
	x+=cos(direction*2*pi/360)*mySpeed;
	y+=-sin(direction*2*pi/360)*mySpeed;
	
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
	}
	if(visualSp.mMove != true)
	{
		path_speed = 0;
	}
	else
	{
		path_speed = 1;
	}
	if(distance_to_object(obj_ow_player_tank) <= rammingDistance)
	{
		path_end(); //this might cause issues
		state = 2;
	}
	
	
}

if(state = 2) //update this attack to have a ramming motion
{

mDir = point_direction(x,y,target.x,target.y);
	
	strikeTimer ++;
	

	if(strikeTimer < windUpTimer)
	{
	damageTrigger = true
	visualSp.myBod= sp_grinder_attack;
	visualSp.atkIndex = strikeTimer /3.75; 
	}
	
	if(strikeTimer >= windUpTimer)
	{
		if((strikeTimer < strikeInterval))
		{
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
			visualSp.myBod = sp_grinder_body;
			//visualSp.image_speed = 0;
			visualSp.atkIndex = 0;
		}
	}
}

if(state = 3)
{
	visualSp.myBod= sp_grinder_attack;
	visualSp.atkIndex += 0.1;
	
	if(timer >= eatInterval)
	{
		path_end();
		direction = irandom(360);
		state = 0;
		visualSp.myBod = sp_grinder_body;
		visualSp.atkIndex = 0;
	}
}

if(state = 4)
{
	//need animation here 
	//instance_destroy();
	death = true;
}

state = 5;