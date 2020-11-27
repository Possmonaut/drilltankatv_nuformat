draw_circle(mouse_x,mouse_y,8,false);

var listLength = ds_list_size(blockList);
var listyResisty = ds_list_size(verticeListX);

//draw_text(x,y+20, dir1);
//draw_text(x,y+40, dir2);
//draw_text(x,y+60, dir3);
//draw_text(x,y+80, dir4);

/*
for(var i = 0; i < listyResisty +1; i ++)
{
	draw_text(x-500, y + 32 * (i +1),verticeListX[|i]);
	draw_text(x-436, y + 32 * (i +1),verticeListY[|i]);
}
/*




/*
for(var p = 0; p <listyResisty +1; p++)
{
	if(verticeListX[|p] = undefined)
	{}
	else
	{
		draw_primitive_begin(pr_trianglestrip);
		draw_vertex(x,y);
		draw_vertex(verticeListX[|p],verticeListY[|p]);
		if(p=0)
		{
		draw_vertex(verticeListX[|listyResisty-1],verticeListY[|listyResisty-1]);
		}
		else
		{
		draw_vertex(verticeListX[|p-1],verticeListY[|p-1]);
		}
		draw_primitive_end();
		
	}
}
*/

for(var o = 0; o < listyResisty +1; o ++)
{
	if(verticeListX[|o] = undefined)
	{}
	else
	{
	//draw_circle(verticeListX[|o],verticeListY[|o],8,false);
	draw_line_color(x,y,verticeListX[|o],verticeListY[|o],c_white,c_white);
	draw_text_color(verticeListX[|o],verticeListY[|o],o,c_red,c_red,c_red,c_red,1);
	}
}

var xx = x+lengthdir_x(256,radar_graphic);
var yy = y+lengthdir_y(256,radar_graphic);

draw_line_color(x,y,xx,yy,c_red,c_red);
draw_text_color(x,y,radar_graphic,c_red,c_red,c_red,c_red,1);
radar_graphic ++;
if(radar_graphic > 360)
{
	radar_graphic = 0;
}

/*
for(var o = 0; o < listyResisty +1; o ++)
{
	if(verticeListX[|o] = undefined)
	{}
	else
	{
	
	draw_text_color(verticeListX[|o],verticeListY[|o],o,c_red,c_red,c_red,c_red,1);
	}
}

var angle = point_direction(x,y,obj_ow_lightsysmk2_test_block.x+16,obj_ow_lightsysmk2_test_block.y+16)
//draw_line_color(x,y,dir1.x+16,dir1.y+16,c_red,c_red);

draw_text_color(x - 16,y-16,angle,c_red,c_red,c_red,c_red,1);
*/



draw_text(x,y-64,drawPlus);
drawPlus = 0;


//last but not least, you're drawing the VISIBLE AREAS. meaning you'll need to use a black surface and white 
//triangles to get it to look right 