


x=target.x+16;
y=target.y+16;

var scanOffsetX = tilemap_get_cell_x_at_pixel(global.Tiles_Shadow,x-512, y-512);
var scanOffsetY = tilemap_get_cell_y_at_pixel(global.Tiles_Shadow,x-512, y-512);

if(scanOffsetX < 0){scanOffsetX = 0;}
if(scanOffsetY < 0){scanOffsetY = 0;}


timer += 1;

if(timer > timerUpdate)
{
	update = true;
	timer = 0;
}

if(update = true)
{

for(var i = 0; i < 180; i ++)
{
	collision_line_list(x, y, x + lengthdir_x(sweepLength, rotateDir), y + lengthdir_y(sweepLength, rotateDir), obj_ow_nopass, false, true, radarList, true);
	var listLeng = ds_list_size(radarList);
	for(var o = 0; o <  listLeng; o ++)
	{
				var tlX = tilemap_get_cell_x_at_pixel(global.Tiles_1,radarList[|o].x,radarList[|o].y);
				var tlY = tilemap_get_cell_y_at_pixel(global.Tiles_1,radarList[|o].x,radarList[|o].y);
		
		if(tilemap_get(global.Tiles_1,tlX, tlY) > 0) 
		{ //^ if block tile beneath, is block, else, if not block and scan through
			if(o = losCheck) 
			{
			
				//var distLeng = floor(distance_to_point(radarList[|o].x+16,radarList[|o].y+16) / 32);
				ds_list_add(blockList,radarList[|o]); //if this is first block, it has DLOS
				scanGrid[# tlX-scanOffsetX, tlY-scanOffsetY] -= 1;
				//tilemap_set(global.Tiles_Shadow, 0, tlX, tlY);
			}
			else
			{
				//var distLeng = floor(distance_to_point(radarList[|o].x+16,radarList[|o].y+16) / 32);
				scanGrid[# tlX-scanOffsetX, tlY-scanOffsetY] += 1;
				
				//tilemap_set(global.Tiles_Shadow, 1, tlX, tlY);
				radarList[|o].myShadow.active = false;
			}
		}
		else
		{
			losCheck ++;
		}
	}
	
	losCheck = 0; 
	rotateDir += 2;
	ds_list_clear(radarList);
}


var listLeng2 = ds_list_size(blockList);

for(var p = 0; p < listLeng2; p ++)
{
		blockList[|p].myShadow.active = true;	
}



var xLeng = 64;
var yLeng = 64;

for(var xx = 0; xx < xLeng; xx++)
{
	for(var yy = 0; yy < yLeng; yy++)
	{
		if(scanGrid[# xx, yy] > 0) //if we no not have DLOS
		{
			
			var lCheck = instance_position((xx+scanOffsetX)*32, (yy+scanOffsetY)*32,obj_ow_auto_tile_test_block);
			
			tilemap_set(global.Tiles_Shadow, 1, xx+scanOffsetX, yy+scanOffsetY);
			
			
			
			if(lCheck != noone)
			{
				if(lCheck.lower = true)
				{
					scanGrid[# xx, yy+1] = 1;
				}
				
				if(lCheck.myShadow.active = true)
				{
				tilemap_set(global.Tiles_Shadow, 0, xx+scanOffsetX, yy+scanOffsetY);
				scanGrid[# xx, yy+1] = 0;
				}
				

			}
		}
		else
		{
			tilemap_set(global.Tiles_Shadow, 0, xx+scanOffsetX, yy+scanOffsetY);
			var lCheck = instance_position((xx+scanOffsetX)*32, (yy+scanOffsetY)*32,obj_ow_auto_tile_test_block);
			if(lCheck != noone)
			{
				if(target.y < lCheck.y+20) // might need tweaking 
				{
					scanGrid[# xx, yy+1] = 1;
				}
			}
			
			
			
		}
		
		
	}
}

for(var xx = 0; xx < xLeng; xx++)
{
	for(var yy = 0; yy < yLeng; yy++)
	{
		if(tilemap_get(global.Tiles_Shadow,xx+scanOffsetX,yy+scanOffsetY) = 0)
		{
			var tileDat = sc_autotile_image_48_0_tile(global.Tiles_Shadow,(xx+scanOffsetX)*32,(yy+scanOffsetY)*32);
			tilemap_set(global.Tiles_Shadow_Visual,global.tileFrameList[|tileDat],xx+scanOffsetX,yy+scanOffsetY); 
		}
	}
}


losCheck = 0;
rotateDir = 0; 
ds_list_clear(radarList);
ds_list_clear(blockList);
ds_grid_clear(scanGrid, 0);
update = false;

}