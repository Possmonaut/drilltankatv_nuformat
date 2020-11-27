function sc_autotile_image_48(argument0, argument1) {
	//returns the image_index from a sprite 

	var XX, YY, image, tileSize, checkUp, checkUpRt, checkRt, checkDnRt, checkDn, checkDnLft, checkLft, checkUpLft;

	XX = argument0;
	YY = argument1;
	image = 0;
	tileSize = sprite_width;

	checkUpLft = 0;
	checkDnLft = 0;
	checkUpRt = 0;
	checkDnRt = 0;

	checkUp = tilemap_get_at_pixel(global.Tiles_1,XX,YY-tileSize);

	checkRt = tilemap_get_at_pixel(global.Tiles_1,XX+tileSize,YY);

	checkDn = tilemap_get_at_pixel(global.Tiles_1,XX,YY+tileSize);

	checkLft = tilemap_get_at_pixel(global.Tiles_1,XX-tileSize,YY);


	if(checkUp != 0 && checkRt != 0)
	{
	checkUpRt = tilemap_get_at_pixel(global.Tiles_1,XX+tileSize,YY-tileSize);
	}

	if(checkDn != 0 && checkRt != 0)
	{
	checkDnRt = tilemap_get_at_pixel(global.Tiles_1,XX+tileSize,YY+tileSize);
	}

	if(checkDn != 0 && checkLft != 0)
	{
	checkDnLft = tilemap_get_at_pixel(global.Tiles_1,XX-tileSize,YY+tileSize);
	}

	if(checkUp != 0 && checkLft != 0)
	{
	checkUpLft = tilemap_get_at_pixel(global.Tiles_1,XX-tileSize,YY-tileSize);
	}

	if(checkUp != 0){image += 2;}
	if(checkUpRt != 0){image += 4;}
	if(checkRt != 0){image += 16;}
	if(checkDnRt != 0){image += 128;}
	if(checkDn != 0){image += 64;}
	if(checkDnLft != 0){image += 32;}
	if(checkLft != 0){image += 8;}
	if(checkUpLft != 0){image += 1;}

	return image;


}
