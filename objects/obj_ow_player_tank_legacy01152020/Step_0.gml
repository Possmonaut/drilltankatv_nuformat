//general motion

//need to modify code a bit so that you can keep velocity even while smashed against a wall

//image_angle = angleDir + 90;

collisionVeloX= cos(angleDir*2*pi/360)*velocity;
collisionVeloY= -sin(angleDir*2*pi/360)*velocity;

xVelo = velocity;
yVelo = velocity;

if(place_meeting(x + collisionVeloX, y, obj_ow_nopass)){
	while(!place_meeting(x+ collisionVeloX,y,obj_ow_nopass))
	{
		x+=collisionVeloX;
	}
	
	if(xVelo = 3){collision = true;}
	xVelo = 0; //if you want to be able to slide along the wall, you'll need to seperate velocities into 
	//x and y velocities
	againstWall = true;
}

if(place_meeting(x, y + collisionVeloY, obj_ow_nopass)){
	while(!place_meeting(x, y+collisionVeloY,obj_ow_nopass))
	{
		y+=collisionVeloY;
	}
	
	if(yVelo = 3){collision = true;}
	againstWall = true;
	yVelo = 0;
}

x+=cos(angleDir*2*pi/360)*xVelo;
y+=-sin(angleDir*2*pi/360)*yVelo;

//wallcrash code
if(collision = true) //this does shake if we just hit a wall
	{	velocity = 1;
		obj_ow_camera.shake = true;
		obj_ow_camera.shakeForce += 1;
		part_particles_create(global.P_System, x + 16 +  lengthdir_x(16, angleDir), y + 16 + lengthdir_y(16,angleDir), global.rockSpark, 10);
		collision = false;
	}
	
	if(againstWall = true)
	{ if(velocity > 1)
		{
			velocity = 1;

		}
				againstWall = false;
		}
	
if(velocity > rammingSpeed){drillDamage = 3;} //if fast, extra drill damage
	
//creates dust. rebuild this to be a particle effect
if(visualJumptimer <= timer) //you should probably shift the drill position code to the above section when you revamp it for the new drill 
//actually, make it a script then just call it here, and after turning for smoother effect. or have the above resert the jump timer
{
	//produce smoke from two points, the treads, using the lengthdir function		
	if(velocity > 0)
	{
		part_particles_create(global.P_System, x + 16 +  lengthdir_x(16, angleDir-120), y + 16 + lengthdir_y(16,angleDir-120), global.dustPuff, 1);
		part_particles_create(global.P_System, x + 16 +  lengthdir_x(16, angleDir+120), y + 16 + lengthdir_y(16,angleDir+120), global.dustPuff, 1);
	}
	
	if(velocity < 0)
	{
		part_particles_create(global.P_System, x + 16 +  lengthdir_x(16, angleDir-30), y + 16 + lengthdir_y(16,angleDir-30), global.dustPuff, 1);
		part_particles_create(global.P_System, x + 16 +  lengthdir_x(16, angleDir+30), y + 16 + lengthdir_y(16,angleDir+30), global.dustPuff, 1);
	}
	visualJumptimer = timer +10;
}


