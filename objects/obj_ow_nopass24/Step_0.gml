if(distance_to_point(target.x + 16, target.y + 16) <= 448) //384
{
	line_detect_list = ds_list_create();
	LOSconfirm1 += collision_line_list(x + 1, y+2, target.x +1, target.y + 2, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm2 += collision_line_list(x + 31, y+2, target.x +31, target.y + 2, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm3 += collision_line_list(x + 1, y+30, target.x +1, target.y + 30, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm4 += collision_line_list(x + 30, y+30, target.x +30, target.y + 30, obj_ow_nopass, false, true, line_detect_list, false);
	
	LOSconfirm = LOSconfirm1 + LOSconfirm2 + LOSconfirm3 + LOSconfirm4;
	
	ds_list_destroy(line_detect_list);
	draw_shadows = true;
}
/*
LOSconfirm1 += collision_line_list(x + 1, y+1, target.x +1, target.y + 1, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm2 += collision_line_list(x + 31, y+2, target.x +31, target.y + 2, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm3 += collision_line_list(x + 2, y+31, target.x +2, target.y + 31, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm4 += collision_line_list(x + 31, y+32, target.x +31, target.y + 32, obj_ow_nopass, false, true, line_detect_list, false);