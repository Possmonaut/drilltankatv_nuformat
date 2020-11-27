if(targetX != target.x || targetY != target.y)
{	
	if(instance_position(x + 16, x + 16, obj_ring_collider_p) != noone)
	{
		
		
		collision_point_list(x + 16, y + 16, obj_ring_collider_p, false, true, line_detect_list, true);
		
			for(var i = 0; i < ds_list_size(line_detect_list); i++)
		{
			ring_depth_list[|i] = 0;
		}


		for(var i = 0; i < ds_list_size(line_detect_list); i++)
		{
			ring_depth_list[|i] = line_detect_list[|i].depth;
		}

		ds_list_sort(ring_depth_list, true);
	
		if(ring_depth_list[|0] != undefined)
		{
		newDepth = ring_depth_list[|0];
		}

			depth = 1;
			myShadow.depth = 11;

			depth += newDepth;
			myShadow.depth += newDepth;
			depthSelect = 0;
			//noBuddy = false;
			ds_list_clear(line_detect_list);
			ds_list_clear(ring_depth_list);

	}
	targetX = target.x;
	targetY = target.y;
	
	if(instance_position(x + 16, x + 16, obj_ring_collider_p) = 0)
	{
	depth = 999;
	myShadow.depth = 999;
	//noBuddy = true;
	}
	
if(collision_line(x + x1, y +y1, target.x+x5, target.y+y5, obj_ow_nopass, false, true) = noone){LOSconfirm ++;}
if(collision_line(x + x2, y +y2, target.x+x6, target.y+y6, obj_ow_nopass, false, true) = noone){LOSconfirm ++;}
if(collision_line(x + x3, y +y3, target.x+x7, target.y+y7, obj_ow_nopass, false, true) = noone){LOSconfirm ++;}
if(collision_line(x + x4, y +y4, target.x+x8, target.y+y8, obj_ow_nopass, false, true) = noone){LOSconfirm ++;}

}

