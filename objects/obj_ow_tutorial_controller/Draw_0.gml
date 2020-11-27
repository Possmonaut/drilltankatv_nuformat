if(inputStage != finalStage)
{

	
	//if(obj_girder.y = -352)
	//{
	//	obj_girder.y = 768;
	//}
	

}
else //here we need to move into position and slowly descend 
{
	

	obj_elevator.descendAnim = true;
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


