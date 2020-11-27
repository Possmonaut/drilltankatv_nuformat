function scr_enemy_tile_clean() {
	//note: tied to instantiator

		for(var xx = 0; xx < endCellClean; xx ++) //this deletes top blocks
		{
			var posX = squareX - (32 * (startCellClean - xx));
			var posY = squareY - ImobCellClean;

			if(instance_position(posX, posY, obj_ow_enemy_parent) != noone )
			{
				var tempTarg = instance_position(posX,posY,obj_ow_enemy_parent);
				//var xx = tilemap_get_cell_x_at_pixel(global.Tiles_1, tempTarg.x+16, tempTarg.y+16);
				//var yy = tilemap_get_cell_y_at_pixel(global.Tiles_1, tempTarg.x+16, tempTarg.y+16);
				//tilemap_set(global.Tiles_1, 8, xx, yy);
				instance_destroy(tempTarg.upObj);
				instance_destroy(tempTarg.downObj);
				instance_destroy(tempTarg.myShadow);
				instance_destroy(tempTarg);
			}
		}

		for(var xx = 0; xx < endCellClean; xx ++) //this deletes top blocks
		{
			var posX = squareX - (32 * (startCellClean - xx));
			var posY = squareY + ImobCellClean;

			if(instance_position(posX, posY, obj_ow_enemy_parent) != noone )
			{
				var tempTarg = instance_position(posX,posY,obj_ow_enemy_parent);
				//var xx = tilemap_get_cell_x_at_pixel(global.Tiles_1, tempTarg.x+16, tempTarg.y+16);
				//var yy = tilemap_get_cell_y_at_pixel(global.Tiles_1, tempTarg.x+16, tempTarg.y+16);
				//tilemap_set(global.Tiles_1, 8, xx, yy);
				instance_destroy(tempTarg.upObj);
				instance_destroy(tempTarg.downObj);
				instance_destroy(tempTarg.myShadow);
				instance_destroy(tempTarg);
			}
		}

		for(var xx = 0; xx < endCellClean; xx ++) //this deletes top blocks
		{
			var posX = squareX - ImobCellClean;
			var posY = squareY - (32 * (startCellClean - xx));

			if(instance_position(posX, posY, obj_ow_enemy_parent) != noone )
			{
				var tempTarg = instance_position(posX,posY,obj_ow_enemy_parent);
				//var xx = tilemap_get_cell_x_at_pixel(global.Tiles_1, tempTarg.x+16, tempTarg.y+16);
			//	var yy = tilemap_get_cell_y_at_pixel(global.Tiles_1, tempTarg.x+16, tempTarg.y+16);
				//tilemap_set(global.Tiles_1, 8, xx, yy);
				instance_destroy(tempTarg.upObj);
				instance_destroy(tempTarg.downObj);
				instance_destroy(tempTarg.myShadow);
				instance_destroy(tempTarg);
			}
		}

		for(var xx = 0; xx < endCellClean; xx ++) //this deletes top blocks
		{
			var posX = squareX + ImobCellClean;
			var posY = squareY - (32 * (startCellClean - xx));

			if(instance_position(posX, posY, obj_ow_enemy_parent) != noone )
			{
				var tempTarg = instance_position(posX,posY,obj_ow_enemy_parent);
				//var xx = tilemap_get_cell_x_at_pixel(global.Tiles_1, tempTarg.x+16, tempTarg.y+16);
				//var yy = tilemap_get_cell_y_at_pixel(global.Tiles_1, tempTarg.x+16, tempTarg.y+16);
				//tilemap_set(global.Tiles_1, 8, xx, yy);
				instance_destroy(tempTarg.upObj);
				instance_destroy(tempTarg.downObj);
				instance_destroy(tempTarg.myShadow);
				instance_destroy(tempTarg);
			}
		}


}
