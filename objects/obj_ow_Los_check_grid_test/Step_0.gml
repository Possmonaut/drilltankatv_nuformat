
x=target.x+16;
y=target.y+16;

var scanOffsetX = tilemap_get_cell_x_at_pixel(global.Tiles_Shadow,x-512, y);
var scanOffsetY = tilemap_get_cell_y_at_pixel(global.Tiles_Shadow,x, y-512);

squareX = round(target.x / 32) * 32;
squareY = round(target.y / 32) * 32;

if(targetTileX != squareX || targetTileY != squareY)
{
	targetTileX = squareX;
	targetTileY = squareY;
	update = true;
}

if(update = true)
{

ds_grid_clear(losGrid, 0);

for(var xx = 0; xx < 32; xx ++)
{
	for(var yy = 0; yy < 32; yy ++)
	{
		tilemap_set(global.Tiles_Shadow_Visual,0,xx+scanOffsetX,yy+scanOffsetY);
		tilemap_set(global.Tiles_Shadow,0,xx+scanOffsetX,yy+scanOffsetY);
		
	}
}

for(var xx = 0; xx < 32; xx ++)
{
	for(var yy = 0; yy < 32; yy ++)
	{		
		if(tilemap_get(global.Tiles_1,xx+scanOffsetX,yy+scanOffsetY) > 0)
		{
			losCheck = 0;
			var strtBlock = instance_position((xx+scanOffsetX)*32,(yy+scanOffsetY)*32,obj_ow_auto_tile_test_block);

			if(strtBlock != noone) 
			{
				with (strtBlock)
				{
					
			var q = obj_ow_Los_check_grid_test;
			//if(collision_line(strtBlock.x-1,strtBlock.y-1,squareX+15.5,squareY+15.5,obj_ow_auto_tile_test_block,false,true) == noone){losCheck ++;}
			//if(collision_line(strtBlock.x+33,strtBlock.y-1,squareX+15.5,squareY+15.5,obj_ow_auto_tile_test_block,false,true) == noone){losCheck ++;}
			//if(collision_line(strtBlock.x-1,strtBlock.y+33,squareX+15.5,squareY+15.5,obj_ow_auto_tile_test_block,false,true) == noone){losCheck ++;}
			//if(collision_line(strtBlock.x+33,strtBlock.y+33,squareX+15.5,squareY+15.5,obj_ow_auto_tile_test_block,false,true) == noone){losCheck ++;}
			if(collision_line(strtBlock.x,strtBlock.y,q.squareX+15.5,q.squareY+15.5,obj_ow_auto_tile_test_block,false,true) == noone){q.losCheck ++;}
			if(collision_line(strtBlock.x+31,strtBlock.y,q.squareX+15.5,q.squareY+15.5,obj_ow_auto_tile_test_block,false,true) == noone){q.losCheck ++;}
			if(collision_line(strtBlock.x,strtBlock.y+31,q.squareX+15.5,q.squareY+15.5,obj_ow_auto_tile_test_block,false,true) == noone){q.losCheck ++;}
			if(collision_line(strtBlock.x+31,strtBlock.y+31,q.squareX+15.5,q.squareY+15.5,obj_ow_auto_tile_test_block,false,true) == noone){q.losCheck ++;}
				}
			
			if(losGrid[# xx,yy] != 0)
			{
				
			}
			else
			{
			
			if(tilemap_get(global.Tiles_1,xx+scanOffsetX,yy+scanOffsetY+1) = 0)
			{
				if(losCheck > 0)
				{
					losGrid[# xx,yy] = 1; //DLOS + Lower
					strtBlock.shadowActive = true;
					

					if(target.y < strtBlock.y+20)
					{

					}
				}
				else
				{
					losGrid[# xx,yy] = 2; //NLOS + Lower
					strtBlock.shadowActive = false;
				}
			}
			else
			{	
				if(losCheck > 0)
				{
					losGrid[# xx,yy] = 3; //DLOS + no lower
					strtBlock.shadowActive = true;
				}
				else
				{
					losGrid[# xx,yy] = 4; //NLOS + no lower
					strtBlock.shadowActive = false;
				}
				
			}
			
			}
			
		}
		
		}
		else
		{
			if(collision_line(((xx+scanOffsetX) * 32) + 16, ((yy+scanOffsetY) * 32) + 16,squareX+16,squareY+16,obj_ow_nopass,false,false) != noone)
			{
				tilemap_set(global.Tiles_Shadow,1, xx+scanOffsetX,yy+scanOffsetY);
			}
		}
	}
}

losCheck = 0;
update = false;
}