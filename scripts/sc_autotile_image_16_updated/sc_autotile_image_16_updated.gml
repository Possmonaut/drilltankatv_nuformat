function sc_autotile_image_16_updated(argument0, argument1) {
	//returns the image_index from a sprite 

	var obj, image, tileSize, checkUp, checkRt, checkDn, checkLft, _x, _y;

	obj = 0;
	image = 0;
	tileSize = 32;
	_x = argument0;
	_y = argument1;

	checkUp = tilemap_get_at_pixel(global.Tiles_1,_x,_y-tileSize);
	checkRt = tilemap_get_at_pixel(global.Tiles_1,_x+tileSize,_y);
	checkDn = tilemap_get_at_pixel(global.Tiles_1,_x,_y+tileSize);
	checkLft = tilemap_get_at_pixel(global.Tiles_1,_x-tileSize,_y);

	if(checkUp > 0){image ++;}
	if(checkRt > 0){image += 2;}
	if(checkDn > 0){image += 4;}
	if(checkLft > 0){image += 8;}

	return image;


}
