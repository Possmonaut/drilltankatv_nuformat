if(surface_exists(global.shadows) = false)
	{global.shadows = surface_create(1280, 720);}

gpu_set_blendmode_ext(bm_dest_color, bm_zero);
draw_surface(global.shadows, 0, 0);
gpu_set_blendmode(bm_normal);

