draw_self();

if(collision_line(x + x1, y +y1, target.x+x5, target.y+y5, obj_ow_nopass, false, true) = noone){LOSconfirm ++;}
if(collision_line(x + x2, y +y2, target.x+x6, target.y+y6, obj_ow_nopass, false, true) = noone){LOSconfirm ++;}
if(collision_line(x + x3, y +y3, target.x+x7, target.y+y7, obj_ow_nopass, false, true) = noone){LOSconfirm ++;}
if(collision_line(x + x4, y +y4, target.x+x8, target.y+y8, obj_ow_nopass, false, true) = noone){LOSconfirm ++;}

if(position_meeting(mouse_x, mouse_y, id) = true)
{

	//draw_line_color(x + x1, y +y1, target.x+x5, target.y+y5,c_red, c_red);
	//draw_line_color(x + x2, y +y2, target.x+x6, target.y+y6,c_red, c_red);
	//draw_line_color(x + x3, y +y3, target.x+x7, target.y+y7,c_red, c_red);
	//draw_line_color(x + x4, y +y4, target.x+x8, target.y+y8,c_red, c_red);
	//draw_line_color(x+16, y+16, target.x+16, target.y+16, c_red, c_red);
	
	draw_text_color(x + 28, y +40, LOSconfirm, c_red, c_red, c_red, c_red, 1);
	//draw_text_color(x + 40, y +40, ring_depth_list[|1], c_red, c_red, c_red, c_red, 1);
//	draw_text_color(x + 28, y +60, ring_depth_list[|2], c_red, c_red, c_red, c_red, 1);
	//draw_text_color(x + 40, y +60, ring_depth_list[|3], c_red, c_red, c_red, c_red, 1);
	//draw_text_color(x + 28, y +80, ring_depth_list[|4], c_red, c_red, c_red, c_red, 1);
	//draw_text_color(x + 40, y +80, ring_depth_list[|5], c_red, c_red, c_red, c_red, 1);

}

LOSconfirm = 0;