//biiiiiiiiig chunk of drill code. rework all of this 


	if(drillOn){ //this is the code for digging rocks, yee
		
		
		//if(instance_position(colliderDrill.x + 16, colliderDrill.y + 16, obj_ow_rock_parent) || instance_position(colliderDrill.x + 16, colliderDrill.y + 16, obj_ow_enemy_parent))
		//{part_particles_create(global.P_System, colliderDrill.x + 16, colliderDrill.y + 16, global.rockSpark, 1); drillHeat += 0.25; drilling = true;}
		//else{drilling = false;}
		
		drilling = false;
		
		//check all three positions
		//fill array
		//if no check
		//drilling = false
		if(instance_position(x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir),obj_ow_rock_parent) != noone)
		{
			if(instance_position(x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir),obj_ow_rock_parent) != noone)
			{var target = instance_position(x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir),obj_ow_rock_parent);}
			
			//if(instance_position(x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir),obj_ow_enemy_parent) != noone)
			//{var target = instance_position(x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir),obj_ow_enemy_parent);}
			
			drillArray[0] = target;
			part_particles_create(global.P_System, x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir), global.rockSpark, 1); drillHeat += 0.05;
			drilling = true;
		}
		else
		{
			drillArray[0] = 0;
		}
		
		if(instance_position(x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir),obj_ow_enemy_parent)!= noone)
		{
			if(instance_position(x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir),obj_ow_enemy_parent) != noone)
			{var target = instance_position(x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir),obj_ow_enemy_parent);}
			
			drillArray[0] = target;
			part_particles_create(global.P_System, x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir), global.rockSpark, 1); drillHeat += 0.05;
			drilling = true;
		}
			else
		{
			drillArray[0] = 0;
		}
		
		
		
		
		
		if(instance_position(x + 16 +  lengthdir_x(24, angleDir - 35), y + 16 + lengthdir_y(24,angleDir - 35),obj_ow_rock_parent) != noone|| instance_position(x + 16 +  lengthdir_x(24, angleDir - 35), y + 16 + lengthdir_y(24,angleDir - 35),obj_ow_enemy_parent) != noone)
		{
			if(instance_position(x + 16 +  lengthdir_x(24, angleDir - 35), y + 16 + lengthdir_y(24,angleDir - 35),obj_ow_rock_parent) != noone)
			{var target = instance_position(x + 16 +  lengthdir_x(24, angleDir - 35), y + 16 + lengthdir_y(24,angleDir - 35),obj_ow_rock_parent);}
			
			if(instance_position(x + 16 +  lengthdir_x(24, angleDir - 35), y + 16 + lengthdir_y(24,angleDir - 35),obj_ow_enemy_parent) != noone)
			{var target = instance_position(x + 16 +  lengthdir_x(24, angleDir - 35), y + 16 + lengthdir_y(24,angleDir - 35),obj_ow_enemy_parent);}
			
			drillArray[1] = target;
			part_particles_create(global.P_System, x + 16 +  lengthdir_x(24, angleDir - 35), y + 16 + lengthdir_y(24,angleDir - 35), global.rockSpark, 1); drillHeat += 0.05;
			drilling = true;
		}
		else
		{
			drillArray[1] = 0;
		}
		
		if(instance_position(x + 16 +  lengthdir_x(24, angleDir + 35), y + 16 + lengthdir_y(24,angleDir + 35),obj_ow_rock_parent) != noone || instance_position(x + 16 +  lengthdir_x(24, angleDir + 35), y + 16 + lengthdir_y(24,angleDir + 35),obj_ow_enemy_parent)!= noone)
		{
			if(instance_position(x + 16 +  lengthdir_x(24, angleDir + 35), y + 16 + lengthdir_y(24,angleDir + 35),obj_ow_rock_parent) != noone)
			{var target = instance_position(x + 16 +  lengthdir_x(24, angleDir + 35), y + 16 + lengthdir_y(24,angleDir + 35),obj_ow_rock_parent);}
			
			if(instance_position(x + 16 +  lengthdir_x(24, angleDir + 35), y + 16 + lengthdir_y(24,angleDir + 35),obj_ow_enemy_parent) != noone)
			{var target = instance_position(x + 16 +  lengthdir_x(24, angleDir + 35), y + 16 + lengthdir_y(24,angleDir + 35),obj_ow_enemy_parent);}
			
			drillArray[2] = target;
			part_particles_create(global.P_System, x + 16 +  lengthdir_x(24, angleDir + 35), y + 16 + lengthdir_y(24,angleDir + 35), global.rockSpark, 1); drillHeat += 0.05;
			drilling = true;
		}
		else
		{
			drillArray[2] = 0;
		}
		
		if(drillTimer <= timer)
			 {
				 //damage array position 1
				 //set to next for next timer round
				 //if position is 0, go through the others until find one
				 //then hit that
				 // if all 3 positions are 0
				 //drilling = false, break
				 //if(drillArray[x] = obj_ow_rock_parent || obj_ow_enemy_parent){do thing;}
				 
				 for(var i = 0; i < 3; i ++) //this loop will jump to the next option if the current one is 0
				 {
					 if(drillArray[drillArrayC] = 0 || drillArray[drillArrayC] = -4)
					 {
						 drillArrayC ++;
						 if(drillArrayC > 2){drillArrayC = 0;}
					 }
					 else
					 {
						 i = 3;
					 }
				 } //at the bottom of all of this, drillArrayC will be incrimented
				 
				//if(instance_position(drillArray[drillArrayC].x, drillArray[drillArrayC].y, obj_ow_rock_parent) != noone || instance_position(drillArray[drillArrayC].x, drillArray[drillArrayC].y, obj_ow_enemy_parent != noone))
				if(drillArray[drillArrayC] >0)
				{
					//if(instance_position(drillArray[drillArrayC].x, drillArray[drillArrayC].y, obj_ow_rock_parent) != noone)
					//{ var target = instance_position(drillArray[drillArrayC].x, drillArray[drillArrayC].y, obj_ow_rock_parent);}
					
					//if(instance_position(drillArray[drillArrayC].x, drillArray[drillArrayC].y, obj_ow_enemy_parent) != noone)
					//{ var target = instance_position(drillArray[drillArrayC].x, drillArray[drillArrayC].y, obj_ow_enemy_parent);}
					
					var target = drillArray[drillArrayC];
					debug1 = target;
					if(target = obj_ow_enemy_parent){target.stunned = true;}
					target.HP -= drillDamage;
					if(drillDamage = 3){part_particles_create(global.P_System, target.x +16, target.y +16, global.rockDeath, 8); obj_ow_camera.shakeForce += 2; drillStopTimer -= 40;}
					if(velocity > 2){velocity = 0;}
					part_particles_create(global.P_System, target.x +16, target.y +16, global.rockSpark, 10);
					drillDamage = 1; //reset drillDamage to base
					obj_ow_camera.shake = true;
					target.image_index ++; target.upObj.image_index ++; target.downObj.image_index ++;
					if(target.object_index = obj_ow_superheated_wall){drillHeat += 0.25;} //if we're drilling into lava, gain xtra heat. later, add smoke too
					if(target.HP <= 0){
						instance_destroy(target.upObj);
						instance_destroy(target.downObj); 
						instance_destroy(target.myShadow); 
						part_particles_create(global.P_System, target.x +16, target.y +16, global.rockDeath, 8);
						var xx = tilemap_get_cell_x_at_pixel(global.Tiles_1, target.x+16, target.y+16);
						var yy = tilemap_get_cell_y_at_pixel(global.Tiles_1, target.x+16, target.y+16);
						tilemap_set(global.Tiles_1, 0, xx, yy);
						if(target.object_index = obj_ow_ore_vein){instance_create_depth(target.x, target.y, 0, obj_ow_ore_chunk);}
						if(target.object_index = obj_ow_superheated_wall){tilemap_set(global.Tiles_1, 7, xx, yy);} //leave burny obj
						instance_destroy(target);
						drillArray[drillArrayC] = 0;
						}
				}
				drillTimer = timer + 30;
				drillArrayC ++;
				if(drillArrayC > 2){drillArrayC = 0;}
			 }
		 }
		 else{
			 if(velocity < 3){drillDamage = 1;}
		 }



//if(collision = true)
//{velocity = 0;}

//drill heat and drill functions

if(drillHeat > 100){drillHeat = 100;}

if(drillHeat >= 100)
{	HP -= 0.25; 
	obj_ow_player_tank_sp.damageFlash = true;}

if(instance_position(x+16,y+16,obj_ow_superheated_floor))
{
	HP -= 0.25;
	drillHeat += 0.25;
	obj_ow_player_tank_sp.damageFlash = true;
}

if(drilling = false){drillHeat -= 0.1;}
if(drillHeat < 0){drillHeat = 0;}