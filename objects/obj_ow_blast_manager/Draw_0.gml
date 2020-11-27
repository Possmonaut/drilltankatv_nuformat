if(timer < 10)
{
			xscale += 0.003;
			yscale += 0.003;
			draw_sprite_ext(target.sprite_index, target.image_index, target.x, target.y, xscale, yscale, target.image_angle, c_white, 1);
}

if(timer > 10 && timer < 20)
{
	circleSize += 8;
	draw_circle(x+16, y+16, circleSize, false);
}

if(timer > 20)
{
	circleSize += 0.5;
	circleAlpha -= 0.01;
	draw_set_alpha(circleAlpha);
	draw_circle(x+16, y+16, circleSize, true);
	draw_set_alpha(1);
	//and create the smoke particles here
	/*
	if(smokeTimer <= timer)
	{
		for(var i = 0; i < smokeRand + 1; i ++)
		{
			var xx = smoke_grid[i, 0];
			var yy = smoke_grid[i, 1];
			part_particles_create(global.P_System,xx, yy, global.smokeParticle, irandom_range(1,3));
		}
		smokeTimer = timer + 20;
	}
	*/
	
}