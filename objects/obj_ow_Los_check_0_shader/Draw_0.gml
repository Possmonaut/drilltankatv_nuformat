depth = -10;

var tlX = tilemap_get_at_pixel(global.Tiles_Shadow,mouse_x,mouse_y);

//draw_text(mouse_x-16,mouse_y-16,tlX);

var scanOffsetX = tilemap_get_cell_x_at_pixel(global.Tiles_Shadow,x-512, y-512);
var scanOffsetY = tilemap_get_cell_y_at_pixel(global.Tiles_Shadow,x-512, y-512);

if(scanOffsetX < 0){scanOffsetX = 0;}
if(scanOffsetY < 0){scanOffsetY = 0;}


draw_text(x,y,scanOffsetX);
draw_text(x,y+32,scanOffsetY);

/*
var xLeng = 64;
var yLeng = 64;

for(var xx = 0; xx < xLeng; xx++)
{
	for(var yy = 0; yy < yLeng; yy++)
	{
draw_text((xx+scanOffsetX)*32,(yy+scanOffsetY)*32,scanGrid[# xx, yy]);

	}
}

ds_grid_clear(scanGrid, 0);