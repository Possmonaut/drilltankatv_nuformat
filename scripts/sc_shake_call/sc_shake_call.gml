
//0 = force, loses 0.01 per frame 
//1 = duration, measured in frames
//2 = if we centershake



function sc_shake_call(argument0, argument1, argument2) {
	obj_ow_camera.shake = true;
	if(argument0 > obj_ow_camera.shakeForce)
	{
	obj_ow_camera.shakeForce = argument0;
	}
	if(argument1 > obj_ow_camera.shakeDur)
	{
	obj_ow_camera.shakeDur = argument1;
	}
	obj_ow_camera.centerShake = argument2;
}
