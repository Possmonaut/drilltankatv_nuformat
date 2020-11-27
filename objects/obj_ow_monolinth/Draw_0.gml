//draw_self();

if(state = 4)
{
	if(death2 == false)
	{
	dTimer ++
	if(dTimer < dTime)
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
		image_xscale += 0.005;
		image_yscale += 0.005;
		
			if(dTimer = 1)
			{
				if(!audio_is_playing(myDAud) || myDAud = -1)
				{
				myDAud = audio_play_sound(so_mono_move,1,false);
				audio_sound_gain(myDAud,0.75,0);
				audio_sound_pitch(myDAud,1);
				}
		}
		
		if(dTimer = dTime -1)
		{
			sprite_index = noone;
			mask_index = noone;
			activeDraw = 0;
			part_particles_create(global.P_System, x+16, y+16, global.crystalPart, 10);
			part_particles_create(global.P_System, x+16, y+16, global.rockSpark, 10);
			var b = audio_play_sound(so_crys_break,1,false);
			audio_sound_gain(b,0.75,0);
		}
	}
	else
	{
		death2 = true;
		
	}
	
	}
	
	
}

if(animTimer < animMax-1)
{
animTimer += animInterval;
}
else
{
	if(partBurst == false)
	{
	part_particles_create(global.P_System, x+16, y+16, global.crystalPart, 6);
	part_particles_create(global.P_System, x+16, y+16, global.rockSpark, 6);
	partBurst = true;
	}
}

draw_sprite_ext(sp_monolith_comp_outline,animTimer,x+16+vibOFST,y+16,image_xscale,image_yscale,animDir,c_white,activeDraw);