
//choose starting point for the scan
x=target.x+14; 
y=target.y+14;

//round to current tile position
squareX = round(target.x / 32) * 32;
squareY = round(target.y / 32) * 32;

//if we moved a tile, it's time to update 
if(targetTileX != squareX || targetTileY != squareY)
{
	targetTileX = squareX;
	targetTileY = squareY;
	update = true;
}

if(update = true)
{
	for(var xx = 0; xx < endCellGen; xx ++)
	{
		for(var yy = 0; yy < endCellGen; yy ++)
		{
		
			var posX = squareX - (32 * (startCellGen - xx));//change these values to lengthen the box. later on, add a var to change these more easily
			var posY = squareY - (32 * (startCellGen - yy));
			
			//note: you can probably clean this up so it's not reading the pixel than translating to tile
			//can probably interact directly with tile 
			
			
			var tsX = tilemap_get_cell_x_at_pixel(global.Tiles_1,posX, posY);
			var tsY = tilemap_get_cell_y_at_pixel(global.Tiles_1,posX,posY);
			
			if(instance_position(posX, posY+blockGenofst, obj_ow_auto_tile_test_block) = noone)
			{
				var temp1 = tilemap_get_at_pixel(global.Tiles_1,posX, posY);
				var temp2 = tile_get_index(temp1);
				
				if(temp2 > -1 && temp2 <= arrayMax)
				{
					var tempTarg = instance_create_depth(posX, posY+blockGenofst, depth, global.blockArray[temp2]);
					//ds_list_add(global.activeBlocks, tempTarg);
					tilemap_set(global.Tiles_Middle,1,tsX,tsY);
					
					if(temp2 = 0)
					{
					//instance_create_depth(posX,posY,target.depth+1,obj_ow_ping_floor);
					//pingNum ++;
					}
					else
					{
					//instance_create_depth(posX,posY,target.depth-1,obj_ow_ping_block);
					//pingNum ++;
					}
				}
				if(temp2 = 0)
				{
					//0 tile autotile. tiles around block tiles for overlay effect
					var tileDat = sc_autotile_image_48_0_tile(global.Tiles_1,posX,posY);
					tilemap_set(global.Tiles_Lower,global.tileFrameList[|tileDat],tsX,tsY);
					tilemap_set(global.Tiles_Upper,global.tileFrameList[|tileDat],tsX,tsY);
					tilemap_set(global.Tiles_Baseline,global.tileFrameList[|tileDat],tsX,tsY);//edit tiles on visual layer
				}
			}
		}
	}


//cleanup
//have slightly larger square to check for blocks
//Or run 4 for loops that target the 4 sides of the large generation collider above
//if block within this area but not in the above area
//if block does NOT have delete immunity
//kill block

//change the below code later; will need to cahnge tiles back and delete blocks 

	for(var xx = 0; xx < endCellClean; xx ++) //this deletes top blocks
	{
		var posX = squareX - (32 * (startCellClean - xx));
		var posY = squareY - ImobCellClean;
		
		var xx1 = tilemap_get_cell_x_at_pixel(global.Tiles_1, posX, posY);
		var yy1 = tilemap_get_cell_y_at_pixel(global.Tiles_1, posX, posY);
		
		var tempTarg2 = instance_position(posX,posY+blockGenofst,obj_ow_ping_block);
		instance_destroy(tempTarg2);

		if(instance_position(posX, posY+blockGenofst, obj_ow_nopass) != noone )
		{
			var tempTarg = instance_position(posX,posY+blockGenofst,obj_ow_nopass);
			if(tempTarg.object_index = obj_ow_enemy_chaser)
			{

				tilemap_set(global.Tiles_1,8,xx1,yy1);
				instance_destroy(tempTarg);
				
			}
			else
			{
			tilemap_set(global.Tiles_Lower,0,xx1,yy1);
			tilemap_set(global.Tiles_Upper,0,xx1,yy1);
			tilemap_set(global.Tiles_Middle,0,xx1,yy1);
			instance_destroy(tempTarg);
			}
		}
	}

	for(var xx = 0; xx < endCellClean; xx ++) //this deletes top blocks
	{
		var posX = squareX - (32 * (startCellClean - xx));
		var posY = squareY + ImobCellClean;

		var xx1 = tilemap_get_cell_x_at_pixel(global.Tiles_1, posX, posY);
		var yy1 = tilemap_get_cell_y_at_pixel(global.Tiles_1, posX, posY);

		var tempTarg2 = instance_position(posX,posY+blockGenofst,obj_ow_ping_block);
		instance_destroy(tempTarg2);

		if(instance_position(posX, posY+blockGenofst, obj_ow_nopass) != noone )
		{
			var tempTarg = instance_position(posX,posY+blockGenofst,obj_ow_nopass);
			if(tempTarg.object_index = obj_ow_enemy_chaser)
			{

				tilemap_set(global.Tiles_1,8,xx1,yy1);
				instance_destroy(tempTarg);
				
			}
			else
			{
			tilemap_set(global.Tiles_Lower,0,xx1,yy1);
			tilemap_set(global.Tiles_Upper,0,xx1,yy1);
			tilemap_set(global.Tiles_Middle,0,xx1,yy1);
			instance_destroy(tempTarg);
			}
		}
	}

	for(var xx = 0; xx < endCellClean; xx ++) //this deletes top blocks
	{
		var posX = squareX - ImobCellClean;
		var posY = squareY - (32 * (startCellClean - xx));

		var xx1 = tilemap_get_cell_x_at_pixel(global.Tiles_1, posX, posY);
		var yy1 = tilemap_get_cell_y_at_pixel(global.Tiles_1, posX, posY);
		
		var tempTarg2 = instance_position(posX,posY+blockGenofst,obj_ow_ping_block);
		instance_destroy(tempTarg2);

		if(instance_position(posX, posY+blockGenofst, obj_ow_nopass) != noone )
		{
			var tempTarg = instance_position(posX,posY+blockGenofst,obj_ow_nopass);
			if(tempTarg.object_index = obj_ow_enemy_chaser)
			{

				tilemap_set(global.Tiles_1,8,xx1,yy1);
				instance_destroy(tempTarg);
				
			}
			else
			{
			tilemap_set(global.Tiles_Lower,0,xx1,yy1);
			tilemap_set(global.Tiles_Upper,0,xx1,yy1);
			tilemap_set(global.Tiles_Middle,0,xx1,yy1);
			instance_destroy(tempTarg);
			}
		}
	}

	for(var xx = 0; xx < endCellClean; xx ++) //this deletes top blocks
	{
		var posX = squareX + ImobCellClean;
		var posY = squareY - (32 * (startCellClean - xx));

		var xx1 = tilemap_get_cell_x_at_pixel(global.Tiles_1, posX, posY);
		var yy1 = tilemap_get_cell_y_at_pixel(global.Tiles_1, posX, posY);
		
		var tempTarg2 = instance_position(posX,posY+blockGenofst,obj_ow_ping_block);
		instance_destroy(tempTarg2);

		if(instance_position(posX, posY+blockGenofst, obj_ow_nopass) != noone )
		{
			var tempTarg = instance_position(posX,posY+blockGenofst,obj_ow_nopass);
			if(tempTarg.object_index = obj_ow_enemy_chaser)
			{

				tilemap_set(global.Tiles_1,8,xx1,yy1);
				instance_destroy(tempTarg);
				
			}
			else
			{
			tilemap_set(global.Tiles_Lower,0,xx1,yy1);
			tilemap_set(global.Tiles_Upper,0,xx1,yy1);
			tilemap_set(global.Tiles_Middle,0,xx1,yy1);
			instance_destroy(tempTarg);
			}
		}
	}

	
	/*
		var srcLeng = ds_list_size(global.activeBlocks);
		for( var f = 0; f < srcLeng; f ++)
		{
			if(global.activeBlocks[|f] = undefined)
			{
				ds_list_delete(global.activeBlocks,f);
			}
			else
			{
				if(!instance_exists(global.activeBlocks[|f]))
				{
					ds_list_delete(global.activeBlocks,f);
				}
			}
		}
		*/
 
	update = false;
}