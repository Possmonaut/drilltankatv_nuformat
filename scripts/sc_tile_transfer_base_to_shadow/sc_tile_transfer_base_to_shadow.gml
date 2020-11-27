function sc_tile_transfer_base_to_shadow(argument0, argument1) {
	//arguement0 = the central tile x to read around 
	//arguement1 = the central tile x to read around

	var xx = argument0;
	var yy = argument1;

	var tl = tilemap_get(global.Tiles_Baseline,xx-1,yy-1);
	tilemap_set(global.Tiles_Shadow_Visual,tl,xx-1,yy-1);

	var tm = tilemap_get(global.Tiles_Baseline,xx,yy-1);
	tilemap_set(global.Tiles_Shadow_Visual,tm,xx,yy-1);

	var tr = tilemap_get(global.Tiles_Baseline,xx+1,yy-1);
	tilemap_set(global.Tiles_Shadow_Visual,tr,xx+1,yy-1);

	var cr = tilemap_get(global.Tiles_Baseline,xx+1,yy);
	tilemap_set(global.Tiles_Shadow_Visual,cr,xx+1,yy);

	//var br = tilemap_get(global.Tiles_Baseline,xx+1,yy+1);
	//tilemap_set(global.Tiles_Shadow_Visual,br,xx+1,yy+1);

	//var bm = tilemap_get(global.Tiles_Baseline,xx,yy+1);
	//tilemap_set(global.Tiles_Shadow_Visual,bm,xx,yy+1);

	//var bl = tilemap_get(global.Tiles_Baseline,xx-1,yy+1);
	//tilemap_set(global.Tiles_Shadow_Visual,bl,xx-1,yy+1);

	var cl = tilemap_get(global.Tiles_Baseline,xx-1,yy);
	tilemap_set(global.Tiles_Shadow_Visual,cl,xx-1,yy);



}
