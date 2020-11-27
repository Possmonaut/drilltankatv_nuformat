	if(point_distance(x,y,target.x+14,target.y+14) > distTrig && !spoolSt)
	{
		exit;
	}
	
	
	if(point_distance(x,y,target.x+14,target.y+14) < distTrig && lineTrigger = true)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = addLine[lineTarg]; 
		//obj_ow_transponder_controller_temp.msgName = myName;
		ds_list_add(obj_ow_transponder_controller_temp.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		obj_ow_transponder_controller_temp.newMsg = true;
		spoolSt = true;
		lineTrigger = false;
		if(trnspndrBeep = false)
		{
			var b = audio_play_sound(so_loader_beep,1,false);
			trnspndrBeep = true;
		}
obj_save_boy.triggerList[|16+myNum] = 1;
	}

	if(point_distance(x,y,target.x+14,target.y+14) < closeTrig && lineTrig2 = true)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = addLine[lineTarg+1]; 
		//obj_ow_transponder_controller_temp.msgName = myName;
		ds_list_add(obj_ow_transponder_controller_temp.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		obj_ow_transponder_controller_temp.newMsg = true;
		branchTrig = false;
	}

	if(branchTrig = false)
	{
		if(point_distance(x,y,target.x+14,target.y+14) > closeTrig * 2)
		{
			if(randLine)
			{
				lineTarg = irandom_range(randLineMin,randLineMax);
				closeTrig = true;
			}

			if((lineTarg < listSz -1 && spoolOut))
			{
				lineTarg ++;
				closeTrig = true;
			}
			
			if(cycleBack)
			{
				if(lineTarg < listSz -1)
				{
					lineTarg ++;
				}
				else
				{
					lineTarg = 0;
				}
				closeTrig = true;
			}
		}
		branchTrig = true;
	}
	
	if(spoolOut && spoolSt && lineTarg != listSz)
	{
		spoolTimer ++;
		if(spoolTimer > spoolTime)
		{
		lineTrigger = true;
		lineTarg ++;
		spoolTimer = 0;
		}
	}