if(instance_position(x + 16, y - 32, obj_ow_rock) != noone)
{ 
	var inst = instance_position(x + 16, y - 32, obj_ow_rock);
	if(inst.depthSet < depthSet){depthSet = inst.depthSet;}
}
if(instance_position(x + 16, y + 32, obj_ow_rock) != noone)
{ 
	var inst = instance_position(x + 16, y + 32, obj_ow_rock);
	if(inst.depthSet < depthSet){depthSet = inst.depthSet;}
}
if(instance_position(x - 32, y + 16, obj_ow_rock) != noone)
{ 
	var inst = instance_position(x - 32, y + 16, obj_ow_rock);
	if(inst.depthSet < depthSet){depthSet = inst.depthSet;}
}
if(instance_position(x + 32, y + 16, obj_ow_rock) != noone)
{ 
	var inst = instance_position(x + 32, y + 16, obj_ow_rock);
	if(inst.depthSet < depthSet){depthSet = inst.depthSet;}
}

depth = 1 + (10 * depthSet);
myShadow.depth = 2 + (10 * depthSet);

draw_self();

draw_text_color(x, y, depth, c_red, c_red, c_red, c_red, 1);