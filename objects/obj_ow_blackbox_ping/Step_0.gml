
if(obj_save_boy.triggerList[|myTrig] = 0)
{
	if(point_distance(x,y,target.x,target.y) < distTrig && lineTrigger = true)
	{
		obj_ow_transponder_controller_temp.lineList[|0] = myLine; 
		//obj_ow_transponder_controller_temp.msgName = myName;
		ds_list_add(obj_ow_transponder_controller_temp.msgSpooler, 0);
		ds_list_add(obj_ow_transponder_controller_temp.nameSpooler, myName);
		obj_ow_transponder_controller_temp.newMsg = true;
		lineTrigger = false;
		obj_save_boy.triggerList[|myTrig] = 1;
	}
}

