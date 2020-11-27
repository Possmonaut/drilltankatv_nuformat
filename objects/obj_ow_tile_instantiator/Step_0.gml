//so you need to check the 3 32 pixel points
//get tilemap id
//then get index



timer ++;

x=target.x+12;
y=target.y+12;

var temp1 = tilemap_get_at_pixel(global.Tiles_1,mouse_x, mouse_y);

var temp2 = tile_get_index(temp1);

var1 = temp1;
var2 = temp2;

squareX = round(target.x / 32) * 32;
squareY = round(target.y / 32) * 32;

var temp3 = tilemap_get_at_pixel(global.Tiles_1,target.x +16, target.y + 16) & tile_index_mask;
debug1 = temp3;
var temp4 = tile_get_index(temp3);

//below chunk handles the lava background 
if(instance_exists(obj_ow_tutorial_controller))
{}
else
{

if(temp4 > arrayMax) //this here deals damage and heat to the player if they're out of bounds 
{ //should probably move this code to the actual player object dummy
	target.HP -= 0.025;
	target.drillHeat += 0.35;
	obj_hazeC.coverScreen = true;
	if(hazeBegin = true)
	{
		obj_hazeC.hazeSpeed = 0
		hazeBegin = false;
	}
	obj_hazeC.hazeSpeed += 0.01;
	if(obj_hazeC.hazeSpeed > 1){obj_hazeC.hazeSpeed = 1;}
	
	//also slowly change BG to tiled lava floor sprite
	if(bgAlpha != 0)
	{
	bgAlpha -= 0.01;
	layer_background_alpha(layer_background_get_id("Background"), bgAlpha);
	}
}
else
{
	if(bgAlpha != 1)
	{
	bgAlpha += 0.01;
	hazeBegin = true;
	obj_hazeC.hazeSpeed -= 0.01;
	if(obj_hazeC.hazeSpeed <= 0.01)
	{obj_hazeC.coverScreen = false;
		obj_hazeC.hazeSpeed = 1;
		}
	layer_background_alpha(layer_background_get_id("Background"), bgAlpha);
	}
}
}



//tilecheck x/y for loop
//within loop:
//check for block
//if block, do nothing
//else
//if tile index > 0 (later we'll add in the ability to check for tileSet type which will load a unique array
//produce block from array (1 = block1, 2 = block2, etc
//else
//do nothing

/*
if(target.x > xStore + 31 || target.x < xStore - 31)
{
	update = true;
	xStore = target.x;
}
if(target.y > yStore + 31 || target.y < yStore - 31)
{
	update = true;
	yStore = target.y;
}
*/

