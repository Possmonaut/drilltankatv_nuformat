timer ++;

if(timer > time)
{
		vibTimer ++;
	if(vibTimer > 2)
	{
		if(vibOFST = 2)
		{
			vibOFST = -4;
		}
		else
		{
			vibOFST = 2;
		}
		vibTimer = 0;
	}
	
	
	
	size += sizeGain;
	if(size = 1)
	{
		var b = instance_create_depth(x,y,depth,obj_ow_block_supsat);
		b.image_index = ind;
		tilemap_set_at_pixel(myLayer,14,x,y); //set this to the correct block
		var a  = audio_play_sound(so_crys_break,1,false);
		//audio_sound_gain(a,0.5,0);
		var b = instance_position(x,y,obj_ow_ping_floor);
		instance_destroy(b);
		var n = instance_create_depth(x,y,obj_ow_auto_tile_dark.depth - 1, obj_ow_ping_block);
		n.sprite_index = sp_block_supsat;
		n.forceActivate = true;
		part_particles_create(global.P_System, x+16, y+16, global.crystalPart, 6);
		part_particles_create(global.P_System, x+16, y+16, global.rockSpark, 6);
		instance_destroy();
		
	}
	
}