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
path_set_kind(myPath, 1); //sets path, 0 for straight 1 for smooth

depth = 998;
image_alpha = 0;

HP = 3;
stunned = false;

sprite_bbox_left = x +1;
sprite_bbox_top = y +1;
sprite_bbox_right = x + 31;
sprite_bbox_bottom = y + 31;

LOSconfirm = 0;

myShadow = instance_create_depth(x, y, depth, obj_ow_generic);
upObj = instance_create_depth(x, y, depth, obj_ow_generic);
upObj.sprite_index = sp_enemy_chaser_tadpole_bodyy;
downObj = instance_create_depth(x, y, depth, obj_ow_generic);
downObj.sprite_index = sp_chaser_tadpole_legs;

target = obj_ow_player_tank;
moveSpeed = 0.5;

endCellGen = 3;
startCellGen = (endCellGen - 1) /2;
tileTimer = 0;

//todo:
// X make attackable
// X add attack behavior
//	 add chase cutoff behavior
//	 add sight code back in
//	 add fidget behavior
//	 make sure it interacts with shadow_blocks correctly. should NOT be visible if in shadows

squareX = 0;
squareY = 0;

directionChange = 0;
drillable = true;