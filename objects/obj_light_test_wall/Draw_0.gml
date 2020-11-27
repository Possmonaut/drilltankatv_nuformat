	if(distance_to_point(mouse_x,mouse_y) < radius)
{
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
}



