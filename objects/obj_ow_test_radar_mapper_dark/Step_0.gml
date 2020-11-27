x = target.x +14;
y = target.y +14;

//keypress = keyboard_check(ord("R"));

var keyCheck = keyboard_check_released(ord("R"));

if(keyCheck)
{
	if(keypress)
	{
		keypress = false;
	}
	else
	{
		keypress = true;
	}
}

if(keypress && radarComplete) //if these button pressed and now runnign radar sweep
{
	radarComplete = false;
}

squareX = round(target.x / 32) * 32;
squareY = round(target.y / 32) * 32;

if(scanCheck = false) //this will create the selection of blocks 
	{
	for(var xx = 0; xx < endCellGen; xx ++)
	{
		for(var yy = 0; yy < endCellGen; yy ++)
		{
		
			var posX = squareX - (32 * (startCellGen - xx));//change these values to lengthen the box. later on, add a var to change these more easily
			var posY = squareY - (32 * (startCellGen - yy));
			var temp1 = tilemap_get_at_pixel(global.Tiles_1,posX, posY);
			var temp2 = tile_get_index(temp1);

			/* fix this later
			if(temp2 > 0 && temp2 < obj_ow_tile_instantiator.arrayMax)
			{	
				var x1 = tilemap_get_cell_x_at_pixel(global.Tiles_1, posX, posY);
				var y1 = tilemap_get_cell_y_at_pixel(global.Tiles_1, posX, posY);
				for(var l = 0; l < 2; l++)
				{
					for(var k = 0; k < 2; k ++)
					{   //below code adds a block to the map
						var x2 = x1 + l; //was originally xx * 4 + l, same for below
						var y2 = y1 + k;
						global.mapGrid[# x2, y2] = 1;
						obj_ow_mapper_test_2.update = true;
					}
				}
				*/
				var inst = instance_create_depth(posX,posY,-10,obj_ow_ping_block_dark);
				ds_grid_add(blockList,xx,yy,inst);
			//}
		}
	}
	
	scanCheck = true;
	}

if(targetTileX != squareX || targetTileY != squareY)
{
	targetTileX = squareX;
	targetTileY = squareY;
	tileMove = true;
}

if(tileMove = true)
{
for(var xx = 0; xx < endCellGen; xx ++)
	{
		for(var yy = 0; yy < endCellGen; yy ++)
		{
		
			var posX = squareX - (32 * (startCellGen - xx));
			
			var posY = squareY - (32 * (startCellGen - yy));
			blockList[# xx,yy].x = posX;
			blockList[# xx,yy].y = posY;
			}
		}
	}

if(radarComplete = false)
{
//have the position check here, for when player shifts tiles. then move all tiles in block list to their new positions before 
//running the below. also, have the map update HERE, not above. 
//here add all this to the map


var detect = collision_line(x,y,x + lengthdir_x(512, rotateDir), y + lengthdir_y(512, rotateDir),obj_ow_enemy_parent,false,true);
	if(detect != noone)
	{
		if(collision_line(x,y,x + lengthdir_x(512, rotateDir), y + lengthdir_y(512, rotateDir),obj_ow_ping_enemy,false,true) = noone)
		{
			var dist = distance_to_object(detect);
			instance_create_depth(detect.x,detect.y,-10,obj_ow_ping_enemy);
		}
	}
	collision_line_list(x, y, x + lengthdir_x(512, rotateDir), y + lengthdir_y(512, rotateDir), obj_ow_ping_block_dark, false, true, radarList, true);
	collision_line_list(x, y, x + lengthdir_x(512, rotateDir), y + lengthdir_y(512, rotateDir), obj_ow_ping_enemy, false, true, radarList, true);

	var listLeng = ds_list_size(radarList);
	
	for(var i = 0; i < listLeng; i ++)
	{
		radarList[|i].activated = true;
		radarList[|i].image_alpha = 0;
		
	}
	
	ds_list_clear(radarList);
	

	rotateDir += 2;
	if(rotateDir >= 360)
		{
		//scanCheck = false;
		radarComplete = true;
		rotateDir = 0;
		}
}

