
draw_self();


//flashlight.image_alpha = 0;
flashlight.x = x;
flashlight.y = y;
//flashlight.image_angle = image_angle;

if(damageFlash == true)
{
	flashTimer ++;
	if(flashInterval <= timer)
	{
		if(image_alpha == 1)
		{	image_alpha = 0;
			target.visualSpriteDrill.image_alpha = 0;
			treadLeft.image_alpha = 0;
			treadRight.image_alpha = 0;
			}
		else
		{	image_alpha = 1;
			target.visualSpriteDrill.image_alpha = 1;
			treadLeft.image_alpha = 1;
			treadRight.image_alpha = 1;
			}
		flashInterval = timer + flashSpeed;
	}
	
	if(flashTimer >= 60)
	{
		damageFlash = false;
		flashTimer = 0;
	}
}

if(playerDeath = true)
{
	deathTimer ++;
	if(nextRoom = false)
	{
	damageFlash = true;
	}
	
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
	
	if(deathTimer >= 120)
	{
		flashSpeed = 5;
	}
	
	if(deathTimer >= 150)
	{
			xscale += 0.003;
			yscale += 0.003;
			draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, c_white, 1);
	}
	
	var sW = target.sprite_width * 0.5;
	var sH = target.sprite_height * 0.5;
	
	if(deathTimer >= 180)
	{
		
		
		obj_ow_camera.shake = true;
		obj_ow_camera.shakeForce += 4;
		part_particles_create(global.P_System, target.x+sW, target.y+sH, global.rockDeath, 20);
		part_particles_create(global.P_System, target.x+sW, target.y+sH, global.rockSpark, 30);
		damageFlash = false;
		image_alpha = 0;
		obj_ow_tank_sp_drill.image_alpha = 0;
		treadLeft.image_alpha = 0;
		treadRight.image_alpha = 0;
		deathTimer = 30; //set back to 0
		shake = false;
		nextRoom = true;
		if(!audio_is_playing(so_death_blast))
		{
			audio_play_sound(so_death_blast,1,false);
		}
		
		//note: apaprently there's a physics particle create? 
	}
	if(timer > 180 && timer < 200)
	{
		circleSize += 8;
		draw_circle(target.x+sW, target.y+sH, circleSize, false);
	}
	if(timer > 200)
	{
		circleSize += 0.5;
		circleAlpha -= 0.01;
		draw_set_alpha(circleAlpha);
		draw_circle(target.x+sW, target.y+sH, circleSize, true);
		draw_set_alpha(1);
	}
	
	//flash faster and faster, shake like possum
	//probably use a shader that turns the sprite entirely white for the flash effect, if you get the chance
	//draw sprite ext on last few frames and increase it's size a little
	//explode, screen shake, generate a BUNCH of new particles 
	//wait x seconds more
	//transfer to new screen
}

//draw_text_color(x, y, image_angle, c_red,c_red,c_red,c_red,1);

/*
draw_text(x,y,target.angleAccel);
draw_text(x,y+20,treadLeft.image_speed);
draw_text(x,y+40,treadRight.image_speed);
*/