draw_circle(mouse_x,mouse_y,8,false);

var listLength = ds_list_size(blockList);
var listyResisty = ds_list_size(verticeListX);

//draw_text(x,y+20, dir1);
//draw_text(x,y+40, dir2);
//draw_text(x,y+60, dir3);
//draw_text(x,y+80, dir4);

/*
for(var i = 0; i < listLength +1; i ++)
{
	draw_text(x, y+32*(i +1),blockList[|i]);
}
*/
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
	draw_line_color(x,y,verticeListX[|o],verticeListY[|o],c_red,c_red);
	}
}

for(var o = 0; o < listyResisty +1; o ++)
{
	if(verticeListX[|o] = undefined)
	{}
	else
	{
	
	draw_text_color(verticeListX[|o],verticeListY[|o],o,c_red,c_red,c_red,c_red,1);
	}
}





ds_list_clear(blockList);
ds_list_clear(verticeListX);
ds_list_clear(verticeListY);

//last but not least, you're drawing the VISIBLE AREAS. meaning you'll need to use a black surface and white 
//triangles to get it to look right 