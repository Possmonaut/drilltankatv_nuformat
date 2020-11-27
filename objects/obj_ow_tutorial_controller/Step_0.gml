if(tutActive = false)
{
	exit;
}

timer ++; 

if(tutorialActive = true && obj_save_boy.triggerList[|0] = true)
{
	//rgith here, place the code to spawn the player in whatever room the save is in, and at the xy of whatever
	//depot / elevator
	inputStage = finalStage;
	instance_destroy(); //if the tutorial has been completed for this stage, skip all of this below
	
}

if(obj_elevator = 0)
{
obj_elevator = o_tutorial_elevator_2;
}
obj_ow_camera.fathoms += 0.001;

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
		obj_ow_transponder_controller_temp.lineList[|0] = "Transponder online. ...system loading.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 1;
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 1 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "System check nominal. Beginning operations check. Please accelerate by pressing the >>UP<< key.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 2;
		currentKey = keyboard_check(vk_up);
	}
	
	if(inputStage = 2)
	{
		currentKey = keyboard_check(vk_up);
		if(currentKey){inputStage = 3;
			var b = audio_play_sound(so_ore_grab,1,false);
			}
		
	}
	
	//note, we'll want to change this to do accel, decel to 0, reverse, accel to 0
	if(inputStage = 3)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Now decelerate by pressing the >>DOWN<< key.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 4;
		currentKey = keyboard_check(vk_down);
	}
	
	if(inputStage = 4)
	{
		currentKey = keyboard_check(vk_down);
		if(currentKey){inputStage = 5;
			var b = audio_play_sound(so_ore_grab,1,false);
			}
		
	}
	
	if(inputStage = 5)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Please trigger your emergency break by pressing >>X<<";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 6;
		currentKey = keyboard_check(ord("X"));
	}
	
	if(inputStage = 6)
	{
		currentKey = keyboard_check(ord("X"));
		if(currentKey){inputStage = 7;
			var b = audio_play_sound(so_ore_grab,1,false);
			}
		
	}
	
	if(inputStage = 7)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Brake system nominal. Engage your LEFT track to rotate 90 degrees LEFT by pressing the >>LEFT<< key.";
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
		if(currentKey && target.angleDir >= 359){inputStage = 9;
			var b = audio_play_sound(so_ore_grab,1,false);
			}
	}
	
	if(inputStage = 9)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Now engage your RIGHT track by pressing the >>RIGHT<< key to return to a neutral position.";
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
		if(currentKey && target.angleDir <= 270){inputStage = 11;
			var b = audio_play_sound(so_ore_grab,1,false);
			}
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
		obj_ow_transponder_controller_temp.lineList[|0] = "Warning, heat vents shuttered. Please engage the drill by HOLDING >>SPACE<< for reactor test. Please observe the heat gauge on the LEFT side of your console.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 13;
	}
	
	if(inputStage = 13)
	{
		currentKey = keyboard_check(vk_space);
		if(currentKey){target.drillHeat += 1;}
		if(target.drillHeat >= 50){inputStage = 14;
			var b = audio_play_sound(so_ore_grab,1,false);
			}
	}
	
	if(inputStage = 14)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Drill fully operational. Disengaging clutch.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 15;
		currentKey = keyboard_check(ord("V"));
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 15 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Heat currently above 25%. Manually vent your engine by pressing the >>V<< key.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 16;
	}
	
	if(inputStage = 16)
	{
		currentKey = keyboard_check(ord("V"));
		delayTimer = timer + stageDelay;
		if(currentKey){inputStage = 17;
			var b = audio_play_sound(so_heat_vent,1,false);
			audio_sound_gain(b,0.2,0);
			}	
	}
	
	if(inputStage > 16)
	{
		if(target.drillHeat > 0){target.drillHeat -= 1;}
	}
	
	if(inputStage = 17 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Heat has been dissipated; engines nominal." ;
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 18;
		currentKey = keyboard_check(ord("R"));
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 18 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Mainline systems nominal. Now activating subsystems.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 19;
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 19 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Subsystems check confirmed. Activate your radar scanner by pressing the >>R<< key on your dashboard.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 20;
	}
	
	if(inputStage = 20)
	{
		currentKey = keyboard_check(ord("R"));
		if(currentKey){inputStage = 22;
			var b = audio_play_sound(so_switch_off,1,false);
			}
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 22 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Radar systems nominal. Tap >>R<< again to toggle it back on.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		currentKey = keyboard_check(ord("R"));
		inputStage = 23;
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 23)
	{
		//currentKey = true;
		currentKey = keyboard_check(ord("R"));
		if(currentKey){inputStage = 24;
			var b = audio_play_sound(so_switch_on,1,false);
			}
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 24 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "HOLD >>M<< to render the map to your console screen.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 25;
	}
	
	if(inputStage = 25)
	{
		currentKey = keyboard_check(ord("M"));
		if(currentKey){inputStage = 26;
			var b = audio_play_sound(so_loader_beep,1,false);
			}
	}
	
	if(inputStage = 26)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Only objects scanned by the radar will be added to your map. Release >>M<< to close your map";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 27;
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 27 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Clearing demolition charges from firing tube. Stand by.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		currentKey = keyboard_check(ord("F"));
		inputStage = 28; //this should be 27 but we're skipping the radio bits 
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 28 && delayTimer < timer)
	{
		currentKey = true;
		if(currentKey){inputStage = 29;
			var b = audio_play_sound(so_ore_grab,1,false);
			}
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 29)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Safety engaged. The Copepod class Subterrene comes equipped with a single demolition charge launcher to aid in the clearing of tunnel blockages. Engage the firing mechanism now by pressing >>F<<";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 30;
		delayTimer = timer + stageDelay;
	}
	
	
	
	if(inputStage = 30 && delayTimer < timer)
	{
		currentKey = keyboard_check(ord("F"));
		if(currentKey){inputStage = 31;
			var b = audio_play_sound(so_ore_grab,1,false);
			target.drillHeat += 15;
			}
		//delayTimer = timer + stageDelay;
	}
	
		if(inputStage = 31)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Mechanism engaged successfully. Please observer the load lights to your right...";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 32;
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 32 && delayTimer < timer)
	{
		currentKey = true;
		if(currentKey){inputStage = 33;}
		delayTimer = timer + stageDelay;
	}
	
			if(inputStage = 33)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Reload complete.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 34;
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 34 && delayTimer < timer)
	{
		currentKey = true;
		if(currentKey){inputStage = 35;}
		//delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 35)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Final systems check; trigger control panel actuators by pressing >>ESCAPE<<.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		inputStage = 36;
		//delayTimer = timer + (stageDelay);
	}
	
	if(inputStage = 36)
	{
		currentKey = keyboard_check(vk_escape);
		if(currentKey){inputStage = 37;
			var b = audio_play_sound(so_depot_dock,1,false);
			}
		delayTimer = timer + stageDelay;
	}
	
		if(inputStage = 37 && delayTimer < timer)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "This actuator may be toggled by pressing >>ESCAPE<< again.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		obj_ow_camera.panelOpen = false;
		inputStage = 38;
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 38 && delayTimer < timer)
	{
		obj_ow_camera.panelOpen = false;
		currentKey = true;
		obj_ow_camera.panelOpen = false;
		if(currentKey){inputStage = 39;}
		delayTimer = timer + finalDelay;
	}
	
	if(inputStage = 39)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "System check complete. You may now TOGGLE this window by pressing >>T<<. Incoming trans- missions will be indicated by a blinking icon at the top of this window.";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		obj_ow_camera.panelOpen = false;
		inputStage = 40;
		delayTimer = timer + stageDelay;
	}
	
	if(inputStage = 40 && delayTimer < timer)
	{
		currentKey = true;
		if(currentKey){inputStage = 41;}
		delayTimer = timer + finalDelay;
	}
	
			if(inputStage = 41)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = "Approaching destination. Please stand by...";
		ds_list_add(transponder.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		obj_ow_camera.panelOpen = false;
		inputStage = 42;
		delayTimer = timer + stageDelay*3;
	}
	
	if(inputStage = 42 && delayTimer < timer)
	{
		currentKey = true;
		if(currentKey){inputStage = 43;}
		delayTimer = timer + finalDelay;
	}
	
	//obj_ow_transponder_controller_temp.lineList[|0] = "All systems fully operational. Please exit the elevator upon arriving."
	
	if(inputStage = finalStage && delayTimer < timer)
	{
		tutorialActive = false;
		//descendAnim = true;
	}
	
	
}

//if(global.debug)
//{
if(keyboard_check_released(vk_f2) && global.debug) //remove this later
{
	inputStage = finalStage;
	//tutorialActive = false;
	//descendAnim = true;
}
//}


if(descendAnim = true) //this basically just sets the elevator and associated sprites in the correct position
{
	obj_elevator.descendAnim = true;
	target.tutComplete = true; 
	target.controlPause = false;
	instance_destroy();
}