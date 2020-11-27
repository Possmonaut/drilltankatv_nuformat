//draw_self();

if(state = 4)
{
	//var surf = surface_create(256,256);
	//surface_set_target(surf);
	//arms
	//tail
	//body
	//draw_sprite_ext(sp_grinder_attack,8,128,128,1,1,visualSp.cDur-90,c_white,1);
	//bake to sprite
	//assign sprite to object
	//remember, when said object also despawns, it needs to 
	
	//better idea for now; if dead, just don't do anything. but sorta curl up 
	visualSp.death = true;
	//visualSp.cDur = 0;
	if(dTimer < dTime *2)
	{
		dTimer ++;
		HP = 150;
	}
	else
	{
		death2 = true;
	}
	
	if(dTimer > dTime)
	{
		if(death2 = false || HP > 0)
		{
		var xxscale = (dTimer-dTime)* 0.0033;
		var yyscale = (dTimer-dTime)* 0.0033;
		draw_sprite_ext(sp_grinder_splat,0,x+16,y+16,xxscale,yyscale,0,c_white,1);
		}
	}
	else
	{
		visualSp.cDur += irandom_range(-10,10);
	}
	
	
	
}

