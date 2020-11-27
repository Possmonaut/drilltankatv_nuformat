if(room != cRoom)
{
	cRoom = room;
	alarm[0] = 30;
	updateBlock = true;
}


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

if(instance_exists(o_tutorial_elevator_2))
{
	//exit;
}

if(update = true && updateBlock = true)
{
	for(var xx = 0; xx < endCellGen; xx ++)
	{
		for(var yy = 0; yy < endCellGen; yy ++)
		{
		
			var posX = squareX - (32 * (startCellGen - xx));//change these values to lengthen the box. later on, add a var to change these more easily
			var posY = squareY - (32 * (startCellGen - yy));
	
			if(instance_position(posX, posY+blockGenofst, obj_ow_nopass) = noone && instance_position(posX, posY+blockGenofst, obj_ow_superheated_floor) = noone)
			{
				var temp1 = tilemap_get_at_pixel(global.Tiles_1,posX, posY);
				var temp2 = tile_get_index(temp1);
				
				if(temp2 > 0 && temp2 <= arrayMax)
				{
					var tileTarg = tilemap_get_at_pixel(global.Tiles_1,posX,posY);
					if(tileTarg = 8 || (temp2 > 16 && temp2 < 25)) //enemy spawner tile
					{
						if(instance_position(posX,posY,obj_ow_parent_spawner) = noone)
							{ 
								var b = instance_create_depth(posX,posY,target.depth-10,global.blockArray[temp2]);
								//ds_list_add(blockList,b);
							}
					}
					else
					{
					var b = instance_create_depth(posX, posY+blockGenofst, depth, global.blockArray[temp2]);
					ds_list_add(blockList,b);
					}
				}
				
				if(temp2 > arrayMax)
				{
					//instance_create_depth(posX, posY+blockGenofst, depth, global.blockArray[7]);
				}
				
				if(temp2 <= 0 || temp2 > arrayMax || temp2 = 8 || temp2 = 7 || temp2 = 5 || (temp2 > 16 && temp2 < 25))
					{
						if(instance_position(posX,posY,obj_ow_ping_floor) = noone)
						{
						var b = instance_create_depth(posX,posY,depth+1,obj_ow_ping_floor);
						ds_list_add(blockList,b);
						}
					}
					else
					{
						if(instance_position(posX,posY,obj_ow_ping_block) = noone)
						{
						var bum = instance_create_depth(posX,posY,depth-1,obj_ow_ping_block);
						ds_list_add(blockList,bum);
							
							if(temp1 = 15 || temp1 = 16)
							{
								var o = irandom(1);
								if(o = 0)
								{bum.sprite_index = sp_block_fungal;}
								else
								{bum.sprite_index = sp_block_fungal2;}
							}
						
							if(temp1 >= 0)
							{
							bum.sprite_index = spriteList[temp1];
							var bumfum = sprite_get_number(spriteList[temp1]);
							if(bumfum > 1)
								{
									bum.image_index = irandom(bumfum);
								}
							}
							
							var z = irandom(5000);
							if(z = 0)
							{
								bum.image_index = 0;
								bum.sprite_index = sp_face_block;
							}
						//	if(temp1 = 3)
						//	{
						//bum.sprite_index = sp_rock_AT_test;
						//bum.image_index = sc_autotile_image_16_updated(posX,posY);
						//	}
						}
					}
			}
		}
	}

 var stX = squareX - (32 * (startCellClean));
 var stY = squareY - (32 * (startCellClean));
 collision_line_list(stX,stY,stX + (endCellClean*32), stY,obj_ow_ping_block,false,true,deleteList,false);
 collision_line_list(stX,stY,stX, stY + (endCellClean*32),obj_ow_ping_block,false,true,deleteList,false);
 collision_line_list(stX + (endCellClean*32),stY,stX+ (endCellClean*32), stY+ (endCellClean*32),obj_ow_ping_block,false,true,deleteList,false);
 collision_line_list(stX,stY+ (endCellClean*32),stX+ (endCellClean*32), stY + (endCellClean*32),obj_ow_ping_block,false,true,deleteList,false);
 
 collision_line_list(stX,stY,stX + (endCellClean*32), stY,obj_ow_nopass,false,true,deleteList,false);
 collision_line_list(stX,stY,stX, stY + (endCellClean*32),obj_ow_nopass,false,true,deleteList,false);
 collision_line_list(stX + (endCellClean*32),stY,stX+ (endCellClean*32), stY+ (endCellClean*32),obj_ow_nopass,false,true,deleteList,false);
 collision_line_list(stX,stY+ (endCellClean*32),stX+ (endCellClean*32), stY + (endCellClean*32),obj_ow_nopass,false,true,deleteList,false);
 
  collision_line_list(stX,stY,stX + (endCellClean*32), stY,obj_ow_superheated_floor,false,true,deleteList,false);
 collision_line_list(stX,stY,stX, stY + (endCellClean*32),obj_ow_superheated_floor,false,true,deleteList,false);
 collision_line_list(stX + (endCellClean*32),stY,stX+ (endCellClean*32), stY+ (endCellClean*32),obj_ow_superheated_floor,false,true,deleteList,false);
 collision_line_list(stX,stY+ (endCellClean*32),stX+ (endCellClean*32), stY + (endCellClean*32),obj_ow_superheated_floor,false,true,deleteList,false);
 
 var listLeng = ds_list_size(deleteList);
 for(var i = 0; i < listLeng; i++)
 {
	 if(instance_exists(deleteList[|i]))
	 {
		 if(!object_is_ancestor(deleteList[|i].object_index,obj_ow_enemy_parent) && deleteList[|i].object_index != obj_ow_ping_monster && deleteList[|i].object_index != obj_ow_parent_spawner) //keeps us from killing certain enemies 
		 {
		 instance_destroy(deleteList[|i]);
		 }
	 }
 }
 ds_list_clear(deleteList);
 
 var lLeng = ds_list_size(blockList);
 for(var i = 0; i < lLeng; i++)
 {
	 if(instance_exists(blockList[|i]))
	 {
		 if(distance_to_object(blockList[|i]) > 544)
		 {
			instance_destroy(blockList[|i]);
		 }
	 }
 }
 
 for(var i = 0; i < lLeng; i++)
 {
	 if(!instance_exists(blockList[|i]))
	 {
		 ds_list_delete(blockList,i);
		 lLeng = ds_list_size(blockList);
	 }
 }
 
	update = false;
	
	mp_grid_clear_all(global.mp_grid32);
	mp_grid_add_instances(global.mp_grid32, obj_ow_nopass_enemy, 1);
}