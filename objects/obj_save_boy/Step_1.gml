//functions:
//menu load [x] this is a option used in tandem with roomswap; turn both to true
//depot save works the same, is good
//new game (uses the new game function)
//room swap [x]
//death load


//room swap =  save current room, save new positions for next room, 
//goto new room, load positions for new room, place tank

//will also need to have a chunk up top to update the tank data in the event of tank destruction
//and the autotiler

//actually menu load would need to
//fade
//clear
//load trigger data
//goto room
//load block data
//load tank data
//load tank placement
//fade in
//would probably be smart to have the game load save data when the game opens; then you can run the room sawp code just fine, I think
//loadInit; check if file exists. if yes, check if triggerList exists; if yes, load said data.
//check the seismographer, you can copy most of this code from there 

if(roomSwap)
{	
	//fade out
	//clear blocks
	//save room
	//goto new room
	//load room
	//select new tank
	//load tank data 
	//load coordinates
	//fade in & reset
	
	fade.forward = true;
	
	if(!audSwitch)
	{
		audio_group_set_gain(soundEffects,0,500);
		audSwitch = true;
	}
	
	if(fade.COMPLETE)
	{
	
	obj_ow_auto_tile_dark.updateBlock = true;
	sc_shake_call(0,0,true);
	obj_ow_camera.guiShakeX = 0;
	obj_ow_camera.guiShakeY = 0;
	
	if(!blockClear)
	{
		var listLeng = ds_list_size(obj_ow_auto_tile_dark.deleteList);
		for(var i = 0; i < listLeng; i++)
		{
			 if(instance_exists(obj_ow_auto_tile_dark.deleteList[|i]))
			 {
				 instance_destroy(obj_ow_auto_tile_dark.deleteList[|i]);
			 }
		 }
		 ds_list_clear(obj_ow_auto_tile_dark.deleteList);
 
		 var lLeng = ds_list_size(obj_ow_auto_tile_dark.blockList);
		 for(var i = 0; i < lLeng; i++)
		 {
			 if(instance_exists(obj_ow_auto_tile_dark.blockList[|i]))
			 {
					instance_destroy(obj_ow_auto_tile_dark.blockList[|i]);
			 }
		 }
		 blockClear = true;
	}
	
	if(openLoad){
		saveComp = true;
		saveSwitch = true;
		roomGoto = triggerList[|2];
		TPTrigX = triggerList[|3]; //x of the depot to spawn in
		TPTrigY = triggerList[|4]; //y of the depot to spawn in 
		}
		
		if(!saveComp) 
		{
			//////if the below is used in more places than here, turn it into a quick script
			//obj_save_boy.triggerList[|1] = 1; //depot to spawn at. 0 = elevator. 1 = first depot, etc
			triggerList[|2] = roomGoto; //room to spawn in
			triggerList[|3] = TPTrigX; //x of the depot to spawn in
			triggerList[|4] = TPTrigY; //y of the depot to spawn in 
			triggerList[|5] = target.HP; //health
			triggerList[|6] = target.HPMax; //hpMax
			triggerList[|7] = target.ore; //ore
			triggerList[|8] = target.paycheck; //paycheck 
			triggerList[|9] = target.bombs; //bombs
			triggerList[|12] = true; //if load option is active 
			saveTrigger = true;
			saveComp = true;
		}
		
		if(saveComp && !roomGotoComp && saveSwitch)
		{
			
			
			if(room != roomGoto)
			{
			audio_group_stop_all(soundEffects);
			audio_group_set_gain(soundEffects,global.audioGain,0);
			room_goto(roomGoto);
			}
			else
			{
				roomGotoComp = true;
				target = obj_ow_player_tank;
			}
		}
		
		if(roomGotoComp)
		{
			if(!loadComp && !loadSwitch)
			{
				target = obj_ow_player_tank;
				loadTrigger = true;
				roomLoad = true;
				trigLoad = true;
				loadComp = true
			}
			else
			{	
				if(!coordLoadComp && loadSwitch)
				{
						target = obj_ow_player_tank;
						target.x = TPTrigX;
						target.y = TPTrigY;
						target.controlPause = false;
						coordLoadComp = true;
				}
			}
		}
		
		if(roomGotoComp && saveComp && loadComp && coordLoadComp && loadSwitch && saveSwitch)
		{
			fade.back = true;
			roomGotoComp = false;
			saveComp = false;
			loadComp = false;
			coordLoadComp = false;
			roomSwap = false;
			blockClear = false;
			loadSwitch = false;
			saveSwitch = false;
			openLoad = false;
		}
	}
	else
	{
			roomGotoComp = false;
			saveComp = false;
			loadComp = false;
			coordLoadComp = false;
			roomSwap = false;
			blockClear = false;
			loadSwitch = false;
			saveSwitch = false;
			openLoad = false;
			audSwitch = false;
	}
}

