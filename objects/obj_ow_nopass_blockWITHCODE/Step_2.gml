//if DLOS = true, can borrow depth from cardinal objects
//if not true, do not display
//if not true, gains a new depth and will change shading according to distance

	/*
	if(DLOS = true)
	{
		image_alpha = 1;
	
				if(instance_position(x + 16, y + 48, obj_ow_nopass) != noone)
				{
					var inst = instance_position(x + 16, y + 48, obj_ow_nopass);
					if(inst.depth  < depth)
					{	upObj.depth = inst.depth - uDepth;
						depth = inst.depth;
						downObj.depth = inst.depth + uDepth;
						myShadow.depth = inst.depth + dDepth;
						}
				}
	
				if(instance_position(x + 16, y - 16, obj_ow_nopass) != noone)
				{
					var inst = instance_position(x + 16, y - 16, obj_ow_nopass);
					if(inst.depth  < depth)
					{	upObj.depth = inst.depth - uDepth;
						depth = inst.depth;
						downObj.depth = inst.depth + uDepth;
						myShadow.depth = inst.depth + dDepth;
						}
					
				}
	
				if(instance_position(x + 48, y + 16, obj_ow_nopass) != noone)
				{
					var inst = instance_position(x + 48, y + 16, obj_ow_nopass);
					if(inst.depth  < depth)
					{	upObj.depth = inst.depth - uDepth;
						depth = inst.depth;
						downObj.depth = inst.depth + uDepth;
						myShadow.depth = inst.depth + dDepth;
						}
				}
	
				if(instance_position(x - 16, y + 16, obj_ow_nopass) != noone)
				{
					var inst = instance_position(x -16, y + 16, obj_ow_nopass);
					if(inst.depth  < depth)
					{	upObj.depth = inst.depth - uDepth;
						depth = inst.depth;
						downObj.depth = inst.depth + uDepth;
						myShadow.depth = inst.depth + dDepth;
						}
				}
	}
	else
	{
		//image_alpha = 0;
	}
	
LOSconfirm = 0;
