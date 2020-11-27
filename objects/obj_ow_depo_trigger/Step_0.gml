//later: add in repair arm sprite + animation to repair while space is pressed.
//let players drive through the depo from one side to the other. one side takes ores, the other repairs

if(distance_to_object(target) > checkDist)
{
	exit;
}

timer ++;


keySpace = keyboard_check(vk_space);
keySpaceRelease = keyboard_check_released(vk_space);
keyUp = keyboard_check_released(vk_up);
keyDown = keyboard_check_released(vk_down);

if(collision_line(x,y+midY,x+sprite_width,y+midY,target,false,true) != noone) //instance_position(x + midX, y + midY, target)
{
	if(target.ore > 0) //this exchanges ore for money
	{
		oreLoss = target.ore;
		obj_save_boy.triggerList[|13] += oreLoss;
		target.ore -= oreLoss;
		target.paycheck += oreLoss * 10;
		obj_save_boy.triggerList[|15] += oreLoss * 10;
		shake = false;
		var b = audio_play_sound(so_loader_beep,1,false);
		audio_sound_gain(b,0.5,0);
	}
	onDepo = true;
	//buttonArray = 0;
}
else
{
onDepo = false;	
}

//

if(onDepo = true)
{
	if(keySpaceRelease = true && buttonArray = 0 && !docked) //docks and saves, shifts button to 1
	{
		var b = audio_play_sound(so_depot_dock,1,false);
		audio_sound_gain(b,0.5,0);
		target.controlPause = true;
		docked = true;
		buttonArray = 1;
		saveComplete = false; //first time dock, make a save
		
	}
	if(docked) //also lerp towards cardinal direction
	{
		saveTrigger = true; //we're docked, set save trigger to true
		
		target.velocity = 0;
		
		var tX = target.sprite_width /2;
		var tY = target.sprite_height /2;
		var xx = sprite_width /2;
		var yy = sprite_height /2;
		
		if(target.x + tX != x + xx)
		{
		target.x += (x + xx - target.x - tX) * armSpeed;
		}
	
		if(target.y +tY != y + yy)
		{
		target.y += (y + yy - target.y -tY) * armSpeed;
		}
		
		myArm.targetList[# 0,0] = target.x;
		myArm.targetList[# 0,1] = target.y;
		myArm.targetList[# 1,0] = target.x + target.sprite_width;
		myArm.targetList[# 1,1] = target.y;
		myArm.targetList[# 2,0] = target.x;
		myArm.targetList[# 2,1] = target.y + target.sprite_height;
		myArm.targetList[# 3,0] = target.x + target.sprite_width;
		myArm.targetList[# 3,1] = target.y + target.sprite_height;
		
		if(keySpace = true && buttonArray = 1)
		{
			if(target.HP < target.HPMax && target.paycheck > 0)
			{
				myArm.keySpace = true
				if(repairTimer <= timer && myArm.waitTimer !=0)
				{
					if(target.paycheck != 0)
					{
					target.paycheck --;
					target.HP ++;
					repairTimer = timer + 5;
					}
				}
			}
			else
			{
				myArm.keySpace = false;
			}
		}

		
		if(keySpaceRelease = true && buttonArray = 2)
		{
			if(target.paycheck - 10 >= 0 && target.bombs != target.bombMax)
			{
			if(repairTimer <= timer)
				{
					target.paycheck -= 10;
					target.bombs += 1;
					repairTimer = timer + 30;
					var b = audio_play_sound(so_ore_grab,1,false);
					audio_sound_gain(b,0.25,0);
					audio_sound_pitch(b,1.5);
				}
			}
		}
		if(keySpaceRelease = true && buttonArray = 3)
		{
			buttonArray = 0;
			docked = false;
			target.controlPause = false;
			saveComplete = false; //do a save real quick
		}
	}
}

if(onDepo = true && keyUp = true && docked = true)
{
	if(buttonArray > 1)
	{
		buttonArrayActive[buttonArray] = 0;
		buttonArray --;
		buttonArrayActive[buttonArray] = 1;
	}
}

if(onDepo = true && keyDown = true && docked = true)
{
	if(buttonArray < 3)
	{
		buttonArrayActive[buttonArray] = 0;
		buttonArray ++;
		buttonArrayActive[buttonArray] = 1;
	}
}

if(saveTrigger = true && saveComplete = false)
{
	
	var tX = target.sprite_width /2;
	var tY = target.sprite_height /2;
	//turn the below into a save script 
	obj_save_boy.triggerList[|1] = 1; //depot to spawn at. 0 = elevator. 1 = first depot, etc
	obj_save_boy.triggerList[|2] = room; //room to spawn in
	obj_save_boy.triggerList[|3] = x+midX-tX; //x of the depot to spawn in
	obj_save_boy.triggerList[|4] = y+midY-tY; //y of the depot to spawn in 
	obj_save_boy.triggerList[|5] = target.HP; //health
	obj_save_boy.triggerList[|6] = target.HPMax; //hpMax
	obj_save_boy.triggerList[|7] = target.ore; //ore
	obj_save_boy.triggerList[|8] = target.paycheck; //paycheck 
	obj_save_boy.triggerList[|9] = target.bombs; //bombs
	obj_save_boy.triggerList[|12] = true; //bombs
	
	obj_save_boy.saveTrigger = true;
	
	saveTrigger = false;
	saveComplete = true;
}
