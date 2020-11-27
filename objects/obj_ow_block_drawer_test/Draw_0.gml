var u = ds_list_size(global.activeBlocks);

for(var i = 0; i < u; i++)
{
	depth = global.activeBlocks[|i].depth;
	var xx = global.activeBlocks[|i].x;
	var yy = global.activeBlocks[|i].y;
	
	x1 = xx;
	y1 = yy;
	x2 = xx + 32;
	y2 = yy;
	x3 = xx;
	y3 = yy+ 32;
	x4 = xx + 32;
	y4 = yy+ 32;
	
	dirc = point_direction(target.x + 15, target.y + 15, x1, y1)
	x11 = x1+lengthdir_x(600, dirc); 
	y11 = y1+lengthdir_y(600, dirc);
	
	dirc = point_direction(target.x + 15, target.y + 15, x2, y2)
	x21 = x2+lengthdir_x(600, dirc); 
	y21 = y2+lengthdir_y(600, dirc);
	
	dirc = point_direction(target.x + 15, target.y + 15, x3, y3)
	x31 = x3+lengthdir_x(600, dirc); 
	y31 = y3+lengthdir_y(600, dirc);
	
	dirc = point_direction(target.x + 15, target.y + 15, x4, y4)
	x41 = x4+lengthdir_x(600, dirc); 
	y41 = y4+lengthdir_y(600, dirc);
	
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
	depth = baseDepth;
	
}