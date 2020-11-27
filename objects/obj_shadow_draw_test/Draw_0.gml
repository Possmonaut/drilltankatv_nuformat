var srcSize = ds_list_size(global.activeBlocks);
timer ++;

if(!surface_exists(dynamShadows))
{
	dynamShadows = surface_create(1024,768);
	surface_set_target(dynamShadows);
	surface_reset_target();
}
else
{
	
	if (surface_exists(dynamShadows)) 
	{
		var origX = camTarg.x-512;
		var origY = camTarg.y-384;
		
		surface_set_target(dynamShadows);
		draw_clear_alpha(c_white,0);
		draw_set_color(c_black);
		
		for(var i = 0; i < srcSize; i ++)
		{
		
		var q = global.activeBlocks[|i];
		
		if(instance_exists(q))
		{
		
		if(q.shadowActive = true)
		{
		
		x1 = q.x;
		y1 = q.y;
		x2 = q.x + 32;
		y2 = q.y;
		x3 = q.x;
		y3 = q.y+ 64;
		x4 = q.x + 32;
		y4 = q.y+ 64;
	
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
		draw_vertex(x1-origX, y1-origY); //this sets the point of the triagnle
		draw_vertex(x11-origX, y11-origY);
		draw_vertex(x2-origX, y2-origY);
		draw_vertex(x21-origX, y21-origY);
		draw_vertex(x3-origX, y3-origY);
		draw_vertex(x31-origX, y31-origY);
		draw_vertex(x4-origX, y4-origY);
		draw_vertex(x41-origX, y41-origY);
		draw_vertex(x1-origX, y1-origY); //this clsoes the shape
		draw_vertex(x11-origX, y11-origY);
		draw_primitive_end();
		draw_rectangle(x1-origX,y1-origY,x4-origX-1,y4-origY-1,false);
		
		draw_set_color(c_white);
		}
		}
		}
	
		surface_reset_target();
		draw_surface(dynamShadows,origX,origY);
		//surface_copy(shadow,0,0,application_surface);
	}
}