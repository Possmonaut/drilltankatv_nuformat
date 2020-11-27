		var x1 = target.x + 12 + lengthdir_x(384,target.angleDir);
		var y1 = target.y + 12 + lengthdir_y(384,target.angleDir);

		var r = sc_collision_line_point(target.x+12, target.y+12, x1, y1, obj_ow_nopass, false, true);
		
		var x2 = target.x + 12 +lengthdir_x(point_distance(target.x+12,target.y+12,r[1],r[2]),target.angleDir-25);
		var y2 = target.y + 12 +lengthdir_y(point_distance(target.x+12,target.y+12,r[1],r[2]),target.angleDir-25);
		var x3 = target.x + 12 +lengthdir_x(point_distance(target.x+12,target.y+12,r[1],r[2]),target.angleDir+25);
		var y3 = target.y + 12 +lengthdir_y(point_distance(target.x+12,target.y+12,r[1],r[2]),target.angleDir+25);
		
		draw_triangle_color(target.x+12,target.y+12,x2,y2,x3,y3,c_white,c_black,c_black,false);
		
		draw_set_color(c_black);
		draw_line(target.x+12,target.y+12,r[1],r[2]);
		draw_set_color(c_white);
		
		if (r[0] != noone) {
		    // r[0] holds the nearest (hit) instance.
		}