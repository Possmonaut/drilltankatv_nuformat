//draw_self();

if(timer > deathTime - 60)
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
}


draw_sprite_ext(sp_monolith_comp_outline,13,x+16+vibOFST,y+16,image_xscale,image_yscale,myDir,c_white,1);
