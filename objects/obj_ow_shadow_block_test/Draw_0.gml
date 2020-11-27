
	
	x1 = x;
	y1 = y;
	x2 = x + 32;
	y2 = y;
	x3 = x;
	y3 = y+ 32;
	x4 =x + 32;
	y4 = y+ 32;
	
	if(instance_position(x - 16, y + 16, obj_ow_shadow_block) = noone && instance_position(x + 16, y -16, obj_ow_shadow_block) = noone)
	{
	dirc = point_direction(target.x + 15, target.y + 15, x1, y1)
	x11 = x1+lengthdir_x(500, dirc); 
	y11 = y1+lengthdir_y(500, dirc);
	}
	else
	{
		x11 = x1+lengthdir_x(500, scr_angleRounder(dirc)); 
		y11 = y1+lengthdir_y(500, scr_angleRounder(dirc)); //later you can probably change this to ROUND the dir to one of 4 cardinal directions using a script
	}
	
	//2
	if(instance_position(x + 48, y + 16, obj_ow_shadow_block) = noone && instance_position(x + 16, y -16, obj_ow_shadow_block) = noone)
	{
	dirc = point_direction(target.x + 15, target.y + 15, x2, y2)
	x21 = x2+lengthdir_x(500, dirc); 
	y21 = y2+lengthdir_y(500, dirc);
	}
	else
	{
		x21 = x2+lengthdir_x(500, scr_angleRounder(dirc)); 
		y21 = y2+lengthdir_y(500, scr_angleRounder(dirc));
	}
	
	if(instance_position(x + 48, y + 16, obj_ow_shadow_block) = noone && instance_position(x + 16, y + 48, obj_ow_shadow_block) = noone)
	{
	dirc = point_direction(target.x + 15, target.y + 15, x3, y3)
	x31 = x3+lengthdir_x(500, dirc); 
	y31 = y3+lengthdir_y(500, dirc);
	}
	else
	{
		x31 = x3+lengthdir_x(500, scr_angleRounder(dirc)); 
		y31 = y3+lengthdir_y(500, scr_angleRounder(dirc));
	}
	
	if(instance_position(x -16, y + 16, obj_ow_shadow_block) = noone && instance_position(x + 16, y + 48, obj_ow_shadow_block) = noone)
	{
	dirc = point_direction(target.x + 15, target.y + 15, x4, y4)
	x41 = x4+lengthdir_x(500, dirc); 
	y41 = y4+lengthdir_y(500, dirc);
	}
	else
	{
		x41 = x4+lengthdir_x(500, scr_angleRounder(dirc)); 
		y41 = y4+lengthdir_y(500, scr_angleRounder(dirc));
	}
	
	draw_set_color(c_black);
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex(x1, y1); //this sets the point of the triagnle
	draw_vertex(x11, y11);
	draw_vertex(x2, y2);
	draw_vertex(x21, y21);
	draw_vertex(x3, y3);
	draw_vertex(x31, y31);
	draw_vertex(x4, y4);
	draw_vertex(x41, y41);
	draw_vertex(x1, y1); //this clsoes the shape
	draw_vertex(x11, y11);
	draw_primitive_end();
	draw_set_color(c_white);