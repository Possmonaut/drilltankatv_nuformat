function sc_autotile_image_16(argument0) {
	//returns the image_index from a sprite 

	var obj, image, tileSize, checkUp, checkRt, checkDn, checkLft;

	obj = argument0;
	image = 0;
	tileSize = 32;

	checkUp = tilemap_get_at_pixel(global.Tiles_1,x,y-tileSize);
	checkRt = tilemap_get_at_pixel(global.Tiles_1,x+tileSize,y);
	checkDn = tilemap_get_at_pixel(global.Tiles_1,x,y+tileSize);
	checkLft = tilemap_get_at_pixel(global.Tiles_1,x-tileSize,y);

	if(checkUp > 0){image ++;}
	if(checkRt > 0){image += 2;}
	if(checkDn > 0){image += 4;}
	if(checkLft > 0){image += 8;}

	return image;


}
