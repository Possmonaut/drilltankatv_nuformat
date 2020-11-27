function sc_autotile_image_16_lava(argument0, argument1) {
	//returns the image_index from a sprite 

	var obj, image, tileSize, checkUp, checkRt, checkDn, checkLft, _x, _y;

	obj = 0;
	image = 1;
	tileSize = 32;
	_x = argument0;
	_y = argument1;

	checkUp = tilemap_get_at_pixel(global.Tiles_1,_x,_y-tileSize);
	checkRt = tilemap_get_at_pixel(global.Tiles_1,_x+tileSize,_y);
	checkDn = tilemap_get_at_pixel(global.Tiles_1,_x,_y+tileSize);
	checkLft = tilemap_get_at_pixel(global.Tiles_1,_x-tileSize,_y);

	if(checkUp = 6 || checkUp = 7 || checkUp = -1){image ++;}
	if(checkRt = 6 || checkRt = 7 || checkRt = -1){image += 2;}
	if(checkDn = 6 || checkDn = 7 || checkDn = -1){image += 4;}
	if(checkLft = 6 || checkLft = 7 || checkLft = -1){image += 8;}

	return image;
}
