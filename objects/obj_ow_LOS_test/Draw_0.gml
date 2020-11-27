

var listMax = ds_list_size(LOS_list) + 1;

for(var i = 0; i < listMax; i ++)
{
	
	var target = LOS_list[|i];
	if(target = undefined)
	{}
	else
	{
	//draw_circle_color(target.x+16, target.y+16, 16, c_red, c_red, false);
	}
	//draw_text_color(x, y + i + 2 * 30, LOS_list[|i], c_red, c_red, c_red, c_red, 1);
}

ds_list_clear(LOS_list);