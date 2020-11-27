x = target.x +12;
y = target.y +12;

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

if(radarComplete = false)
{
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
				instance_create_depth(posX,posY,-10,obj_ow_ping_block);
			}
			/*
			else
			{
				if(position_meeting(posX,posY,obj_ow_enemy_parent))
				{
					instance_create_depth(posX,posY,-10,obj_ow_ping_enemy);
				}
			}
			*/
		}
	}
	
	scanCheck = true;
	}


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
	collision_line_list(x, y, x + lengthdir_x(512, rotateDir), y + lengthdir_y(512, rotateDir), obj_ow_ping_block, false, true, radarList, true);
	collision_line_list(x, y, x + lengthdir_x(512, rotateDir), y + lengthdir_y(512, rotateDir), obj_ow_ping_enemy, false, true, radarList, true);

	var listLeng = ds_list_size(radarList);
	
	for(var i = 0; i < listLeng; i ++)
	{
		radarList[|i].activated = true;
	}
	
	ds_list_clear(radarList);
	

	rotateDir += 2;
	if(rotateDir >= 360)
		{
		scanCheck = false;
		radarComplete = true;
		rotateDir = 0;
		}
}



/*
if(radarComplete = false) //if still doing radar sweep
{
//create list
collision_line_list(x, y, x + lengthdir_x(512, rotateDir), y + lengthdir_y(512, rotateDir), obj_ow_nopass, false, true, radarList, true);
//run through list with for loop
for(var i = 0; i < ds_list_size(radarList); i++)
{
	if(radarList[|i] = obj_ow_enemy_chaser)
	{
		if(instance_position(radarList[|i].x, radarList[|i].y, obj_ow_ping_enemy) = noone)	
		{
			var tempTarg = instance_create_depth(radarList[|i].x, radarList[|i].y, -10, obj_ow_ping_enemy);
			tempTarg.image_alpha = 0.4;
			ds_list_add(radarFadeList,tempTarg);
		}
		else
		{
			var tempTarget = instance_position(radarList[|i].x, radarList[|i].y, obj_ow_ping_enemy);
			tempTarget.image_alpha = 0.4;
		}

	}
	else
	{
		if(instance_position(radarList[|i].x, radarList[|i].y, obj_ow_ping_block) = noone )
		{
			var tempTarge = instance_create_depth(radarList[|i].x, radarList[|i].y, -10, obj_ow_ping_block);
			//tempTarget.radarStore = rotateDir;
			tempTarge.image_alpha = 0.4;
			ds_list_add(radarFadeList,tempTarge);
			for(var l = 0; l < 4; l++)
			{
				for(var k = 0; k < 4; k ++)
				{   //below code adds a block to the map
					var xx = tilemap_get_cell_x_at_pixel(global.Tiles_1, radarList[|i].x, radarList[|i].y);
					var yy = tilemap_get_cell_y_at_pixel(global.Tiles_1, radarList[|i].x, radarList[|i].y);
					var x2 = xx + l; //was originally xx * 4 + l, same for below
					var y2 = yy + k;
					global.mapGrid[# x2, y2] = 1;
					obj_ow_mapper_test_2.update = true;
				}
			}
		}
		else
		{
			var tempTarget = instance_position(radarList[|i].x, radarList[|i].y, obj_ow_ping_block);
			tempTarget.image_alpha = 0.4;
		}
	}
}
//if radar ping already on block, do not create 
//if enemy ping and no enemy under, delete
//after for loop is over
//clear list
//rotateDir += 2;
//if rotateDir >= 360
//radarComplete = true

ds_list_clear(radarList);
rotateDir += 2;
if(rotateDir >= 360)
	{
	radarComplete = true;
	rotateDir = 0;
	}

}

//scan through the first 200 objects in the list, then incriment a variable up to the remaining, then on 
//next frame, loops through the rest, then check and incriment. rinse and repeat
//due to the way you coded your list there will be no 0 value
//if(radarComplete = true && ds_list_size(radarFadeList) > 0 && fadeActive = false)
//{
	//fadeActive = true;

	if(ds_list_size(radarFadeList) > 0)
	{
		var listLeng = ds_list_size(radarFadeList);
		
		for(var f = 0; f < listLeng; f ++)
		{
					var tempT = radarFadeList[|f];
					show_debug_message("here's the jam" + string(tempT));
					
					if(tempT = undefined)
					{}
					else
					{
						if(instance_exists(tempT))
						{
							tempT.image_alpha -= 0.005; 
							if(tempT.image_alpha <= 0)
							{
								ds_list_delete(radarFadeList, f);
								instance_destroy(tempT);
							}
						}
						else
						{
							ds_list_delete(radarFadeList, f);
						}
					}
				}
		}
	//fadeActive = false;
//}
