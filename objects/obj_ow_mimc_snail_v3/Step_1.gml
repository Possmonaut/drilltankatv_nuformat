//run the data for states and calculate paths 
//state:
//0 = nothing (listening)
//1 = swipe Tendril "bite" from under shell using pincers
//2 = emerge
//3 = chase
//4 = return
//5 = settle
//6 = death

timer ++;

var startPX = x + 16+ lengthdir_x(16,myDir);
var startPY = y +16+ lengthdir_y(16,myDir);

//if we're not in LOS or nlosPing alpha is 0, move nlosPing to current location
//also do not show nlosping if state is hidden

//if we're hidden and get blasted, wake up 
if(instance_exists(obj_ow_blast_manager) && state = 0)
{
	if(distance_to_object(obj_ow_blast_manager) < 96)
	{
		//if emerged, state = 2, else, state = 3
		state = 2;
	}
}

//determines if we draw the nlosPing if a) revealed to the player and b) do not have LOS to player
if(collision_line(x+16,y+16,target.x+14,target.y+14,obj_ow_nopass,false,true) = noone && state > 1)
{
	activeDraw=1;
}
else
{
	activeDraw=0;
}

//for playing death animations
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


//removes nlosping when dead and also keeps the below code from running if dead
if(HP <= 0 || death = true)
{
	state = 6;
	exit;
}

//if player is close enough to attack and we have line of sight to them, ambush attack
if(distance_to_object(obj_ow_player_tank) <= detectRange)
{
	if(collision_line(x+16,y+16,target.x+14,target.y+14,obj_ow_nopass_enemy,false,true) = noone)
	{
		if(state != 1 && state != 2)
		{
		state = 3; //changeb back to 1 
		}
	}
}
else //if the player is too far away from the snail, begin losing interest
{
	if(state != 0 && state != 4 && state != 5)
	{
		chaseTimer --;
		if(chaseTimer <= 0){
			state = 4; //change back to 4 
			chaseTimer = chaseTimerInterval;}
	}
}

if(state = 0) //do nothing
{
	endpointX = x+16;
	endpointY = y+16;
	armScale = 0;
	reachLength = 1;
	//state = 3;
}

if(state = 1) //attack
{
	if(!emerged)
	{
		armScale = 1;
		emerged = true;
		reachLength =reachStor;
		//shed rocks or something 
	}
	else
	{
		swipeTimer++;
		cDur = point_direction(x+16,y+16,target.x+14,target.y+14);
		myDir = cDur;
		//pincerL.image_angle = cDur + 45;
		//pincerR.image_angle = cDur - 45;
		if(pullBack == false)
		{
			//open jaws until they reach point
			//wait
			//pullback = true
			if(pincerL.image_xscale != jawSize)
			{
				pincerL.image_xscale += 0.025;
				pincerL.image_yscale += 0.025;
				pincerR.image_xscale += 0.025;
				pincerR.image_yscale += 0.025;
			}
			if(swipeTimer < 30)
			{
			jawAngGain += 2;
			pincerL.image_angle = myDir + jawAngGain;
			pincerR.image_angle = myDir - jawAngGain;
			}
			if(swipeTimer > 60)
			{
				pullBack = true;
				jawAngGain = 0;
			}
			
		}
		else
		{
		jawAngGain -= 4;
		pincerL.image_angle = myDir + jawAngGain;
		pincerR.image_angle = myDir - jawAngGain;
		if(target.visualSpriteTank.damageFlash = false) //replace this with a generic block spawn used as a collision checker like in the cTank
		{
				if(swipeTimer = 75)
				{
					cDur = point_direction(x+16,y+16,target.x+14,target.y+14);
					atkCollider = instance_create_depth(x,y,depth-1,obj_ow_mimc_snail_strike);
					atkCollider.progen = id;
					atkCollider.x = x+16+lengthdir_x(24,myDir);
					atkCollider.y = y+16+lengthdir_y(24,myDir);
					atkCollider.image_angle = myDir;
				}
		}
		
		//stop jaws after their angle hits a point
		if(swipeTimer >= 90)
			{
			pullBack = false;
			swipeTimer = 0;
			jawAngGain = 0;
			if(instance_exists(atkCollider))
			{
			instance_destroy(atkCollider);
			}
				
			if(fullEmerge != true){
				state = 2;
				}else{state = 3;}
			}
		}
	}
}

