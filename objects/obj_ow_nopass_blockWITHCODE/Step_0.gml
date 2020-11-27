if(targetX != target.x || targetY != target.y)
{	
	upObj.depth = uDepth;
	depth = mDepth;
	downObj.depth = dDepth;
	myShadow.depth = sDepth;
	
	upObj.depth += round(point_distance(x + 15, y + 15, target.x + 15, target.y + 15) / 32) * 10;
	depth += round(point_distance(x + 15, y + 15, target.x + 15, target.y + 15) / 32) * 10;
	downObj.depth += round(point_distance(x + 15, y + 15, target.x + 15, target.y + 15) / 32) * 10;
	myShadow.depth += round(point_distance(x + 15, y + 15, target.x + 15, target.y + 15) / 32) * 10;
	
LOSconfirm1 = collision_line_list(x + x1, y +y1, target.x+x5, target.y+y5, obj_ow_nopass, false, true, line_detect_list, false);
LOSconfirm2 = collision_line_list(x + x2, y +y2, target.x+x6, target.y+y6, obj_ow_nopass, false, true, line_detect_list, false);
LOSconfirm3 = collision_line_list(x + x3, y +y3, target.x+x7, target.y+y7, obj_ow_nopass, false, true, line_detect_list, false);
LOSconfirm4 = collision_line_list(x + x4, y +y4, target.x+x8, target.y+y8, obj_ow_nopass, false, true, line_detect_list, false);

if(LOSconfirm1 == 0 || LOSconfirm2 == 0 || LOSconfirm3 == 0 || LOSconfirm4 == 0){DLOS = true;}
else
{DLOS = false;}

if(LOSconfirm1 == 0){DLOS2 ++;}
if(LOSconfirm2 == 1){DLOS2 ++;}
if(LOSconfirm3 == 0){DLOS2 ++;}
if(LOSconfirm4 == 1){DLOS2 ++;}

LOSconfirm = LOSconfirm1 + LOSconfirm2 + LOSconfirm3 + LOSconfirm4;

LOSconfirm1 = 0;
LOSconfirm2 = 0;
LOSconfirm3 = 0;
LOSconfirm4 = 0;
//DLOS = false;
DLOS2 = 0;

targetX = target.x;
targetY = target.y;

}


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
