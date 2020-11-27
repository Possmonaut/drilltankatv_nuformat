if(instance_exists(obj_title_seismograph))
{}
else
{
	active = true;
}

if(active = true)
{
	if(surface_exists(global.shadows) = true)
	{

	surface_set_target(global.shadows);

	draw_clear_alpha(c_black,0); //this clears the screen, presumably it can reset it to a color

	spriteX = obj_ow_player_tank_sp.x;
	spriteY = obj_ow_player_tank_sp.y;
	spriteAngle = obj_ow_player_tank.spriteRotate;

	draw_sprite_ext(sp_vision_cone_test, 0, spriteX, spriteY, 1, 1, target.angleDir+270, c_white, 1);

	}
}

//sp_flashlight_solidwithbubbleblur