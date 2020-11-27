ringCollider1.x = x + 16;
ringCollider1.y = y + 16;
ringCollider2.x = x + 16;
ringCollider2.y = y + 16;
ringCollider3.x = x + 16;
ringCollider3.y = y + 16;
ringCollider4.x = x + 16;
ringCollider4.y = y + 16;
ringCollider5.x = x + 16;
ringCollider5.y = y + 16;

ringCollider6.x = x + 16;
ringCollider6.y = y + 16;
ringCollider7.x = x + 16;
ringCollider7.y = y + 16;
ringCollider8.x = x + 16;
ringCollider8.y = y + 16;
ringCollider9.x = x + 16;
ringCollider9.y = y + 16;
ringCollider10.x = x + 16;
ringCollider10.y = y + 16;

if(turning = 0){
	if(jumpTimer <= timer || accelTimer <= timer) //this makes sure the jumpTimer doesn't do anynthing stupid
	{
		if(forwardSpeed > 0)
		{
			if(dir = 0){y -= movespeed; facing = 0;} //up
			if(dir = 2){y += movespeed; facing = 2;} //down
			if(dir = 1){x += movespeed; facing = 1;} //right
			if(dir = 3){x -= movespeed; facing = 3;} //left
			if(againstWall != 0){
				if(forwardSpeed > 1){forwardSpeed = 1;} //if against wall, set speed to 1
				againstWall = 0;}
			jumpTimer = timer + (30 / (forwardSpeed * 1)); //base speed accelerator
			accelTimer = timer + 90; //if speed below 200 frame threshold, set to 200 frame threshold
			debug1 = jumpTimer - timer; //debug1
		}
		if(forwardSpeed < 0) //test code for moving backwards
		{
			if(dir = 0){y += movespeed; facing = 2;} //up
			if(dir = 2){y -= movespeed; facing = 0;} //down
			if(dir = 1){x -= movespeed; facing = 3;} //right
			if(dir = 3){x += movespeed; facing = 1;} //left
			jumpTimer = timer + (30 / (forwardSpeed * -1));
			accelTimer = timer + 90;
			debug1 = jumpTimer - timer;
		}
	}
}
else
{
	//change the sprite_index to the turning sprite, frame speed to  0 though I think it's already at that
	//modify the frames below
	turningTimer ++;
	obj_ow_player_tank_sp.sprite_index = sp_tank_rotate_test2;
	obj_ow_player_tank_sp.image_index = rotateFrame;
	obj_ow_player_tank_sp.image_speed = 0;
	if(turning = 1)
	{	if(visualTurningTimer <= turningTimer){
		spriteRotate -= 18; //add back in if you change the sprite to a flat sprite
		rotateFrame ++;
		if(rotateFrame > 15){rotateFrame = 0;}
		obj_ow_player_tank_sp.image_index = rotateFrame;
		visualTurningTimer = turningTimer + 15;
			}
	}
	if(turning = 2)
	{	if(visualTurningTimer <= turningTimer){
		spriteRotate += 18; //add back in if you change the sprite to a flat sprite
		rotateFrame --;
		if(rotateFrame < 0){rotateFrame = 15;}
		obj_ow_player_tank_sp.image_index = rotateFrame;
		visualTurningTimer = turningTimer + 15;
			}
	}
	if(turningTimer >= 60)
	{
		if(turning = 1)
		{
			if(dir = 3){dir = 0;}
			else {dir++;}
			spriteRotate -= 18;
			//visualSpriteTank.image_angle = 0;
		}
		if(turning = 2)
		{
			if(dir = 0){dir = 3;}
			else {dir--;}
			spriteRotate += 18;
			//visualSpriteTank.image_angle = 0;
		}
		turningTimer = 0;
		visualTurningTimer = 0;
		turning = 0;
		if(dir = 0){ obj_ow_player_tank_sp.vibFrame = 6;} //up 6/7 //this resets the frame data for the sprite
		if(dir = 2){ obj_ow_player_tank_sp.vibFrame = 4;} //down 4/5
		if(dir = 1){ obj_ow_player_tank_sp.vibFrame = 2;} //right 2/3
		if(dir = 3){ obj_ow_player_tank_sp.vibFrame = 0;} //left 0/1
		obj_ow_player_tank_sp.nextFrame = 0; //this too 
	}
}

	if(collision = true && againstWall != 0) //this does shake if we just hit a wall
	{obj_ow_camera.shake = true;
		obj_ow_camera.shakeForce += 1;
		if(dir = 0){part_particles_create(global.P_System, x + 16, bbox_top, global.rockSpark, 10);}
		if(dir = 2){part_particles_create(global.P_System, x + 16, bbox_bottom, global.rockSpark, 10);}
		if(dir = 1){part_particles_create(global.P_System, bbox_right, y + 16, global.rockSpark, 10);}
		if(dir = 3){part_particles_create(global.P_System, bbox_left, y + 16, global.rockSpark, 10);}
		collision = false;
		againstWall = 0;
	}

