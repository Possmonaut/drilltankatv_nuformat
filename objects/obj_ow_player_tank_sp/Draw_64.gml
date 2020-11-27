if(nextRoom = true)
{
	
	if(deathTimer >= 60)
	{
		//the below needs to be drawn at a higher depth so it blanks out the whole screen
		depth = -200;
		//alphaScale += 0.016;
		alphaScale = 0.1
		draw_sprite_ext(sp_bigassBlackBG,0,0,0,1,1,0,c_black,alphaScale);
		obj_ow_fade_handler.static_alpha = 1;
		//replace the above with a room transition
	}
	if(deathTimer >= 120)
	{
		part_particles_clear(global.P_System);
		room_goto(rm_deadth_screen);
	}
}