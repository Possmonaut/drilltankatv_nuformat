if(mapActive)
{
	if(surface_exists(global.map_surface) = false)
	{global.map_surface = surface_create(tilemap_get_width(global.Tiles_1)*4, tilemap_get_height(global.Tiles_1)*4);}
	draw_surface(global.map_surface, 0, 0);
	//surface_set_target(global.map_surface);
	//gpu_set_blendmode_ext(bm_dest_color, bm_zero);
}


//draw_text(x, y, tilemap_get_width(global.Tiles_1) * 4);