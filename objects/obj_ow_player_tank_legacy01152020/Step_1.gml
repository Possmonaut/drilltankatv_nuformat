//key presses and timers


if(controlPause = false)
{
	timer++;

	//move key detection to make this data easier to collate

	key_up = keyboard_check(vk_up);
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_down = keyboard_check(vk_down);
	key_drill = keyboard_check(vk_space);
	key_brake = keyboard_check(ord("X"));
	key_bomb = keyboard_check_released(ord("F"));
	key_kill = keyboard_check_released(ord("N"));
	key_heat = keyboard_check(ord("H"));

	if(key_kill)
	{
		HP -= 10;
	}
	if(key_heat)
	{
		drillHeat += 1;
	}
	

	//need rotation pause at every 90 as well as decel / accel
	//need speed pause when hitting 0 before reversing as well as decel / accel
	//drill pause / accel / decel

	//if playerHealth <= 0
	//{player death animation. just do an aexplosion for now
	////change player model to wreck
	//do "screen cut out" animation
	//lock out controls
	//after x seconds, move to game over screen

	if(stopPause = false)
	{
		if(key_up)
		{
			decel = false;
			stopTimer = true;
			if(velocity<maxFSpeed){velocity += acc;}

		}

		if(key_down)
		{
			decel = false;
			stopTimer = true;
			if(velocity>maxRSpeed){velocity -= acc;}
		}
	}

	if(velocity = 0 && stopTimer = true) //this creates a very short timing pause between accel && decel
	{
	stopTimerTimer = timer + 20;
	stopTimer = false;
	stopPause = true;
	}

	if(stopTimerTimer <= timer)
	{
		stopPause = false;
	}


	if(rPause = false)
	{
		if(key_left)
		{
		//if(velocity > 4){
			//if(rotateAccel < 2){rotateAccel += 0.005;}
			angleDir += 2;
		}
		/*
		else
		{
			if(rotateAccel < 2){rotateAccel += 0.025;}
			}
			angleDir+=rotateAccel;
			visualSpriteDrill.image_angle +=rotateAccel;
			//if(angleDir = 0 || angleDir = 90 || angleDir = 180 || angleDir = 270){rPause = true; dirTimer = timer + 10;}
		}
		*/
	
		if(key_right)
		{
			angleDir -= 2;
			/*
			if(velocity > 4){
				if(rotateAccel > -2){rotateAccel -= 0.005;}
			}
			else
			{
				if(rotateAccel > -2){rotateAccel -= 0.025;}
			}
		angleDir+=rotateAccel;
		visualSpriteDrill.image_angle -=rotateAccel;
		//if(angleDir = 0 || angleDir = 90 || angleDir = 180 || angleDir = 270){rPause = true; dirTimer = timer + 10;}
		*/
		}
	}

	if(key_bomb)
	{
		if(blastTriggerDelay < timer)
		{
			if(instance_exists(obj_ow_demo_charge))
			{
				//set off blast script, kill the bomb, set up delay
				//scr_blast_13(activeBomb.x, activeBomb.y);
				//instance_destroy(activeBomb);
				var inst = instance_create_depth(activeBomb.x, activeBomb.y, activeBomb.depth,obj_ow_blast_manager);
				inst.target = activeBomb;
				blastTriggerDelay = timer + 60;
			}
			else
			{
				if(instance_exists(obj_ow_bomb_setter))
				{
				 var instDestroy = obj_ow_bomb_setter;
				 var inst = instance_create_depth(instDestroy.x,instDestroy.y,depth,obj_ow_demo_charge);
				 activeBomb = inst;
				 var inst2 = instance_create_depth(activeBomb.x, activeBomb.y, activeBomb.depth,obj_ow_blast_manager);
				 inst2.target = activeBomb;
				 instance_destroy(instDestroy);
				 blastTriggerDelay = timer + 60;
			 
				}
				else
				{
					if(instance_exists(obj_ow_bomb_setter) = false && instance_exists(obj_ow_demo_charge) = false && bombs > 0)
					{
						var inst = instance_create_depth(x, y, depth, obj_ow_bomb_setter);
						inst.angleDir = angleDir;
						bombs -= 1;
						//note: blast should only cost about 5 damage to the player
						//note: have a very slight bounce after hitting an object, just for effect. Only really has to hop up and down
						//here just spawn at angle and make move in direction of angle 
					
					}
				}
			}
		}
	}

	if(rPause = true) //basically just pauses rotation if player rotation is at a 90 angle
	{
		if(dirTimer < timer){rPause = false;}
	}

	if(key_brake){decel = true;}//slam the brakes, but also disengage if accelerating

	if(decel = true){ //decel after brake slam
	
		if(velocity > 0)
		{velocity -= 0.05;
		if(velocity <= 0.1){velocity = 0; decel = false;}
		}
	
		if(velocity < 0)
		{velocity += 0.05;
		if(velocity >= -0.1){velocity = 0; decel = false;}
		}
	}

	if(angleDir > 360)
	{angleDir = 0;}

	if(angleDir < 0)
	{angleDir = 360;}

	if(key_drill)
	{	drillOn = true;
		visualSpriteDrill.blink = true;	
		drillStopTimer ++;
		if(drillStopTimer > 60){drillStopTimer = 60;}
		drillStop = false;
	}
	else
	{
		drillHeat -= 0.20;
		if(drillHeat < 0){drillHeat = 0;}
	}

	if(key_drill = false)
	{
		drillStop = true;
	}

	if(drillStop = true)
	{
		drillStopTimer --;
		if(drillStopTimer < 0){drillStopTimer = 0;}
		if(drillStopTimer = 0)
		{
			drillOn = false;
			visualSpriteDrill.blink = false;
			drillStop = false;
			drillStopTimer = 0;
		}
	}
	}
else
{
	velocity = 0;
}

