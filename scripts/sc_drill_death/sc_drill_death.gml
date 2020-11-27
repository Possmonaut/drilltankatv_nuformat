// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_drill_death(argument0){
	
	var target = argument0;
	
						if(object_is_ancestor(target.object_index,obj_ow_rock_parent)){
						part_particles_create(global.P_System, target.x +16, target.y +16, global.rockDeath, 8);}
						if(object_is_ancestor(target.object_index,obj_ow_enemy_passable))
						{
						part_particles_create(global.P_System, target.x +16, target.y +16, global.meatChunk, 8);}
						//destTic ++;
						var xx = tilemap_get_cell_x_at_pixel(global.Tiles_1, target.x, target.y+global.blockGenofst);
						var yy = tilemap_get_cell_y_at_pixel(global.Tiles_1, target.x, target.y+global.blockGenofst);
						tilemap_set(global.Tiles_1, 0, xx, yy);
						tilemap_set(global.Shadow_Lower,0,xx,yy); //sets the lower shadow to 0
						if(target.dsTrig = true){instance_create_depth(target.x,target.y,target.depth,target.deathSpawn);}
						if(target.tsTrig = true){tilemap_set(global.Tiles_1,target.tileSpawn,xx,yy);}
						var pingDest = instance_position(target.x,target.y,obj_ow_ping_block);
						instance_destroy(pingDest);
						
						if(!object_is_ancestor(target.object_index,obj_ow_enemy_passable)){ //if we're an enemy, trigger death so they can play death anims
						instance_destroy(target);}
						else
						{
							target.death = true;
						}

						if(variable_instance_exists(target,"deathAudio"))
						{
							audio_play_sound(target.deathAudio,1,false);
						}

						for(var l = 0; l < 3; l++)
						{
							for(var k = 0; k < 3; k ++)
							{   //below code adds a block to the map
							var x2 = (xx*3) + l; //was originally xx * 4 + l, same for below
							var y2 = (yy*3) + k;
							global.mapGrid[# x2, y2] = 0;
							}
						}
						obj_ow_mapper_test_2.update = true;
						obj_ow_auto_tile_dark.update = true;
						obj_ow_Los_check_grid_dark.update = true;

}