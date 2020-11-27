function sc_tile_transfer_base_to_shadow_lower(argument0, argument1) {
	//arguement0 = the central tile x to read around 
	//arguement1 = the central tile x to read around

	var xx = argument0;
	var yy = argument1;

	var br = tilemap_get(global.Tiles_Baseline,xx+1,yy+1);
	tilemap_set(global.Tiles_Shadow_Visual,br,xx+1,yy+1);

	var bm = tilemap_get(global.Tiles_Baseline,xx,yy+1);
	tilemap_set(global.Tiles_Shadow_Visual,bm,xx,yy+1);

	var bl = tilemap_get(global.Tiles_Baseline,xx-1,yy+1);
	tilemap_set(global.Tiles_Shadow_Visual,bl,xx-1,yy+1);



}
