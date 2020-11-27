//run the data for states and calculate paths 
//state:
//0 = nothing (listening)
//1 = swipe
//2 = emerge
//3 = chase
//4 = return
//5 = settle
//6 = death

timer ++;

var startPX = x + 16+ lengthdir_x(16,cDur);
var startPY = y +16+ lengthdir_y(16,cDur);

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
		if(state != 3 && state != 2)
		{
		state = 1; //changeb back to 1 
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
		var tPoint = point_direction(startPX,startPY,target.x+14,target.y+14);
		var stX = startPX+lengthdir_x(rammingDistance,tPoint-45);
		var stY = startPY+lengthdir_y(rammingDistance,tPoint-45);
		var enX = startPX+lengthdir_x(rammingDistance,tPoint+45);
		var enY = startPY+lengthdir_y(rammingDistance,tPoint+45);
		if(pullBack == false)
		{
			endpointX = approach(endpointX,stX,swipeSpd);
			endpointY = approach(endpointY,stY,swipeSpd);
			if((endpointX == stX && endpointY == stY) && swipeTimer >= 90){pullBack = true;}
		}
		else
		{
		endpointX = approach(endpointX,enX,swipedSpd);
		endpointY = approach(endpointY,enY,swipedSpd);
		
		if(target.visualSpriteTank.damageFlash = false) //this codeblock is shit but whatever
		{
			if(collision_line(stX,stY,enX,enY,target,false,true) != noone){
				target.HP -= 5;
				target.visualSpriteTank.damageFlash = true;}
			var stX = startPX+lengthdir_x(rammingDistance+8,tPoint-45);
			var stY = startPY+lengthdir_y(rammingDistance+8,tPoint-45);
			var enX = startPX+lengthdir_x(rammingDistance+8,tPoint+45);
			var enY = startPY+lengthdir_y(rammingDistance+8,tPoint+45);
			if(collision_line(stX,stY,enX,enY,target,false,true) != noone){
				target.HP -= 5;
				target.visualSpriteTank.damageFlash = true;}
			var stX = startPX+lengthdir_x(rammingDistance-8,tPoint-45);
			var stY = startPY+lengthdir_y(rammingDistance-8,tPoint-45);
			var enX = startPX+lengthdir_x(rammingDistance-8,tPoint+45);
			var enY = startPY+lengthdir_y(rammingDistance-8,tPoint+45);
			if(collision_line(stX,stY,enX,enY,target,false,true) != noone){
				target.HP -= 5;
				target.visualSpriteTank.damageFlash = true;}
			var stX = startPX+lengthdir_x(rammingDistance+8,tPoint-45);
			var stY = startPY+lengthdir_y(rammingDistance+8,tPoint-45);
			var enX = startPX+lengthdir_x(rammingDistance+8,tPoint+45);
			var enY = startPY+lengthdir_y(rammingDistance+8,tPoint+45);
			
				var r = random_range(0.9,1.3);
				var b = audio_play_sound(so_damage,1,false);
				audio_sound_gain(b,0.5,0);
				audio_sound_pitch(b,r);
		}
		
		if((endpointX == enX && endpointY == enY) || swipeTimer >= 120)
			{
			pullBack = false;
			swipeTimer = 0;
				
			if(fullEmerge != true){
				state = 2;
				}else{state = 3;}
			}
		}
	}
}

if(state = 2) //emerging 
{
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
	
	if(distance_to_object(obj_ow_player_tank) <= rammingDistance)
	{
		path_speed = 0; //this might cause issues
		state = 1; //change back to 1;
	}
}

if(comeBack = true)
{
	state = 4;	
}

if(state = 4)
{
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
	
	if(!pullT)//if(visualSp.mMove != true)
	{
		path_speed = 0;
	}
	else
	{
		path_speed = 1;
	}
	
	if(distance_to_object(target) <= rammingDistance)
	{
		path_speed = 0; //this might cause issues
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
		path_end();
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
	animInterval = sprite_get_number(sp_mimic_emerge) / 120;
	animTimer -= animInterval;
	buttScale -= 1.25/120;
	visualSp.image_xscale -= 0.25/120;
	visualSp.image_yscale -= 0.25/120;
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