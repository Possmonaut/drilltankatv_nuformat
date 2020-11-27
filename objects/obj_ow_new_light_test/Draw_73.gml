var srcSize = ds_list_size(activeSources);


if(!surface_exists(shadow))
{
	shadow = surface_create(1024,768);
	surface_set_target(shadow);
	draw_set_color(c_black);
	draw_set_alpha(0);
	draw_rectangle(0,0,1024,768,false);
	surface_reset_target();
}
else
{
	if (surface_exists(shadow)) 
	{
		var origX = camTarg.x-512;
		var origY = camTarg.y-384
		
		surface_set_target(shadow);
		draw_set_color(c_black);
		draw_set_alpha(1);
		draw_rectangle(0,0,1024,768,false);
		gpu_set_blendmode(bm_subtract);
		

		draw_sprite_ext(sp_cone_light_384,0,obj_ow_player_tank.x+12-origX,obj_ow_player_tank.y+12-origY,1,1,obj_ow_player_tank.angleDir+270,c_white,1);

		for(var i = 0; i < srcSize; i++)
		{
		draw_sprite_ext(activeSrcSprt[|i],0,activeSourcesX[|i]-origX,activeSourcesY[|i]-origY,activeSourcesSize[|i],activeSourcesSize[|i],0,c_white,1);
		}
		
			
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(1);
		draw_set_color(c_white);
		surface_reset_target();
		draw_surface(shadow,origX,origY);
		//surface_copy(shadow,0,0,application_surface);
		
		
		if(sprite_exists(shadowSprite)){sprite_delete(shadowSprite);}
	}
}