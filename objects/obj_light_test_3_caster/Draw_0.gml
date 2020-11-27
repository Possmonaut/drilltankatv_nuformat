//draw_shadows

//clear list
var listSz = ds_grid_height(pointListXYAng);

for(var i = 0; i < listSz; i ++)
{
	if(pointListXYAng[# 2, i] = undefined || pointListXYAng[# 2, i] = 0)
	{
		draw_triangle_color(x,y,pointListXYAng[# 0, i-1],pointListXYAng[# 1, i-1],pointListXYAng[# 0, 0],pointListXYAng[# 1, 0],c_white,c_white,c_white,false);
		break;
	}
	else
	{
		
	//var xx =  lengthdir_x();
	
	draw_line_color(x,y,pointListXYAng[# 0, i],pointListXYAng[# 1, i],c_red,c_red);
	
	draw_triangle_color(x,y,pointListXYAng[# 0, i],pointListXYAng[# 1, i],pointListXYAng[# 0, i+1],pointListXYAng[# 1, i+1],c_white,c_white,c_white,false);
	}

	//have it, if hitting 0, exit the for loop and continue on below 
	
}

for(var i = 0; i < ds_list_size(pointCheck); i++)
{
	draw_text(0,i*8,pointCheck[|i]);
}

for(var i = 0; i < ds_grid_height(pointListXYAng); i++)
{
	draw_text(128,i*8,pointListXYAng[# 0,i]);
	draw_text(256,i*8,pointListXYAng[# 1,i]);
	draw_text(384,i*8,pointListXYAng[# 2,i]);
}

ds_list_clear(pointCheck);
ds_grid_clear(pointListXYAng,0);