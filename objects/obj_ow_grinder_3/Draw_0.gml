//draw_self();

if(state = 4)
{
	visualSp.death = true;
	if(dTimer < dTime *2)
	{
		dTimer ++;
	}
	else
	{
		death2 = true;
	}
	
	if(!deathPart)
	{
		part_particles_create(global.P_System,x +16,y +16,global.meatChunk, 8);
		deathPart = true;
	}
	
	if(dTimer > dTime)
	{
		if(death2 = false || HP > 0)
		{
			var xxscale = ((dTimer-dTime)* 0.0033) *2;
			var yyscale = ((dTimer-dTime)* 0.0033) *2;
		
			if(dFrame <= dFrameTot)
			{
				dFrame += dFrameGain;
				draw_sprite_ext(sp_death_splat_2,dFrame,x+16,y+16,xxscale,yyscale,dDir,c_white,1);
				HP = 150;
			}
			else
			{
				d2Frame += d2FrameGain;
				draw_sprite_ext(sp_death_splat_pulse,d2Frame,x+16,y+16,xxscale,yyscale,dDir,c_white,1);
			}
		}
	}
	else
	{
		visualSp.cDur += irandom_range(-10,10);
	}	
}

//draw_text(x,y-96,state);
//draw_text(x,y-64,HP);
//draw_text(x,y-32,death);