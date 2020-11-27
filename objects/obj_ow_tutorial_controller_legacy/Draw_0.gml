if(inputStage != finalStage)
{
	obj_elevator.x = elevatorX;
	obj_elevator.y = elevatorY;
	target.x = elevatorX + centerParking;
	target.y = elevatorY + centerParking -32;
	obj_girder.x = elevatorX;
	obj_girder.y -= 1.8;
	obj_girder2.x = elevatorX;
	obj_girder2.y -= 2;
	obj_vater_walls.y = elevatorY - 266;
	obj_vater_walls_2.y = elevatorY - 266;
	
	//if(obj_girder.y = -352)
	//{
	//	obj_girder.y = 768;
	//}
	
	if(obj_girder.y <= elevatorY - 512) // need to change this into code reletive to the elevator location
	{
		obj_girder2.y = elevatorY + 768;
		obj_girder.y = elevatorY + 784;
	}
}
else //here we need to move into position and slowly descend 
{
	
	//also teleport camera over so it doesn't zip zoom
	//swap to descending the platform with the girders moving to certain points 
	
	obj_elevator.x = targetX;
	obj_elevator.y += descendSpeed;
	target.x = targetX + centerParking;
	target.y = obj_elevator.y + centerParking -32;
	
	obj_girder.x = elevatorX;
	obj_girder2.x = elevatorX;
	
	
	
	
	/*
	if(obj_elevator.y < targetY -176)
	{
	obj_vater_walls.y = obj_elevator.y - 272;
	obj_vater_walls_2.y = obj_elevator.y - 272;
	}
	else
	{
	}
	*/
	
	if(obj_vater_walls_2.y != targetY - 816) //416
	{
		obj_vater_walls_2.y = obj_elevator.y - 302; //272
	}
	
	if(obj_vater_walls.y != targetY - 1136) //736
	{
		obj_vater_walls.y = obj_elevator.y - 302;
	}
	
	
	/*
	if(obj_girder.y <= obj_elevator.y - 516)
	{
		obj_girder2.y = obj_elevator.y + 768;
		obj_girder.y = obj_elevator.y + 784;
	}
	*/
	
	if(obj_elevator.y = targetY)
	{
		
	obj_ow_camera.shakeDur = 10;
	obj_ow_camera.shake = true;
	target.tutComplete = true; 
	instance_destroy();
	target.controlPause = false;
	}
	
//stop moving the girders
//place girders at another location lower down
//move elevator down by x per second
//manifest "cavern roof" slightly above the 0,0 point, maybe 180 or so
//probably have a seperate object that handles the elevator sprites since they don't despawn. 
//tho for now can keep things active. basically block out any active scripts parts and just
//keep the elevator parts in place
//spawn the elevator base parts at the x/y location


}