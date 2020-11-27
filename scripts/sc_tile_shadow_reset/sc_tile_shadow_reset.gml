function sc_tile_shadow_reset(argument0, argument1) {
	//arguement0 = the central tile x to read around 
	//arguement1 = the central tile y to read around

	var xx = argument0;
	var yy = argument1;


	tilemap_set(global.Tiles_Shadow_Visual,0,xx-1,yy-1);

	tilemap_set(global.Tiles_Shadow_Visual,0,xx,yy-1);

	tilemap_set(global.Tiles_Shadow_Visual,0,xx+1,yy-1);

	tilemap_set(global.Tiles_Shadow_Visual,0,xx+1,yy);

	tilemap_set(global.Tiles_Shadow_Visual,0,xx+1,yy+1);

	tilemap_set(global.Tiles_Shadow_Visual,0,xx,yy+1);

	tilemap_set(global.Tiles_Shadow_Visual,0,xx-1,yy+1);

	tilemap_set(global.Tiles_Shadow_Visual,0,xx-1,yy);



}
