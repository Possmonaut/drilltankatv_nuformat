x = mouse_x;
y = mouse_y;

squareX = round(x/ 32) * 32;
squareY = round(y / 32) * 32;

for(var xx = 0; xx < endCellGen; xx ++)
	{
		for(var yy = 0; yy < endCellGen; yy ++)
		{
		
			var posX = squareX - (32 * (startCellGen - xx));//change these values to lengthen the box. later on, add a var to change these more easily
			var posY = squareY - (32 * (startCellGen - yy));

			if(instance_position(posX, posY, obj_light_test_3_block) != noone)
			{
				ds_list_add(pointCheck,instance_position(posX, posY, obj_light_test_3_block));
			}
		}
	}
	
	
var listSz = ds_list_size(pointCheck);
	
for(var i = 0; i < listSz; i++)
{
	var c = i*4;
	if(collision_line(x,y,pointCheck[|i].bbox_left-1,pointCheck[|i].bbox_top-1,obj_light_test_3_block,false,true,) = noone)
	{
		//check if going from bbox val to a lengthdir in a straight direction 
		
		pointListXYAng[# 0,c] = pointCheck[|i].bbox_left;
		pointListXYAng[# 1,c] = pointCheck[|i].bbox_top;
		pointListXYAng[# 2,c] = point_direction(x,y,pointCheck[|i].bbox_left,pointCheck[|i].bbox_top);

		c++;
	}
	if(collision_line(x,y,pointCheck[|i].bbox_left-1,pointCheck[|i].bbox_bottom+1,obj_light_test_3_block,false,true) = noone)
	{
		pointListXYAng[# 0,c] = pointCheck[|i].bbox_left;
		pointListXYAng[# 1,c] = pointCheck[|i].bbox_bottom;
		pointListXYAng[# 2,c] = point_direction(x,y,pointCheck[|i].bbox_left,pointCheck[|i].bbox_bottom);
		c++;
	}
	if(collision_line(x,y,pointCheck[|i].bbox_right+1,pointCheck[|i].bbox_top,obj_light_test_3_block,false,true) = noone)
	{
		pointListXYAng[# 0,c] = pointCheck[|i].bbox_right;
		pointListXYAng[# 1,c] = pointCheck[|i].bbox_top;
		pointListXYAng[# 2,c] = point_direction(x,y,pointCheck[|i].bbox_right,pointCheck[|i].bbox_top);
		c++;
	}
	if(collision_line(x,y,pointCheck[|i].bbox_right+1,pointCheck[|i].bbox_bottom+1,obj_light_test_3_block,false,true) = noone)
	{
		pointListXYAng[# 0,c] = pointCheck[|i].bbox_right;
		pointListXYAng[# 1,c] = pointCheck[|i].bbox_bottom;
		pointListXYAng[# 2,c] = point_direction(x,y,pointCheck[|i].bbox_right,pointCheck[|i].bbox_bottom);
		c++;
	}
}
	
//this adds the last four corners, either of the map, or the four corners of the block check 
if(collision_line(x,y,0,0,obj_light_test_3_block,false,true) = noone)
{
		pointListXYAng[# 0,129] = 0;
		pointListXYAng[# 1,129] = 0;
		pointListXYAng[# 2,129] = point_direction(x,y,0,0);
}
if(collision_line(x,y,room_height,0,obj_light_test_3_block,false,true) = noone)
{
		pointListXYAng[# 0,130] = room_width;
		pointListXYAng[# 1,130] = 0;
		pointListXYAng[# 2,130] = point_direction(x,y,room_width,0);
}
if(collision_line(x,y,0,room_height,obj_light_test_3_block,false,true) = noone)
{
		pointListXYAng[# 0,131] = 0;
		pointListXYAng[# 1,131] = room_height;
		pointListXYAng[# 2,131] = point_direction(x,y,0,room_height);
}
if(collision_line(x,y,room_width,room_height,obj_light_test_3_block,false,true) = noone)
{
		pointListXYAng[# 0,128] = room_width;
		pointListXYAng[# 1,128] = room_height;
		pointListXYAng[# 2,128] = point_direction(x,y,room_width,room_height);
}

ds_grid_sort(pointListXYAng,2,false);

//sort

//go to draw to draw shadows