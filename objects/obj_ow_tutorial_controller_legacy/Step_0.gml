timer ++; 

if(tutorialActive = true && obj_save_boy.triggerList[|0] = true)
{
	obj_elevator.x = targetX;
	obj_elevator.y = elevatorY;
	//target.x = targetX + centerParking;
	//target.y = elevatorY + centerParking -32;
	obj_girder.x = targetX;
	obj_girder.y -= 1.8; //this needs to be given a static position
	obj_girder2.x = targetX;
	obj_girder2.y -= 2; //this needs to be given a static position
	//rgith here, place the code to spawn the player in whatever room the save is in, and at the xy of whatever
	//depot / elevator
	inputStage = finalStage;
	instance_destroy(); //if the tutorial has been completed for this stage, skip all of this below
}


//todo:
//add readcomplete into each keycheck
//add skip key
//add proper animations
//add interactions for other objects since the tank controls are disabled until the elevator lands 
//tho I think those are all their own unique objects 
//add a unique depth counter as the player goes down the elevator, cuz it's cool 
//add correct interation for pressing the O key and hitting the ground 
//add dustpuff / smoke for launching charges 

if(tutorialActive = true && obj_save_boy.triggerList[|0] = false)
{
	target.controlPause = true;
	
	obj_ow_camera.x = target.x;
	obj_ow_camera.y = target.y;
	
	if(fadeDone = true && inputStage = -1)
	{
		inputStage = 0;
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 0 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Welcome to blah blah blah, system loading.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 1;
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 1 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "System check nominal. Beginning operations check. Please accelerate by pressing Up.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 2;
		currentKey = keyboard_check(vk_up);
	}
	
	if(inputStage = 2)
	{
		currentKey = keyboard_check(vk_up);
		if(currentKey){inputStage = 3;}
	}
	
	//note, we'll want to change this to do accel, decel to 0, reverse, accel to 0
	if(inputStage = 3)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Now decelerate by pressing the Down key.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 4;
		currentKey = keyboard_check(vk_down);
	}
	
	if(inputStage = 4)
	{
		currentKey = keyboard_check(vk_down);
		if(currentKey){inputStage = 5;}
	}
	
	if(inputStage = 5)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Complete your acceleration loop by hitting X to activate the emergency brake.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 6;
		currentKey = keyboard_check(ord("X"));
	}
	
	if(inputStage = 6)
	{
		currentKey = keyboard_check(ord("X"));
		if(currentKey){inputStage = 7;}
	}
	
	if(inputStage = 7)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Brake system nominal. Engage your LEFT track to rotate 90 degrees LEFT by pressing the LEFT key.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 8;
		currentKey = keyboard_check(vk_left);
	}
	
	if(inputStage = 8)
	{
		currentKey = keyboard_check(vk_left);
		if(currentKey)
		{
		target.angleDir += 2;
		}
		if(currentKey && target.angleDir >= 359){inputStage = 9;}
	}
	
	if(inputStage = 9)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Now engage your RIGHT track by pressing the RIGHT key to return to a neutral position.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 10;
		currentKey = keyboard_check(vk_right);
	}
	if(inputStage = 10)
	{
		currentKey = keyboard_check(vk_right);
		
		if(transponder.readComplete = true) //add this into all the above keyboard checks 
		{
		if(currentKey)
		{
		target.angleDir -= 2;
		}
		if(currentKey && target.angleDir <= 270){inputStage = 11;}
		}
	}
	
	if(inputStage = 11)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Engaging drill clutch. Closing heat vents.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 12;
		currentKey = keyboard_check(vk_space);
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 12 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Warning, heat vents shuttered. Please engage the drill by pressing SPACE for reactor test. Please observe the heat gauge.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 13;
	}
	
	if(inputStage = 13)
	{
		currentKey = keyboard_check(vk_space);
		if(currentKey){target.drillHeat += 1;}
		if(target.drillHeat >= 50){inputStage = 14;}
	}
	
	if(inputStage = 14)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Disengaging drill clutch. Venting heat. Please observe the heat gauge, and remember, overheating kills.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 15;
		currentKey = keyboard_check(ord("F"));
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 15 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Heat vented. Disengaging charge safety. Press F to activate the demolition charge launcher.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 16;
	}
	
	if(inputStage = 16)
	{
		currentKey = keyboard_check(ord("F"));
		if(currentKey){inputStage = 17;}	
	}
	
	if(inputStage = 17)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Tubes opened successfully. Remember, never fire a demolition charge towards a fellow employee, or in an enclosed space.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 19;
		currentKey = keyboard_check(ord("R"));
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 19 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Mainline systems nominal. Now activating subsystems.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 20;
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 20 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Subsystems check confirmed. Activate your radar scanner by pressing the R key on your dashboard.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 21;
	}
	
	if(inputStage = 21)
	{
		currentKey = keyboard_check(ord("R"));
		if(currentKey){inputStage = 22;}
	}
	
	if(inputStage = 22)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Your radar will scan in any local blockages or minerals and add them to your map.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		currentKey = keyboard_check(ord("M"));
		inputStage = 23;
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 23 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Press M to look at the map screen on your dashboard.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 24;
	}
	
	if(inputStage = 24)
	{
		currentKey = keyboard_check(ord("M"));
		if(currentKey){inputStage = 25;}
	}
	
	if(inputStage = 25)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Remember, you need to scan in the local cavern systems using your radar before the map will show them.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 26;
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 26 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Pressing ESCAPE will allow you to veiw your dashboard if you need any additional information.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		currentKey = keyboard_check(vk_escape);
		inputStage = 30; //this should be 27 but we're skipping the radio bits 
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 27)
	{
		currentKey = keyboard_check(vk_escape);
		if(currentKey){inputStage = 28;}
	}
	
	if(inputStage = 28)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Finally, O will engage the shortwave radio, and I and P will allow you to tune it. Activate it.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 29;
		delayTimer = timer + stageDelay;
	}
	
	
	
	if(inputStage = 29 && delayTimer < timer)
	{
		currentKey = keyboard_check(ord("O"));
		if(currentKey){inputStage = 30;}
		delayTimer = timer + stageDelay;
	}
	
	//obj_ow_transponder_controller_temp.lineList[|0] = "All systems fully operational. Please exit the elevator upon arriving."
	
	if(inputStage = finalStage && delayTimer < timer)
	{
		tutorialActive = false;
		//descendAnim = true;
	}
	
	
}

if(keyboard_check_released(vk_f2)) //remove this later
{
	inputStage = finalStage;
	//tutorialActive = false;
	//descendAnim = true;
}


if(descendAnim = true) //this basically just sets the elevator and associated sprites in the correct position
{
	
	obj_elevator.x = targetX;
	obj_elevator.y = targetY;
	//target.x = targetX + centerParking;
	//target.y = targetY + centerParking -32;
	//obj_girder.x = targetX;
	//obj_girder.y -= 1.8;
	//obj_girder2.x = targetX;
	//obj_girder2.y -= 2;
	obj_vater_walls.y = targetY - 176;
	obj_vater_walls_2.y = targetY - 176;
	//remove the above code when testing is complete
	target.tutComplete = true; 
	target.controlPause = false;
	instance_destroy();
}