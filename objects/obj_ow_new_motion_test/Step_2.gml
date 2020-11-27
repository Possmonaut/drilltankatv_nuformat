if(keyboard_check(vk_space))
{
	
	if(instance_position(x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir), obj_ow_move_test_rock) != noone)
	{
		var inst = instance_position(x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir), obj_ow_move_test_rock);
		inst.HP -= 1;
		if(inst.HP <= 0){instance_destroy(inst);}
		
	}
	
	if(instance_position(x + 16 +  lengthdir_x(18, angleDir - 30), y + 16 + lengthdir_y(18,angleDir - 30), obj_ow_move_test_rock) != noone)
	{
		var inst = instance_position(x + 16 +  lengthdir_x(18, angleDir - 30), y + 16 + lengthdir_y(32,angleDir - 30), obj_ow_move_test_rock);
		inst.HP -= 1;
		if(inst.HP <= 0){instance_destroy(inst);}
		
	}
	
	if(instance_position(x + 16 +  lengthdir_x(18, angleDir + 30), y + 16 + lengthdir_y(18,angleDir+30), obj_ow_move_test_rock) != noone)
	{
		var inst = instance_position(x + 16 +  lengthdir_x(18, angleDir+30), y + 16 + lengthdir_y(18,angleDir+30), obj_ow_move_test_rock);
		inst.HP -= 1;
		if(inst.HP <= 0){instance_destroy(inst);}
		
	}
	
}

//angleDir + adjusts the position on the rotation around the object. the first avalue in lengthDir is the distance from
//whatever central point it's being added to. 

//collision boxes should work with any size collider so you can possibly make a smaller one to make it easier to squeak past blocks