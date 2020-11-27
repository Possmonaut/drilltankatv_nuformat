//make demo charge sprite swell for like 3 frames
//begin to draw circle
//kill demo charge object, screen shake
//once cicle reaches peak size, create blast objects / run blast script
//create rock chunks
//create smoke
//create smoking rock chunks
//run smoke particles for about 2 seconds, then kill self

timer ++;

if(timer = 11)
{
	instance_destroy(target);
	var vDist = sc_gainFalloff(384,0);
	var b = audio_play_sound(so_bomb_blast,2,false);
	audio_sound_gain(b,vDist,0);
}



if(timer = 21)
{
	//scr_blast_13(x, y);
	smokeRand = irandom_range(4,8);
	
	sc_shake_call(3,30,true);
	
	collision_circle_list(x+16,y+16,blastRadius,obj_ow_rock_parent,false,true,blastArray,false);
	collision_circle_list(x+16,y+16,blastRadius,obj_ow_enemy_passable,false,true,blastArray,false);
	collision_circle_list(x+16,y+16,blastRadius,obj_ow_monolinth_block,false,true,blastArray,false);
	
	var localBlast = false;
	
	if(distance_to_object(obj_ow_player_tank) < blastRadius)
	{ localBlast = true; }
	
	if(localBlast = true)
	{obj_ow_player_tank.HP -= 5;}
	
	var listLeng = ds_list_size(blastArray);
	
	for(var i = 0; i < listLeng; i ++)
	{
	var kill3 = blastArray[|i];
	
	if(kill3.object_index != obj_ow_rockswimmer_segment)
	{
	kill3.HP -= 100;

	if(kill3.HP <= 0 && (object_is_ancestor(kill3.object_index,obj_ow_rock_parent) || kill3.object_index = obj_ow_monolinth_block))
	{
		part_particles_create(global.P_System, kill3.x + 16, kill3.y + 16, global.rockDeath, 8);
		var xx = tilemap_get_cell_x_at_pixel(global.Tiles_1, kill3.x + 16, kill3.y + 16);
		var yy = tilemap_get_cell_y_at_pixel(global.Tiles_1, kill3.x + 16, kill3.y + 16);
		tilemap_set(global.Tiles_1, 0, xx, yy);
		tilemap_set(global.Shadow_Lower,0,xx,yy); //sets the lower shadow to 0
		
		if(kill3.object_index = obj_ow_superheated_wall)
		{
			tilemap_set(global.Tiles_1, 7, xx, yy);
		}
		tilemap_set(global.Tiles_1,0,kill3.x,kill3.y);
		var ping = instance_position(kill3.x,kill3.y,obj_ow_ping_block);
		if(ping != noone)
		{
		instance_destroy(ping);	
		}
		if(kill3.dsTrig = true){instance_create_depth(kill3.x,kill3.y,kill3.depth,kill3.deathSpawn);}
		if(kill3.tsTrig = true){tilemap_set(global.Tiles_1,kill3.tileSpawn,xx,yy);}
		
		//if(kill3.object_index = obj_ow_block_supsat){kill3.cDest = true;}
		instance_destroy(kill3);
		
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
		obj_ow_auto_tile_dark.update = true; //need to combine these two 
		obj_ow_Los_check_grid_dark.update = true;
	}
	
	if(object_is_ancestor(kill3,obj_ow_enemy_passable))
	{
		if(variable_instance_exists(kill3,stunTime))
		{
			kill3.stunTime = kill3.timer + 30;
		}
		if(kill3 != obj_ow_monolinth) 
		{part_particles_create(global.P_System,kill3.x+16,kill3.y+16,global.blood,16);}
		else
		{
			part_particles_create(global.P_System,kill3.x+16,kill3.y+16,global.crystalPart,16);
		}
		
		if(kill3.HP <= 0)
		{
			//sc_drill_death(kill3); //you can probably strip this 
			part_particles_create(global.P_System, kill3.x +16, kill3.y +16, global.meatChunk, 8);
			if(variable_instance_exists(kill3,deathAudio))
			{
			var a = audio_play_sound(kill3.deathAudio,1,false);
			}
			kill3.death = true;
		}
	}
	
	}
	else
	{
		if(kill3.progen.blastHit = false)
		{
		kill3.progen.HP -= 100;
		kill3.progen.blastHit = true;
		}
		if(kill3.progen.HP <= 0)
		{
			//sc_drill_death(kill3); //you can probably strip this 
			part_particles_create(global.P_System, kill3.progen.x +16, kill3.progen.y +16, global.meatChunk, 8);
			//if(variable_instance_exists(kill3.progen,deathAudio))
			//{
			var a = audio_play_sound(kill3.progen.deathAudio,1,false);
			//}
			kill3.progen.death = true;
		}
	}
	}	
}



if(timer = 180)
{
	ds_list_destroy(blastArray);
	instance_destroy();
}