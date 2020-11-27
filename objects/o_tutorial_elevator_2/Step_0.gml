if(obj_save_boy.triggerList[|0] = false)
{

	if(descendAnim = true)
	{
		fade.forward = true;
		obj_save_boy.triggerList[|0] = true;
		descendAnim = false;
		return;
	}

	for(var i = 0; i < 18; i ++)
	{
		var xx = x+xOfst+lengthdir_x(bRad-1,(i+1)*20);
		var yy = y+yOfst+lengthdir_y(bRad-1,(i+1)*20);
		botCircle[# i, 0] = xx;
		botCircle[# i, 1] = yy;
	}

	for(var i = 0; i < 18; i ++)
	{
		var xx = mX+lengthdir_x(mRad-1,(i+1)*20);
		var yy = mY+lengthdir_y(mRad-1,(i+1)*20);
		midCircle[# i, 0] = xx;
		midCircle[# i, 1] = yy;
	}

	for(var i = 0; i < 18; i ++)
	{
		var xx = x+xOfst+lengthdir_x(tRad-1,(i+1)*20);
		var yy = y+yOfst+lengthdir_y(tRad-1,(i+1)*20);
		topCircle[# i, 0] = xx;
		topCircle[# i, 1] = yy;
	}

	target.x = x;
	target.y = y;

	
	shakeTimer ++;
	if(onBoard && target.controlPause = true && shakeTimer >= shakeInterval)
	{
		sc_shake_call(1,30,true);
		shakeTimer = 0;
		var b = audio_play_sound(so_elevator_bump,1,false);
		audio_sound_gain(b,0.05,0);
	}
	

}
else
{
	if(fade.forward = false && fade.COMPLETE = true)
	{
		target.fathomX = x;
		target.fathomY = y;
		obj_save_boy.TPTrigX = target.x;
		obj_save_boy.TPTrigY = target.y;
		obj_save_boy.roomGoto = room;
		obj_save_boy.saveTrigger = true;
		fade.back = true;
		target.x -= 173*32;
		struts.x -= 173*32;
		engines.x -= 173*32;
		bigassBG.x -= 173*32;
		base.x -= 173*32;
		instance_destroy();
	}
}

	onBoard = position_meeting(target.bbox_left, target.bbox_top, o_tutorial_elevator_2);
	onBoard = position_meeting(target.bbox_right, target.bbox_top, o_tutorial_elevator_2);
	onBoard = position_meeting(target.bbox_left, target.bbox_bottom, o_tutorial_elevator_2);
	onBoard = position_meeting(target.bbox_right, target.bbox_bottom, o_tutorial_elevator_2);

	if(onBoard)
	{
		target.visualSpriteTank.depth = depth - 3;
		target.visualSpriteDrill.depth = depth -4;
		target.visualSpriteTank.treadLeft.depth = -2;
		target.visualSpriteTank.treadRight.depth = -2;
	}
	else
	{
		//probably wise to reset depths! 
	}