if(updateTimer < timer)
{
	updateTimer = timer +10;
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

			if(instance_position(posX, posY, obj_ow_nopass) = noone)
			{
				var temp1 = tilemap_get_at_pixel(global.Tiles_1,posX, posY);
				var temp2 = tile_get_index(temp1);
				if(temp2 > 0)
				{
					if(temp2 <= arrayMax)
					{
					var tempTarg = instance_create_depth(posX, posY, -1, global.blockArray[temp2]);
					if(temp2 = 8)//if we're creating a chaser
					{
						var xx1 = tilemap_get_cell_x_at_pixel(global.Tiles_1, tempTarg.x+16, tempTarg.y+16);
						var yy1 = tilemap_get_cell_y_at_pixel(global.Tiles_1, tempTarg.x+16, tempTarg.y+16);
						tilemap_set(global.Tiles_1, 0, xx1, yy1);
					}
					var3 = tempTarg;
					}

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

	for(var xx = 0; xx < endCellClean; xx ++) //this deletes top blocks
	{
		var posX = squareX - (32 * (startCellClean - xx));
		var posY = squareY - ImobCellClean;

		if(instance_position(posX, posY, obj_ow_nopass) != noone )
		{
			var tempTarg = instance_position(posX,posY,obj_ow_nopass);
			if(tempTarg.object_index = obj_ow_enemy_chaser)
			{
				var xx1 = tilemap_get_cell_x_at_pixel(global.Tiles_1, posX, posY);
				var yy1 = tilemap_get_cell_y_at_pixel(global.Tiles_1, posX, posY);
				tilemap_set(global.Tiles_1,8,xx1,yy1);
				instance_destroy(tempTarg);
				
			}
			else
			{
			instance_destroy(tempTarg.upObj);
			instance_destroy(tempTarg.downObj);
			instance_destroy(tempTarg.myShadow);
			instance_destroy(tempTarg);
			}
		}
	}

	for(var xx = 0; xx < endCellClean; xx ++) //this deletes top blocks
	{
		var posX = squareX - (32 * (startCellClean - xx));
		var posY = squareY + ImobCellClean;

		if(instance_position(posX, posY, obj_ow_nopass) != noone )
		{
			var tempTarg = instance_position(posX,posY,obj_ow_nopass);
			if(tempTarg.object_index = obj_ow_enemy_chaser)
			{
				var xx1 = tilemap_get_cell_x_at_pixel(global.Tiles_1, posX, posY);
				var yy1 = tilemap_get_cell_y_at_pixel(global.Tiles_1, posX, posY);
				tilemap_set(global.Tiles_1,8,xx1,yy1);
				instance_destroy(tempTarg);
			}
			else
			{
			instance_destroy(tempTarg.upObj);
			instance_destroy(tempTarg.downObj);
			instance_destroy(tempTarg.myShadow);
			instance_destroy(tempTarg);
			}
		}
	}

	for(var xx = 0; xx < endCellClean; xx ++) //this deletes top blocks
	{
		var posX = squareX - ImobCellClean;
		var posY = squareY - (32 * (startCellClean - xx));

		if(instance_position(posX, posY, obj_ow_nopass) != noone )
		{
			var tempTarg = instance_position(posX,posY,obj_ow_nopass);
			if(tempTarg.object_index = obj_ow_enemy_chaser)
			{
				var xx1 = tilemap_get_cell_x_at_pixel(global.Tiles_1, posX, posY);
				var yy1 = tilemap_get_cell_y_at_pixel(global.Tiles_1, posX, posY);
				tilemap_set(global.Tiles_1,8,xx1,yy1);
				instance_destroy(tempTarg);
			}
			else
			{
			instance_destroy(tempTarg.upObj);
			instance_destroy(tempTarg.downObj);
			instance_destroy(tempTarg.myShadow);
			instance_destroy(tempTarg);
			}
		}
	}

	for(var xx = 0; xx < endCellClean; xx ++) //this deletes top blocks
	{
		var posX = squareX + ImobCellClean;
		var posY = squareY - (32 * (startCellClean - xx));

		if(instance_position(posX, posY, obj_ow_nopass) != noone )
		{
			var tempTarg = instance_position(posX,posY,obj_ow_nopass);
			if(tempTarg.object_index = obj_ow_enemy_chaser)
			{
				var xx1 = tilemap_get_cell_x_at_pixel(global.Tiles_1, posX, posY);
				var yy1 = tilemap_get_cell_y_at_pixel(global.Tiles_1, posX, posY);
				tilemap_set(global.Tiles_1,8,xx1,yy1);
				instance_destroy(tempTarg);
			}
			else
			{
			instance_destroy(tempTarg.upObj);
			instance_destroy(tempTarg.downObj);
			instance_destroy(tempTarg.myShadow);
			instance_destroy(tempTarg);
			}
		}
	}

	//scr_enemy_tile_clean(); //this does the same as above, but for enemies. dumped into a sript to keep clean
	update = false;
}

//note, when a block is killed (via the tank) it needs to set it's tile to 0 or it will just be replaced

//this is some "just in case" code to cut down on leaks. note: if you have bugs with things not activating correctly, this is it

//instance_activate_all();
//instance_deactivate_region(target.x - 480, target.y - 480, target.x + 480, target.y + 480, false, true);
