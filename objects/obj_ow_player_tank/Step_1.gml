//key presses and timers
timer++;

if(controlPause = false)
{
	//move key detection to make this data easier to collate
	
	if(keyboard_check(vk_anykey))
	{
		controlBool = 0;
	}
	
		for ( var i = gp_face1; i < gp_axisrv; i++ ) {
	    if ( gamepad_button_check( 0, i ) )
		{
			controlBool = 1;}}
		if(gamepad_axis_value(0,gp_axislv) != 0)
		{
			controlBool = 1;
		}
		if(gamepad_axis_value(0,gp_axislh) != 0)
		{
			controlBool = 1;
		}
	
	if(controlBool = 0)
	{
	key_up = keyboard_check(vk_up);
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_down = keyboard_check(vk_down);
	key_drill = keyboard_check(vk_space);
	key_brake = keyboard_check(ord("X"));
	key_bomb = keyboard_check_released(ord("F"));
	key_kill = keyboard_check_released(ord("N"));
	key_heat = keyboard_check(ord("H"));
	key_override = keyboard_check_released(ord("O"));
	key_vent = keyboard_check_released(ord("V"));
	var keySuperFast = keyboard_check_released(ord("I"));
	var keytoggleDebug = keyboard_check_released(vk_f12); //remove me befor release! 
	}
	else
	{
		
		//hey, don't do this in the future, for either code block
		if(gamepad_axis_value(0, gp_axislv) < 0)
		{	key_up = true;}
		else{
			key_up = false;}
		if(gamepad_axis_value(0, gp_axislv) > 0)
		{	key_down = true;}
		else{
			key_down = false;}
		if(gamepad_axis_value(0, gp_axislh) < 0)
		{	key_left = true;}
		else{
			key_left = false;}
		if(gamepad_axis_value(0, gp_axislh) > 0)
		{	key_right = true;}
		else{
			key_right = false;}
		if(gamepad_button_check(0,gp_shoulderlb) || gamepad_button_check(0,gp_shoulderrb)){
			key_drill = true;}
		else{
			key_drill = false;}
		if(gamepad_button_check(0,gp_face3)){
			key_brake = true;}
			else{
				key_brake = false;}
		if(gamepad_button_check_released(0,gp_face1)){
			key_bomb = true;}
			else{
				key_bomb = false;}
		if(gamepad_button_check_released(0,gp_select)){
			key_override = true;}
			else{
				key_override = false;}
		if(gamepad_button_check_released(0,gp_face4)){
			key_vent = true;}
			else{
				key_vent = false;}
	}
	
	key_kill = keyboard_check_released(ord("N"));
	key_heat = keyboard_check(ord("H"));
	var keySuperFast = keyboard_check_released(ord("I"));
	var keytoggleDebug = keyboard_check_released(vk_f12); //remove me befor release! 
	
	if(keytoggleDebug){global.debug = !global.debug;}
	
	if(global.debug)
	{
		if(keySuperFast){maxFSpeed = 5; axMaxFSpeed = 5; velocity = 5;}

		if(key_kill)
		{
			HP -= 10;
		}
		if(key_heat)
		{
			drillHeat += 1;
		}
	}

	
	if(key_override)
	{
		if(override = true){override = false;var b = audio_play_sound(so_switch_off,1,false);}
		else{override = true;var b = audio_play_sound(so_switch_on,1,false);}
	}
	
if(overHeat)
{
	maxFSpeed = axMaxFSpeed + ((drillHeat - safeTemp) * 0.05);
	maxRSpeed = axMaxRSpeed - (((drillHeat - safeTemp) * 0.05) * 0.5);
}
else
{
	maxFSpeed = axMaxFSpeed;
	maxRSpeed = axMaxRSpeed;
}

if(slowed)
{
	maxFSpeed = 0.5;
	maxAnglAccel = baseMaxAAccel * 0.5;
}
else
{
	maxAnglAccel = baseMaxAAccel;
}

if(velocity > maxFSpeed){velocity -= acc;}
if(velocity < maxRSpeed){velocity += acc;}


pitchGain = abs(velocity * 0.5);

audio_sound_pitch(so_engineIdle,0.2+pitchGain);
	
	if(key_drill = true && drilling = true)
	{
		mobile = false;
	}
	else
	{
		mobile = true;
	}

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
		
		if(mobile = false)
		{
			if(velocity > 0)
			{
				velocity = 0;
			}
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


	if(rPause = false && mobile = true)
	{
		if(key_left)
		{
			oldAngle = angleDir;
			angleAccel += rotateSp;
			if(angleAccel > maxAnglAccel){angleAccel = maxAnglAccel;}
		}
	
		if(key_right)
		{
			oldAngle = angleDir;
			angleAccel -= rotateSp;
			if(angleAccel < -1*maxAnglAccel){angleAccel = -1*maxAnglAccel;}
		}
		
		angleDir += angleAccel;
	}
	
	if(!key_left && !key_right && angleAccel != 0)
	{
		if(angleAccel > 0){angleAccel -= rotateSp;}
		
		if(angleAccel < 0){angleAccel += rotateSp;}
		
		
	}

	if(bombReload = true)
	{
		if(bombRTimer = 60)
		{
			var b = audio_play_sound(so_bomb_reload,2,false);
			audio_sound_gain(b,0.25,0);
		}
		
		bombRTimer ++;
		if(bombRTimer > bombRTime)
		{
			bombRTimer = 0;
			bombReload = false;
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
				blastTriggerDelay = timer + 20;
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
				 //blastTriggerDelay = timer + 30;
			 
				}
				else
				{
					if(instance_exists(obj_ow_bomb_setter) = false && instance_exists(obj_ow_demo_charge) = false && bombs > 0 && bombReload = false)
					{
						var inst = instance_create_depth(x+14, y+14, depth, obj_ow_bomb_setter);
						inst.angleDir = angleDir;
						bombs -= 1;
						bombReload = true;
						blastTriggerDelay = timer + 60;
						var b = audio_play_sound(so_bomb_fire,2,false);
						audio_sound_gain(b,0.25,0);
						
						var _x = x+14+lengthdir_x(14,angleDir);
						var _y = y+14+lengthdir_y(14,angleDir);
						
						part_type_direction(global.rockSpark,angleDir - 45, angleDir + 45,0,0);
						part_system_depth(global.P_System,depth-1);
						part_particles_create(global.P_System, _x, _y, global.rockSpark, 8);
						part_type_direction(global.rockSpark, 0, 359, 0, 0);
						
						drillHeat += 15;
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
		{velocity -= 0.01;
		if(velocity <= 0.1){velocity = 0; decel = false;}
		}
	
		if(velocity < 0)
		{velocity += 0.01;
		if(velocity >= -0.1){velocity = 0; decel = false;}
		}
	}

	if(angleDir > 360)
	{angleDir = 0;}

	if(angleDir < 0)
	{angleDir = 360;}

	if(key_drill)
	{	drillOn = true;
		if(drillAccel != drillAccMax){drillAccel += drillAccVar;}
		if(colliderDrill.jammed = false)
		{drillStopTimer += drillAccel;}
		else
		{drillStopTimer -= drillAccel;}
		if(drillStopTimer > 60){drillStopTimer = 60;}
		if(drillStopTimer < 0){drillStopTimer = 0;}
		drillStop = false;
		if(colliderDrill.jammed = false)
		{
			if(!audio_is_playing(so_drill_underwater))
			{
				audio_play_sound(so_drill_underwater,1,true);
				audio_sound_gain(so_drill_underwater,0,0);
			}
			sc_shake_call(drillStopTimer*0.01666,60,true);
			
			if(audio_is_playing(audDrillJam) && audDrillJam != -1)
			{
				audio_sound_gain(audDrillJam,0,250);
				if(audio_sound_get_gain(audDrillJam) = 0)
				{
					audio_stop_sound(audDrillJam);
				}
			}
				
		}
		else
		{
			if(!audio_is_playing(audDrillJam) || audDrillJam = -1)
			{
			audDrillJam =  audio_play_sound(so_drill_jam,1,true);
			audio_sound_gain(audDrillJam,0,0);
			audio_sound_gain(audDrillJam,audDrillJamMod,250);
			}
			
			if(audio_sound_get_gain(so_drill_underwater) > 0)
			{
				audio_sound_gain(so_drill_underwater,0,250);
			}
		}
		
	}
	
	else
	{
		if(drillHeat < 0){drillHeat = 0;}
		
		if(audio_is_playing(audDrillJam) && audDrillJam != -1)
		{
			audio_sound_gain(audDrillJam,0,250);
			if(audio_sound_get_gain(audDrillJam) = 0)
			{
				audio_stop_sound(audDrillJam);
			}
		}
	}
	

	if(key_drill = false)
	{
		drillStop = true;
	}

	}
else
{
	//velocity = 0;
}

if(audio_is_playing(so_drill_underwater) && colliderDrill.jammed = false)
{
	var dumMath = 0.20 + (clamp(drillStopTimer * so_drillPitch,0,0.15));
	audio_sound_gain(so_drill_underwater,dumMath,100);
	audio_sound_pitch(so_drill_underwater,0.5 + clamp(drillStopTimer * so_drillPitch,0,0.5));
}


if(drilling)
{
	
	drillSoundTrig[0] = true;
	
	for(var i = 0; i < 4; i++)
	{
		if(instance_exists(drillArray[i])) //checks the drill array for what we're drilling
		{
			if(variable_instance_exists(drillArray[i], "drillAudio")) //checks if said obj has aaudio variable
			{
				drillSoundTrig[drillArray[i].drillAudio] = true;
			}
		}
	}
	
	for(var i = 0; i < 3; i ++) //goes through each to check if we need to play it's associated sound
	{
		if(drillSoundTrig[i] = true) //if the sound trigger is true, play sound, else, check if playing
		{
			if(!audio_is_playing(drillSoundList[i]))
			{
				audio_play_sound(drillSoundList[i],1,true);
				audio_sound_gain(drillSoundList[i],0,0);
			}
	
			audio_sound_pitch(drillSoundList[i],0.25+ (drillStopTimer * so_drillPitch));
			var dumMath = drillSoundGain[i] + (clamp(drillStopTimer * so_drillPitch,0,0.25));
			audio_sound_gain(drillSoundList[i],dumMath,100);
		}
		else
		{
			if(audio_is_playing(drillSoundList[i]))
			{
				audio_sound_gain(drillSoundList[i],0,500);
			}
		}
	}
}
else
{
	for(var i = 0; i < 3; i ++)
	{
		if(audio_is_playing(drillSoundList[i]))
		{
			audio_sound_gain(drillSoundList[i],0,500);
		}
	}
	
}

if(!drilling)
{
	if(audio_is_playing(myAudInrock))
	{
		audio_sound_gain(myAudInrock,0,500);
	}
}

for(var i = 0; i < 3; i ++)
{
	drillSoundTrig[i] = false; //set all sound triggers to 0
}

if(drillStop = true)
	{
		drillStopTimer --;
		if(drillAccel > 0){drillAccel -= drillAccVar;}
		if(drillStopTimer < 0){drillStopTimer = 0;}
		if(drillStopTimer = 0)
		{
			drillOn = false;
			visualSpriteDrill.blink = false;
			drillStop = false;
			drillStopTimer = 0;
			
			if(audio_is_playing(so_drill_underwater))
			{
				audio_stop_sound(so_drill_underwater);
			}
		}
	}


if(key_vent) //better intergrate this code better
{
	heatShutdown = true;
	if(soundVent)
	{
		if(!audio_is_playing(so_heat_vent))
		{
		var b = audio_play_sound(so_heat_vent,1,false);
		audio_sound_gain(b,0.5,0);
		}
		soundVent = false;
		sc_steam_burst(drillHeat,x,y,10);
	}
}

if(heatShutdown = true)
{
	ventTimeMin --;
	ventTimeMax --;
	
	if(velocity > 0){velocity -= 0.02;}
	if(velocity < 0){velocity += 0.01;}
	controlPause = true;
	drillStop = true;
	drillHeat -= 0.15;
	if(angleAccel > 0){angleAccel -= 0.05;}
	if(angleAccel < 0){angleAccel += 0.05;}
	angleDir += angleAccel;
		if(timer > steamTimer)
		{
		sc_steam_burst(drillHeat,x,y,0);
		steamTimer = timer + steamInterval; //+ (100 - (drillHeat))
		}
	if(againstWall){velocity = 0;}
	
	if((drillHeat <= 0 && ventTimeMin <= 0) || ventTimeMax <= 0)
	{
		//drillHeat = 0;
		controlPause = false;
		heatShutdown = false;
		sc_steam_burst(drillHeat,x,y,5);
		ventTimeMin = 180;
		ventTimeMax = 480;
		var b = audio_play_sound(so_heat_vent,1,false);
		audio_sound_gain(b,0.5,0);
		audio_sound_pitch(b,2);
		soundVent = true;
	}
}


if(drillHeat > 25) //controlling overheat audio. this can probably go somewhere else but it works here 
{
	if(!audio_is_playing(audOHeat) || audOHeat = 0)
	{
		audOHeat = audio_play_sound(so_overheat_hiss,1,true);
		audio_sound_gain(audOHeat,0,0);
		audio_sound_pitch(audOHeat,0.9);
	}
	else
	{
		var p = ((drillHeat/100)-0.25)*audOHeatMod;
		audio_sound_gain(audOHeat,p,250);
	}
}
else
{
	if(audio_is_playing(audOHeat) && audOHeat != 0)
	{
		audio_sound_gain(audOHeat,0,250);
		if(audio_sound_get_gain(audOHeat) = 0)
		{
			audio_stop_sound(audOHeat);
		}
	}
}