
if(LOSconfirm > 0)
{
			if(instance_position(x + 16, y + 48, obj_ow_nopass) != noone)
			{
				var inst = instance_position(x + 16, y + 48, obj_ow_nopass);
				if(inst.depth  < depth)
				{depth = inst.depth;}
			}
	
			if(instance_position(x + 16, y - 16, obj_ow_nopass) != noone)
			{
				var inst = instance_position(x + 16, y - 16, obj_ow_nopass);
				if(inst.depth  < depth)
				{depth = inst.depth;}
					
			}
	
			if(instance_position(x + 48, y + 16, obj_ow_nopass) != noone)
			{
				var inst = instance_position(x + 48, y + 16, obj_ow_nopass);
				if(inst.depth  < depth)
				{depth = inst.depth;}
			}
	
			if(instance_position(x - 16, y + 16, obj_ow_nopass) != noone)
			{
				var inst = instance_position(x -16, y + 16, obj_ow_nopass);
				if(inst.depth  < depth)
				{depth = inst.depth;}
			}

			if(instance_position(x - 16, y - 16, obj_ow_nopass) != noone)
			{
				var inst = instance_position(x - 16, y - 16, obj_ow_nopass);
				if(inst.depth  < depth)
				{depth = inst.depth;}
			}
	
			if(instance_position(x + 48, y - 16, obj_ow_nopass) != noone)
			{
				var inst = instance_position(x + 48, y - 16, obj_ow_nopass);
				if(inst.depth  < depth)
				{depth = inst.depth;}
			}
	
			if(instance_position(x -16, y + 48, obj_ow_nopass) != noone)
			{
				var inst = instance_position(x -16, y + 48, obj_ow_nopass);
				if(inst.depth  < depth)
				{depth = inst.depth;}
			}
	
			if(instance_position(x + 48, y + 48, obj_ow_nopass) != noone)
			{
				var inst = instance_position(x + 48, y + 48, obj_ow_nopass);
				if(inst.depth  < depth)
				{depth = inst.depth;}
			}
			
			
			/*
			if(instance_position(x + 16, y + 48, obj_ow_nopass) != noone)
			{
				var inst = instance_position(x + 16, y + 48, obj_ow_nopass);
				if(inst.depth  > depth)
				{inst.depth = depth}
			}
	
			if(instance_position(x + 16, y - 16, obj_ow_nopass) != noone)
			{
				var inst = instance_position(x + 16, y - 16, obj_ow_nopass);
				if(inst.depth  > depth)
				{inst.depth = depth}
					
			}
	
			if(instance_position(x + 48, y + 16, obj_ow_nopass) != noone)
			{
				var inst = instance_position(x + 48, y + 16, obj_ow_nopass);
				if(inst.depth  > depth)
				{inst.depth = depth}
			}
	
			if(instance_position(x - 16, y + 16, obj_ow_nopass) != noone)
			{
				var inst = instance_position(x -16, y + 16, obj_ow_nopass);
				if(inst.depth  > depth)
				{inst.depth = depth}
			}
			*/
}


LOSconfirm = 0;
