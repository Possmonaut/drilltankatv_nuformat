
var listyResisty = ds_list_size(verticeListX);
for(var i = 0; i < listyResisty; i ++)
{
	draw_text(0, 32 * (i +1),verticeListX[|i]);
	draw_text(64, 32 * (i +1),verticeListY[|i]);
}


for(var o = 0; o < 4; o++)
{
	draw_text_color(128,32 * (o +1),pointSortGrid[# 0,o],c_red,c_red,c_red,c_red,1);
	draw_text_color(192,32 * (o +1),pointSortGrid[# 1,o],c_red,c_red,c_red,c_red,1);
	draw_text_color(256,32 * (o +1),pointSortGrid[# 2,o],c_red,c_red,c_red,c_red,1);
	draw_text_color(320,32 * (o +1),pointSortGrid[# 3,o],c_red,c_red,c_red,c_red,1);
}

pPlus = 0;
ds_list_clear(blockList);
ds_list_clear(verticeListX);
ds_list_clear(verticeListY);