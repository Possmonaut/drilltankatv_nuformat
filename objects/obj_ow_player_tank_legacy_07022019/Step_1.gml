timer ++;

if(keyboard_check(vk_up) = true && stopPause = false)
{
	decel = false;
	stopTimer = true;
	if(forwardSpeed < 3 && turning = false)
	{
		forwardSpeed += 0.025;
		if(forwardSpeed > 3){forwardSpeed = 3;}
	}

}

if(keyboard_check(vk_down) = true && stopPause = false)
{
	decel = false;
	stopTimer = true;
	if(forwardSpeed > -1 && turning = false)
	{
		forwardSpeed -= 0.025;
		if(forwardSpeed < -1){forwardSpeed = -1;}
	}
}

if(keyboard_check(vk_right)&& keyOff)
{
	if(forwardSpeed < 2)
	{	keyOff = false;
		
		if(turnTimer <= timer)
		{	turning = 1;
			turnTimer = timer + 60;	
		}
	}
}

if(keyboard_check(vk_left)&& keyOff)
{
	if(forwardSpeed < 2)
	{	keyOff = false;
		
		if(turnTimer <= timer)
		{	turning = 2;
			turnTimer = timer + 60;
		}
	}
}

if(keyboard_check(vk_space))
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

if(keyboard_check_released(vk_space))
{
	drillStop = true;
}

if(drillStop = true)
{
	drillStopTimer --;
	if(drillStopTimer = 0)
	{
		drillOn = false;
		visualSpriteDrill.blink = false;
		drillStop = false;
		drillStopTimer = 0;
	}
}

//here's the bomb launcher
/*
if keyboard check F released
if(instance ecists bomb)
{run script that damages each swaure under bomb aoe, delay, return}
if(nobomb and nosetter)
create setter with x / y or current dir and facing of current dir (always launch from front)
if(instance exists setter){return}

note: need a delay between blast and launching new bomb but not between launching bomb and explosion.
*/
if(keyboard_check_released(ord("F")))
{
	if(blastTriggerDelay < timer)
	{
		if(instance_exists(obj_ow_demo_charge))
		{
			//set off blast script, kill the bomb, set up delay
			scr_blast_13(activeBomb.x, activeBomb.y);
			instance_destroy(activeBomb);
			blastTriggerDelay = timer + 60;
		}
		else
		{
			if(instance_exists(obj_ow_bomb_setter))
			{}
			else
			{
				if(instance_exists(obj_ow_bomb_setter) = false && instance_exists(obj_ow_demo_charge) = false && turning = 0)
				{
	//doin' the below garbage code so it won't spawn on top of the tank cuz we plan on giving the bomb
	//collision later. also, can probably make the below code into a script of some sort
					if(dir = 0) //up
					{
					var inst = instance_create_depth(x,y,depth,obj_ow_bomb_setter);
					inst.facing = dir;
					inst.yPlus = -32;
					}
					if(dir = 2) //down
					{
					var inst = instance_create_depth(x,y,depth,obj_ow_bomb_setter);
					inst.facing = dir;
					inst.yPlus = 32;
					}
					if(dir = 1) //right
					{
					var inst = instance_create_depth(x,y,depth,obj_ow_bomb_setter);
					inst.facing = dir;
					inst.xPlus = 32;
					}
					if(dir = 3) //left
					{
					var inst = instance_create_depth(x,y,depth,obj_ow_bomb_setter);
					inst.facing = dir;
					inst.xPlus = -32;
					}
				}
			}
		}
	}
}



if(keyboard_check(ord("X"))){decel = true;}//slam the brakes, but also disengage if accelerating

if(decel = true){ //decel after brake slam
	
	if(forwardSpeed > 0)
	{forwardSpeed -= 0.050;
	if(forwardSpeed <= 0.10){forwardSpeed = 0; decel = false;}
	}
	
	if(forwardSpeed < 0)
	{forwardSpeed += 0.050;
	if(forwardSpeed >= -0.10){forwardSpeed = 0; decel = false;}
	}
}

if(keyboard_check_released(vk_left) || keyboard_check_released(vk_right)) {keyOff = true;}
if((turnTimer + 15) <= timer){keyOff = true;} //this and the above gives a delay while turning

if(forwardSpeed = 0 && stopTimer = true) //this creates a very short timing pause between accel && decel
{
stopTimerTimer = timer + 20;
stopTimer = false;
stopPause = true;
}

if(stopTimerTimer <= timer)
{
	stopPause = false;
}