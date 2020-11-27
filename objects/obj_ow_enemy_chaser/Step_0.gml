upObj.depth = depth;
downObj.depth = depth +1;
upObj.image_alpha = 1;
downObj.image_alpha = 1;
upObj.x = x + 16;
upObj.y = y + 16;
downObj.x = x + 16;
downObj.y = y + 16;

downObj.image_angle = direction + 90; 



timer ++;
path_end(); //end path after moving 32 pixels. if the instance doesn't move at all, might have to move this to the top.


if(distance_to_object(obj_ow_player_tank) <= 320)
{
	state = 1;
	if(collision_line(x +15, y +15, target.x +15, target.y + 15, obj_ow_nopass, false, true) == noone) //need this and a DLOS check 
	{ depth = target.depth;
		}
	else
	{ depth = 999;} 
}
else
{
	state = 0;
}

if(state = 0)
{
	downObj.image_speed = 0; 
} 

if(state = 1) // use pathfinding to pursue until player is x away. if x away, count down and return to state 0 after coutn down
{
	if(moveTimer < timer)
	{
		
		if(point_distance(x+ 16, y + 16, target.x + 16, target.y + 16) <= 48)
		{

			if(obj_ow_player_tank_sp.damageFlash == true || stunned == true)
			{
			moveTimer = timer + 60;
			stunned = false;
			}
			else
			{
			instance_create_depth(target.x, target.y, -3, obj_ow_enemy_strike);
			moveTimer = timer + 60;
			}
		}
		else
		{

			if(mp_grid_path(global.mp_grid32, myPath, x + 16, y + 16, target.x + 16, target.y + 16, 0) = false)
			{
			path_end();
			}
			else
			{
			mp_grid_path(global.mp_grid32, myPath, x + 16, y + 16, target.x + 16, target.y + 16, 0);
			path_start(myPath, moveSpeed, path_action_continue, 0); //start patth, move 32 pixels
			//moveTimer = timer + 60;
			}
		}
	}
	
	downObj.image_speed = 15;
}

//every second, save current tile location as tilemap
//then, set new location as tilemap 
//after another xx seconds, set old tilemap location to 0
//then set new location to tile_monster
//when kill, set old to 0 as well, probably

/*
if(tileTimer <= timer)
{
	squareX = round(target.x / 32) * 32;
	squareY = round(target.y / 32) * 32;
	
	for(var xx = 0; xx < endCellGen; xx ++)
	{
		for(var yy = 0; yy < endCellGen; yy ++)
		{
		
			var posX = squareX - (32 * (startCellGen - xx));//change these values to lengthen the box. later on, add a var to change these more easily
			var posY = squareY - (32 * (startCellGen - yy));

			if(instance_position(posX, posY, obj_ow_enemy_parent) = noone)
			{
				var temp1 = tilemap_get_at_pixel(tileset0,posX, posY);
				var temp2 = tile_get_index(temp1);
				if(temp2 = 8)
				{
						tilemap_set(global.Tiles_1, 0, xx, yy);
				}
			}
		}
	}
	tilemap_set(global.Tiles_1, 8, x, y);
	tileTimer = timer + 10;
}
*/

						//var xx = tilemap_get_cell_x_at_pixel(global.Tiles_1, target.x+16, target.y+16);
					//	var yy = tilemap_get_cell_y_at_pixel(global.Tiles_1, target.x+16, target.y+16);
						//tilemap_set(global.Tiles_1, 0, xx, yy);

//note: if the below looks weird with the new sprite, just remove it
//also, note, if not on path_start, and can see player, just have it look at the player or something
/*
if(upObj.image_angle != direction)
{
	if(upObj.image_angle < direction)
	{
		upObj.image_angle ++;
		downObj.image_angle ++;
		directionChange ++;
	}
	
		if(upObj.image_angle > direction)
	{
		upObj.image_angle --;
		downObj.image_angle --;
		directionChange ++;
	}
	
}
*/


//upObj.image_angle = direction;




/*
squareX = round(x / 32) * 32;
squareY = round(y / 32) * 32;
var xx = tilemap_get_cell_x_at_pixel(global.Tiles_1, squareX, squareY);
var yy = tilemap_get_cell_y_at_pixel(global.Tiles_1, squareX, squareY);
tilemap_set(global.Tiles_1, 8, xx, yy);

for(var i = 0; i < 4; i ++)
{
	for(var o = 0; o < 4; o++)
	{
		var calcX = squareX - (32 * (1 - i));
		var calcY = squareY - (32 * (1 - o));
		var xx1 = tilemap_get_cell_x_at_pixel(global.Tiles_1, calcX, calcY);
		var yy1 = tilemap_get_cell_y_at_pixel(global.Tiles_1, calcX, calcY);
		if(instance_position(calcX, calcY, all) = noone)
		{
			tilemap_set(global.Tiles_1, 0, xx1, yy1);
		}
	}
}
*/