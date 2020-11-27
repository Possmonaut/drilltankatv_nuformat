
draw_self();
//scan local blocks like instantiator
//on each block, check local sides
//if nothing detected local in grid, draw side
//add diagonals later 

squareX = round(target.x / 32) * 32;
squareY = round(target.y / 32) * 32;

scanCheck = false;

if(scanCheck = false)
{
	for(var xx = 0; xx < endCellGen; xx ++)
	{
		for(var yy = 0; yy < endCellGen; yy ++)
		{
		
			var posX = squareX - (32 * (startCellGen - xx));//change these values to lengthen the box. later on, add a var to change these more easily
			var posY = squareY - (32 * (startCellGen - yy));
			var temp1 = tilemap_get_at_pixel(global.Tiles_1,posX, posY);
			var temp2 = tile_get_index(temp1);

			if(temp2 > 0 && temp2 < arrayMax)
			{	
				var x1 = tilemap_get_cell_x_at_pixel(global.Tiles_1, posX, posY);
				var y1 = tilemap_get_cell_y_at_pixel(global.Tiles_1, posX, posY);
			
				if(tilemap_get(global.Tiles_1,x1-1,y1) > 0 && tilemap_get(global.Tiles_1,x1-1,y1) < arrayMax) //left
				{}
				else
				{
					draw_line(posX,posY,posX,posY+32);
				}
				
				if(tilemap_get(global.Tiles_1,x1+1,y1) > 0 && tilemap_get(global.Tiles_1,x1+1,y1) < arrayMax) //right
				{}
				else
				{
					draw_line(posX+32,posY,posX+32,posY+32);
				}
				
				if(tilemap_get(global.Tiles_1,x1,y1-1) > 0 && tilemap_get(global.Tiles_1,x1,y1-1) < arrayMax) //up
				{}
				else
				{
					draw_line(posX,posY,posX+32,posY);
				}
				
				if(tilemap_get(global.Tiles_1,x1,y1+1) > 0 && tilemap_get(global.Tiles_1,x1,y1+1) < arrayMax) //down
				{}
				else
				{
					draw_line(posX,posY+32,posX+32,posY+32);
				}
				
			}
		}
	}
}

draw_rectangle(x,y,x+32,y+32,true);