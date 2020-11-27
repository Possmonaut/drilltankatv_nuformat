x = target.x;
y = target.y;

for( var i = 0; i < 91; i ++)
{
	collision_line_list(x+16, y+16, x + lengthdir_x(512, rotateDir), y + lengthdir_y(512, rotateDir), obj_ow_nopass, false, true, radarList, true);
	//radarList[|0].LOSconfirm = blah blah;
	LOS_list[|i] = radarList[|0];
	//here we'll also check distance, then set depth and stuff accordingly 
	if(LOS_list[|i] != undefined)
	{
		LOS_list[|i].DLOS = true;
		var originTarg = LOS_list[|i];
		var originDepth = LOS_list[|i].depth;
		//here, check the two tiles above, two tiles below. according to which is yes, 
		//left / right
		var leftTarg = instance_position(originTarg.x - 16, originTarg.y + 16, obj_ow_nopass);
		var rightTarg = instance_position(originTarg.x + 32, originTarg.y + 16, obj_ow_nopass);
		var downTarg = instance_position(originTarg.x + 16, originTarg.y + 32, obj_ow_nopass);
		var upTarg = instance_position(originTarg.x + 16, originTarg.y - 16, obj_ow_nopass);
		
		if(leftTarg != noone && rightTarg != noone)
		{
			var newDepth = 0;
			if(leftTarg.depth < rightTarg.depth){newDepth = leftTarg.depth;}
			else{newDepth = rightTarg.depth;}
			
			originTarg.upObj.depth = newDepth - uDepth;
			originTarg.depth = newDepth
			originTarg.downObj.depth = newDepth + uDepth;
			originTarg.myShadow.depth = newDepth + dDepth;
		}
		
		if(upTarg != noone && downTarg != noone)
		{
			var newDepth = 0;
			if(upTarg.depth < downTarg.depth){newDepth = upTarg.depth;}
			else{newDepth = downTarg.depth;}
			
			originTarg.upObj.depth = newDepth - uDepth;
			originTarg.depth = newDepth
			originTarg.downObj.depth = newDepth + uDepth;
			originTarg.myShadow.depth = newDepth + dDepth;
		}
	}
		
		//take own depth as temp var
		//set the depths accordingly
	ds_list_clear(radarList);
	rotateDir += 4;
	
}


if(rotateDir >= 360)
	{
	radarComplete = true;
	rotateDir = 0;
	}

/*
//run through list with for loop
for(var i = 0; i < ds_list_size(radarList); i++)
{
	if(radarList[|i].object_index = obj_ow_enemy_chaser)
	{
		if(instance_position(radarList[|i].x, radarList[|i].y, obj_ow_ping_enemy) = noone)	
		{
			var tempTarg = instance_create_depth(radarList[|i].x, radarList[|i].y, -10, obj_ow_ping_enemy);
			//tempTarg.image_alpha = 0.4;
			//ds_list_add(radarFadeList,tempTarg);
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
					var x2 = xx * 4 + l;
					var y2 = yy * 4 + k;
					global.mapGrid[# x2, y2] = 1;
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

ds_list_clear(radarComplete);
rotateDir += 2;
if(rotateDir >= 360)
	{
	radarComplete = true;
	rotateDir = 0;
	}

}
*/
