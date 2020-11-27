timer ++;

if(shake = true)
{
	if(storeReturn = false)
	{
	storeX = x;
	storeY = y;
	storeReturn = true;
	}

	x += irandom_range(-1, 1);
	y += irandom_range(-1, 1);

	if(shakeTimer <= timer)
	{
		x = storeX;
		y = storeY;
		storeReturn = false;
		shakeTimer = timer +5;
	}
}

if(shake = true)
{
	if(instance_position(x + 16, y + 16, obj_ow_player_tank))
	{
		 shake = false;
		 part_particles_create(global.P_System, x+ 16, y + 16, global.rockSpark, 30);
	}
}

