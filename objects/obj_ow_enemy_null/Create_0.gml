state = 0; //change this back to zero 
detectRadius = 160;
outOfRange = 256;
detectTimer = 0;
timer = 0;
moveTimer = 0;
target = obj_ow_player_tank;
//0 = idly moving / detect searching
//1 = chasing

myPath = path_add();
path_set_kind(myPath, 0);

depth = 30;

HP = 3;
stunned = false;

sprite_bbox_left = x +1;
sprite_bbox_top = y +1;
sprite_bbox_right = x + 31;
sprite_bbox_bottom = y + 31;

LOSconfirm = 0;

myShadow = instance_create_depth(x, y, depth, obj_ow_generic);
upObj = instance_create_depth(x, y, depth, obj_ow_generic);
downObj = instance_create_depth(x, y, depth, obj_ow_generic);

target = obj_ow_player_tank;

//todo:
// X make attackable
// X add attack behavior
//	 add chase cutoff behavior
//	 add sight code back in
//	 add fidget behavior
//	 make sure it interacts with shadow_blocks correctly. should NOT be visible if in shadows