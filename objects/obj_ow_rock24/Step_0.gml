if(distance_to_point(target.x + 16, target.y + 16) <= 448) //384
{
	line_detect_list = ds_list_create();
	
	LOSconfirm1 += collision_line_list(x + x1, y +y1, target.x+x5, target.y+y5, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm2 += collision_line_list(x + x2, y +y2, target.x+x6, target.y+y6, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm3 += collision_line_list(x + x3, y +y3, target.x+x7, target.y+y7, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm4 += collision_line_list(x + x4, y +y4, target.x+x8, target.y+y8, obj_ow_nopass, false, true, line_detect_list, false);
	
	LOSconfirm5 += collision_line_list(x + 15, y +15, target.x+15, target.y+15, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm5 += collision_line_list(x + 15, y +16, target.x+15, target.y+16, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm5 += collision_line_list(x + 16, y +15, target.x+16, target.y+15, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm5 += collision_line_list(x + 16, y +16, target.x+16, target.y+16, obj_ow_nopass, false, true, line_detect_list, false);
	
	//LOSconfirm1 += collision_line_list(x + 16, y +16, target.x+16, target.y+16, obj_ow_nopass, false, true, line_detect_list, false);

	if(LOSconfirm5 > 1){LOSconfirm5 = 4};
	
	LOSconfirm = LOSconfirm1 + LOSconfirm2 + LOSconfirm3 + LOSconfirm4 + LOSconfirm5;
	
	
		if(LOSconfirm5 = 0)
		{LOSconfirm --;}
	
	
	ds_list_destroy(line_detect_list);
	draw_shadows = true;
}
/*
LOSconfirm1 += collision_line_list(x + 1, y+1, target.x +1, target.y + 1, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm2 += collision_line_list(x + 31, y+2, target.x +31, target.y + 2, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm3 += collision_line_list(x + 2, y+31, target.x +2, target.y + 31, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm4 += collision_line_list(x + 31, y+32, target.x +31, target.y + 32, obj_ow_nopass, false, true, line_detect_list, false);
	
	//magic numbers:
	LOSconfirm1 += collision_line_list(x +1, y +2, target.x+17 , target.y+18, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm2 += collision_line_list(x + 31, y +2, target.x+15, target.y+18, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm3 += collision_line_list(x , y+38, target.x+16, target.y+14, obj_ow_nopass, false, true, line_detect_list, false);
	LOSconfirm4 += collision_line_list(x + 30, y+38, target.x+14, target.y+14, obj_ow_nopass