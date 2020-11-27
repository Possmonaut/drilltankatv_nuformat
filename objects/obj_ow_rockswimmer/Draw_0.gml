//move segments, but have the segments draw themselves 
//if death = true, for not just have the head detonate and segments fade 

//draw_self();

draw_sprite_ext(myBod,0,x,y,1,1,myDir,c_white,activeDraw);

//death animation behavior
if(deathAnim && dAnimComplete = false)
{
	audio_sound_gain(myAudM,0,250);
	audio_sound_gain(myAudA,0,250);
	audio_sound_gain(myAudS,0,250);
	//if(instance_exists(nlosPing))
	//{
	//	instance_destroy(nlosPing);	
	//}
	
	if(spd >0)
	{
		spd -= 0.05;
	}
	
	dTimer ++;
	if(dTimer > dTime)
	{
		dTimer = 0;
		activeDraw = 0;
		segArray[dvar].image_alpha = 0;
		part_particles_create(global.P_System, segArray[dvar].x, segArray[dvar].y, global.blood, 6);
		var b = audio_play_sound(so_meat_break,1,false);
		audio_sound_gain(b,0.25,0);
		dvar++;
		if(dvar = segNum)
		{
			deathAnim = false;
			dAnimComplete = true;
			//instance_destroy(nlosPing);
			for(var i = 1; i < segNum; i++)
			{
			segArray[i].sprite_index = noone;
			segArray[i].mask_index = noone;
			}
		}
	}
}

//draw_text(x,y-96,HP);