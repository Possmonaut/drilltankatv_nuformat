function scr_drill_check(argument0) {
	//a cleanup script to run the four corners check for drillable objects 
	//argument0 = type of object we're looking for 
	var drillTarget = argument0;

	if(instance_position(colliderDrill.bbox_left,colliderDrill.bbox_top,drillTarget) != noone)
			{
				var target = instance_position(colliderDrill.bbox_left, colliderDrill.bbox_top,drillTarget);
				drillArray[0] = target;
				//part_particles_create(global.P_System, x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir), global.rockSpark, 1); 
				drillHeat += 0.05;
				drilling = true;
			}
			else
			{
				//drillArray[0] = 0;
			}
		
			if(instance_position(colliderDrill.bbox_right,colliderDrill.bbox_top,drillTarget) != noone)
			{
				var target = instance_position(colliderDrill.bbox_right, colliderDrill.bbox_top,drillTarget);
				drillArray[1] = target;
				//part_particles_create(global.P_System, x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir), global.rockSpark, 1); 
				drillHeat += 0.05;
				drilling = true;
			}
			else
			{
				//drillArray[1] = 0;
			}
		
		
		
		
			if(instance_position(colliderDrill.bbox_left,colliderDrill.bbox_bottom,drillTarget) != noone)
			{
				var target = instance_position(colliderDrill.bbox_left, colliderDrill.bbox_bottom,drillTarget);
				drillArray[2] = target;
				//part_particles_create(global.P_System, x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir), global.rockSpark, 1); 
				drillHeat += 0.05;
				drilling = true;
			}
			else
			{
				//drillArray[2] = 0;
			}
		
			if(instance_position(colliderDrill.bbox_right,colliderDrill.bbox_bottom,drillTarget) != noone)
			{
				var target = instance_position(colliderDrill.bbox_right, colliderDrill.bbox_bottom,drillTarget);
				drillArray[3] = target;
				//part_particles_create(global.P_System, x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir), global.rockSpark, 1); 
				drillHeat += 0.05;
				drilling = true;
			}
			else
			{
				//drillArray[3] = 0;
			}
		
			//original drillcheck code for tank here 
		
		
	if(instance_position(colliderDrill.bbox_left,colliderDrill.bbox_top,obj_ow_rock_parent) != noone)
			{
				var target = instance_position(colliderDrill.bbox_left, colliderDrill.bbox_top,obj_ow_rock_parent);
				drillArray[0] = target;
				//part_particles_create(global.P_System, x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir), global.rockSpark, 1); 
				drillHeat += 0.05;
				drilling = true;
			}
			else
			{
				drillArray[0] = 0;
			}
		
			if(instance_position(colliderDrill.bbox_right,colliderDrill.bbox_top,obj_ow_rock_parent) != noone)
			{
				var target = instance_position(colliderDrill.bbox_right, colliderDrill.bbox_top,obj_ow_rock_parent);
				drillArray[1] = target;
				//part_particles_create(global.P_System, x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir), global.rockSpark, 1); 
				drillHeat += 0.05;
				drilling = true;
			}
			else
			{
				drillArray[1] = 0;
			}
		
		
		
		
			if(instance_position(colliderDrill.bbox_left,colliderDrill.bbox_bottom,obj_ow_rock_parent) != noone)
			{
				var target = instance_position(colliderDrill.bbox_left, colliderDrill.bbox_bottom,obj_ow_rock_parent);
				drillArray[2] = target;
				//part_particles_create(global.P_System, x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir), global.rockSpark, 1); 
				drillHeat += 0.05;
				drilling = true;
			}
			else
			{
				drillArray[2] = 0;
			}
		
			if(instance_position(colliderDrill.bbox_right,colliderDrill.bbox_bottom,obj_ow_rock_parent) != noone)
			{
				var target = instance_position(colliderDrill.bbox_right, colliderDrill.bbox_bottom,obj_ow_rock_parent);
				drillArray[3] = target;
				//part_particles_create(global.P_System, x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir), global.rockSpark, 1); 
				drillHeat += 0.05;
				drilling = true;
			}
			else
			{
				drillArray[3] = 0;
			}


}