if(state = 2) //emerging 
{
	dustTimer ++;
	if(dustTimer > 5)
	{
		var dist = irandom_range(16,32);
		var dDir = irandom(359);
		for(var i = 0; i < 4; i ++)
		{
			var _x = x+16+lengthdir_x(dist,dDir + (i*90));
			var _y = y+16+lengthdir_y(dist,dDir + (i*90));
			part_particles_create(global.P_System,_x,_y,global.dustPuff,1);
		}
		dustTimer = 0;
	}
	
	
	visualSp.sprite_index = sp_mimic_emerge;
	animInterval = sprite_get_number(sp_mimic_emerge) / 120;
	animTimer += animInterval;
	buttScale += 1.25/120;
	visualSp.image_xscale += 0.25/120;
	visualSp.image_yscale += 0.25/120;
	if(animTimer >= sprite_get_number(sp_mimic_emerge))
	{
	state = 3;
	fullEmerge = true;
	animTimer = 0;
	animInterval = 0;
	}
	else
	{
	visualSp.image_index = animTimer;
	}
}

if(state = 3)
{
	/*
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
	
	if(!pullT)//if(visualSp.mMove != true)
	{
		path_speed = 0;
	}
	else
	{
		path_speed = 1;
	}
	
	//if(distance_to_object(obj_ow_player_tank) <= rammingDistance)
	//{
	//	path_speed = 0; //this might cause issues
	//	state = 1; //change back to 1;
	//}
	 */
}

if(comeBack = true)
{
	state = 4;	
	cDur = point_direction(x+16,y+16,startX,startY);
	myDir = cDur;
}

if(state = 4)
{
	/*
if(timer >= updateTimer)
	{
		//if(mp_grid_path(global.mp_grid32,myPath,x,y,progen.x,progen.y,true) = true) //use this once spawner is in
		if(mp_grid_path(global.mp_grid32,myPath,x,y,startX,startY,true) = true)
		{
			path_start(myPath,mySpeed,path_action_stop,false);
		}
		else
		{
			path_end();
		}
		updateTimer = timer + updateInterval;
	}
	*/
	//new code
	cDur = point_direction(x+16,y+16,startX,startY);
	
	
	if(!pullT)//if(visualSp.mMove != true)
	{
		if(cDashSpd > 0.1)
		{
		cDashSpd -= cDashLoss;
		x+=cos(myDir*2*pi/360)*cDashSpd;
		y+=-sin(myDir*2*pi/360)*cDashSpd;
		}
	}
	else
	{
		var slow = 1;
		if(point_distance(x+16,y+16,startX,startY) < 128)
		{
			slow = 0.85;
			myDir = cDur;
		}
		
		if(cDashSpd < dashSpd)
		{
			cDashSpd += cDashGain;
		}
		x+=cos(myDir*2*pi/360)*(cDashSpd*slow);
		y+=-sin(myDir*2*pi/360)*(cDashSpd*slow);
	}
	//new code
	if(distance_to_object(target) <= rammingDistance)
	{
		//path_speed = 0;
		state = 1; //change back to 1;
	}
	
	//if(x==progen.x && y ==progen.y) //put this back in
	if(x>startX-1 && x<startX+1)
	{
		x =startX;
	}
	if(y>startY-1 && y<startY+1)
	{
		y=startY;
	}

	if(x==startX && y==startY)
	{
		//path_end();
		state = 5;
		visualSp.sprite_index = sp_mimic_emerge;
		visualSp.image_index = sprite_get_number(sp_mimic_emerge);
		animTimer = sprite_get_number(sp_mimic_emerge);
	}
}

if(state = 5)
{
	///*
	//visualSp.sprite_index = sp_mimic_emerge;
	//shrink jaws and curl them into a certain position
	
	dustTimer ++;
	if(dustTimer > 5)
	{
		var dist = irandom_range(16,32);
		var dDir = irandom(359);
		for(var i = 0; i < 4; i ++)
		{
			var _x = x+16+lengthdir_x(dist,dDir + (i*90));
			var _y = y+16+lengthdir_y(dist,dDir + (i*90));
			part_particles_create(global.P_System,_x,_y,global.dustPuff,1);
		}
		dustTimer = 0;
	}
	
	animInterval = sprite_get_number(sp_mimic_emerge) / 120;
	animTimer -= animInterval;
	buttScale -= 1.25/120;
	visualSp.image_xscale -= 0.25/120;
	visualSp.image_yscale -= 0.25/120;
				if(pincerL.image_xscale != 0)
			{
				pincerL.image_xscale -= 0.025;
				pincerL.image_yscale -= 0.025;
				pincerR.image_xscale -= 0.025;
				pincerR.image_yscale -= 0.025;
			}
	if(animTimer <= 0)
	{
	//*/
	state = 0;
	fullEmerge = false;
	animTimer = 0;
	animInterval = 0;
	emerged = false;
	buttScale = 0;
	visualSp.image_xscale = 1;
	visualSp.image_yscale = 1;
	///*
	}
	else
	{
	visualSp.image_index = abs(floor(animTimer));
	}
	//*/
}

if(state = 6) //hp has been fully drained 
{
	//begin death animations 
	//instance_destroy();
	death = true;
}