if(visualJumptimer <= timer) //you should probably shift the drill position code to the above section when you revamp it for the new drill 
//actually, make it a script then just call it here, and after turning for smoother effect. or have the above resert the jump timer
{
	visualSpriteDrill.x = x +16;
	visualSpriteDrill.y = y + 16;
	visualSpriteTank.x = x + 16; //updates the tank sprite position
	visualSpriteTank.y = y + 16;
			
	if(forwardSpeed != 0){ //this makes the dust
		if(facing = 0){instance_create_depth(visualSpriteTank.x-16, visualSpriteTank.y +16, depth, obj_ow_dust_cloud);}
		if(facing = 2){instance_create_depth(visualSpriteTank.x-16, visualSpriteTank.y -48, depth, obj_ow_dust_cloud);}
		if(facing = 1){instance_create_depth(visualSpriteTank.x-48, visualSpriteTank.y-16, depth, obj_ow_dust_cloud);}
		if(facing = 3){instance_create_depth(visualSpriteTank.x+16, visualSpriteTank.y-16, depth, obj_ow_dust_cloud);}
	}
	visualJumptimer = timer +30;
}

//make it so that it ckecks for collision with stuff below

if(forwardSpeed > rammingSpeed){drillDamage = 3;} //if fast, extra drill damage

if(facing = 2) //go down
{
	//var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom) & tile_index_mask;
	//var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) & tile_index_mask; 
	var t1 = position_meeting(bbox_left, bbox_bottom, obj_ow_nopass_player);
	var t2 = position_meeting(bbox_right, bbox_bottom, obj_ow_nopass_player);
	
	if (t1 != 0 || t2 != 0)
	{
	 y = ((bbox_bottom & ~ 31) - 1) - sprite_bbox_bottom;
	 		if(forwardSpeed > 2){
			collision = true; 
		}
		againstWall ++;
	}
}

if(facing = 0) //go up
{	
	var t1 = position_meeting(bbox_left, bbox_top, obj_ow_nopass_player);
	var t2 = position_meeting(bbox_right, bbox_top, obj_ow_nopass_player);
	
	if (t1 != 0 || t2 != 0)
	{
	 y = ((bbox_top + 32) & ~ 31) - sprite_bbox_top;
	 		if(forwardSpeed > 2){
			collision = true; 
		}
		againstWall ++;
	}
}


if(facing = 1) //go right
{
	var t1 = position_meeting(bbox_right, bbox_top, obj_ow_nopass_player);
	var t2 = position_meeting(bbox_right, bbox_bottom, obj_ow_nopass_player);
	
	if (t1 != 0 || t2 != 0)
	{
	 x = ((bbox_right & ~ 31) - 1) - sprite_bbox_right;
			if(forwardSpeed > 2){
			collision = true; 
		}
		againstWall ++;
	} 
}

if(facing = 3) //go left
{
	var t1 = position_meeting(bbox_left, bbox_top, obj_ow_nopass_player);
	var t2 = position_meeting(bbox_left, bbox_bottom, obj_ow_nopass_player);
	
	if (t1 != 0 || t2 != 0)
	{
	 x = ((bbox_left + 32) & ~ 31) - sprite_bbox_left;	
		if(forwardSpeed > 2){
			collision = true; 
		}
		againstWall ++;
	}
}

if(dir = 0){colliderDrill.x = x; colliderDrill.y = y - 32;} //up
if(dir = 2){colliderDrill.x = x; colliderDrill.y = y +32;} //down
if(dir = 1){colliderDrill.x = x +32; colliderDrill.y = y;} //right
if(dir = 3){colliderDrill.x = x - 32; colliderDrill.y = y;} //left

if(turning = 0){
	if(drillOn){ //this is the code for digging rocks, yee
		if(instance_position(colliderDrill.x + 16, colliderDrill.y + 16, obj_ow_rock) || instance_position(colliderDrill.x + 16, colliderDrill.y + 16, obj_ow_enemy_parent))
		{part_particles_create(global.P_System, colliderDrill.x + 16, colliderDrill.y + 16, global.rockSpark, 1); drillHeat += 0.25; drilling = true;}
		else{drilling = false;}
		if(drillHeat > 100){drillHeat = 100;}
		if(drillTimer <= timer)
			 {
				if(instance_position(colliderDrill.x + 16, colliderDrill.y + 16, obj_ow_rock) || instance_position(colliderDrill.x + 16, colliderDrill.y + 16, obj_ow_enemy_parent))
				{
					if(instance_position(colliderDrill.x + 16, colliderDrill.y + 16, obj_ow_rock) != noone)
					{var target = instance_position(colliderDrill.x + 16, colliderDrill.y + 16, obj_ow_rock)}
					else
					{var target = instance_position(colliderDrill.x + 16, colliderDrill.y + 16, obj_ow_enemy_parent);
						target.stunned = true;
						}
					target.HP -= drillDamage;
					if(drillDamage = 3){part_particles_create(global.P_System, target.x +16, target.y +16, global.rockDeath, 8); obj_ow_camera.shakeForce += 2; drillStopTimer -= 40;}
					if(forwardSpeed > 2){forwardSpeed = 1;}
					part_particles_create(global.P_System, target.x +16, target.y +16, global.rockSpark, 10);
					drillDamage = 1; //reset drillDamage to base
					obj_ow_camera.shake = true;
					target.image_index ++; target.upObj.image_index ++; target.downObj.image_index ++;
					if(target.HP <= 0){
						instance_destroy(target.upObj);
						instance_destroy(target.downObj); 
						instance_destroy(target.myShadow); 
						part_particles_create(global.P_System, target.x +16, target.y +16, global.rockDeath, 8);
						instance_destroy(target);}
					againstWall ++;
				}
				drillTimer = timer + 30;
			 }
		 }
		 else{
			 if(forwardSpeed < rammingSpeed){drillDamage = 1;}
		 }
}


if(collision = true)
{forwardSpeed = 1;}

if(drilling = false){drillHeat -= 0.10;}
if(drillHeat < 0){drillHeat = 0;}