
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

if(instance_exists(o_tutorial_elevator_2))
{
	exit;
}

if(update = true)
{

ds_grid_clear(losGrid, 0);

for(var xx = 0; xx < 32; xx ++)
{
	for(var yy = 0; yy < 32; yy ++)
	{
		tilemap_set(global.Tiles_Shadow,0,xx+scanOffsetX,yy+scanOffsetY);
	}
}

for(var xx = 0; xx < 32; xx ++)
{
	for(var yy = 0; yy < 32; yy ++)
	{		
		if(DLOStrig = true)
		{
		if(tilemap_get(global.Tiles_1,xx+scanOffsetX,yy+scanOffsetY) > 0)
		{
			losCheck = 0;
			var strtBlock = instance_position((xx+scanOffsetX)*32,(yy+scanOffsetY)*32,obj_ow_nopass_enemy);

			if(strtBlock != noone) 
			{
				with (strtBlock)
				{
					
			var q = obj_ow_Los_check_grid_dark;
			var uofst = q.uofst;
			var dofst = q.dofst;
			
			if(collision_line(strtBlock.x+uofst,strtBlock.y+uofst,q.squareX+uofst,q.squareY+uofst,obj_ow_nopass_enemy,false,true) == noone){q.losCheck ++;}
			if(collision_line(strtBlock.x+dofst,strtBlock.y+uofst,q.squareX+dofst,q.squareY+uofst,obj_ow_nopass_enemy,false,true) == noone){q.losCheck ++;}
			if(collision_line(strtBlock.x+uofst,strtBlock.y+dofst,q.squareX+uofst,q.squareY+dofst,obj_ow_nopass_enemy,false,true) == noone){q.losCheck ++;}
			if(collision_line(strtBlock.x+dofst,strtBlock.y+dofst,q.squareX+dofst,q.squareY+dofst,obj_ow_nopass_enemy,false,true) == noone){q.losCheck ++;}
			
				}
			}
				if(losCheck > 0)
				{
				}
				else
				{
					if(collision_line(((xx+scanOffsetX) * 32) + 16, ((yy+scanOffsetY) * 32) + 16,squareX+16,squareY+16,obj_ow_nopass_enemy,false,false) != noone)
					{
						tilemap_set(global.Tiles_Shadow,1, xx+scanOffsetX,yy+scanOffsetY);
						var b = irandom(5000);
						if(b = 0)
						{
							instance_create_depth((xx+scanOffsetX) * 32,(yy+scanOffsetY) * 32,-2,obj_ow_ping_fake);
						}
					}
				}
		}
		else
		{
			if(collision_line(((xx+scanOffsetX) * 32) + 16, ((yy+scanOffsetY) * 32) + 16,squareX+16,squareY+16,obj_ow_nopass_enemy,false,false) != noone)
					{
						tilemap_set(global.Tiles_Shadow,1, xx+scanOffsetX,yy+scanOffsetY);
					}
		}
		}
		else
		{
			if(collision_line(((xx+scanOffsetX) * 32) + 16, ((yy+scanOffsetY) * 32) + 16,squareX+16,squareY+16,obj_ow_nopass_enemy,false,false) != noone)
					{
						tilemap_set(global.Tiles_Shadow,1, xx+scanOffsetX,yy+scanOffsetY);
					}
		}
			
	}
}

losCheck = 0;
update = false;
}