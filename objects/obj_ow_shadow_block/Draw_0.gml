	/*
	x1= x;		//x-bwx/2; //top left
	y1= y -8;  //y-bwy/2; previously - 8
	x2= x + 32; //x-bwx/2; //top right
	y2= y -8;	//y+bwy/2; // previously - 8

	if(target.y <= y)
	{
	
	
	x3= x + 32; //x+bwx/2; //bot right
	y3= y + 40; //y+bwy/2;
	x4= x; //x+bwx/2; //bot left
	y4= y+ 40; //y-bwy/2;
	
	
	}
	else
	{
	x3= x + 32; //x+bwx/2; //bot right
	y3= y + 24; //y+bwy/2;
	x4= x; //x+bwx/2; //bot left
	y4= y + 24; //y-bwy/2;
	}
	*/
	 //delet this
	 
	draw_self();
	
	
	if(active = true)
	{
	x1 = x;
	y1 = y-8;
	x2 = x + 32;
	y2 = y -8;
	x3 = x;
	y3 = y+ 40;
	x4 =x + 32;
	y4 = y+ 40;
	
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
	}
