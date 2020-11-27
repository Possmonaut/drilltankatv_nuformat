function scr_blast_13(argument0, argument1) {
	var xTar = argument0;
	var yTar = argument1;

	instance_create_depth(xTar, yTar, depth, obj_ow_blast_damage);
	instance_create_depth(xTar, yTar - 32, depth, obj_ow_blast_damage); //up cetner
	instance_create_depth(xTar, yTar + 32, depth, obj_ow_blast_damage); //down cetner
	instance_create_depth(xTar - 32, yTar, depth, obj_ow_blast_damage); //left center
	instance_create_depth(xTar + 32, yTar, depth, obj_ow_blast_damage); //right center
	instance_create_depth(xTar + 32, yTar - 32, depth, obj_ow_blast_damage); //upright
	instance_create_depth(xTar - 32, yTar -32, depth, obj_ow_blast_damage); //upleft
	instance_create_depth(xTar -32, yTar + 32, depth, obj_ow_blast_damage); //downleft
	instance_create_depth(xTar +32, yTar + 32, depth, obj_ow_blast_damage); //downright
	instance_create_depth(xTar + 64, yTar, depth, obj_ow_blast_damage); //rightright
	instance_create_depth(xTar - 64, yTar, depth, obj_ow_blast_damage); //leftleft
	instance_create_depth(xTar, yTar + 64, depth, obj_ow_blast_damage); //downdown
	instance_create_depth(xTar, yTar - 64, depth, obj_ow_blast_damage); //upup




}
