if(distance_to_point(mouse_x,mouse_y) < radius)
{
	x1= x-bwx/2;
	y1= y-bwy/2;
	x2= x-bwx/2;
	y2= y+bwy/2;
	x3= x+bwx/2;
	y3= y+bwy/2;
	x4= x+bwx/2;
	y4= y-bwy/2;
	
	dirc = point_direction(mouse_x, mouse_y, x1, y1)
	x11 = x1+lengthdir_x(500, dirc); 
	y11 = y1+lengthdir_y(500, dirc);
	
	dirc = point_direction(mouse_x, mouse_y, x2, y2)
	x21 = x2+lengthdir_x(500, dirc); 
	y21 = y2+lengthdir_y(500, dirc);
	
	dirc = point_direction(mouse_x, mouse_y, x3, y3)
	x31 = x3+lengthdir_x(500, dirc); 
	y31 = y3+lengthdir_y(500, dirc);
	
	dirc = point_direction(mouse_x, mouse_y, x4, y4)
	x41 = x4+lengthdir_x(500, dirc); 
	y41 = y4+lengthdir_y(500, dirc);
}
