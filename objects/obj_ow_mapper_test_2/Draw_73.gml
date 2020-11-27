

var _x = camera_get_view_x(view);
var _y = camera_get_view_y(view);

var xCenter = _x + (obj_ow_camera.iWidth - tileMapXX) / 2; //camera width
var yCenter = _y + (obj_ow_camera.iHeight - tilemapYY) / 2; //camera height

//later, add in another offset that will center the map on the player
//then let the arrow keys move the map around accordingly

if(activateMap && update = true && !mapWrite)
{
		if(!surface_exists(global.map_surface))
	{
		global.map_surface = surface_create(xCenter+tileMapXX,yCenter+tilemapYY);
	}
	
	surface_set_target(global.map_surface);
	draw_rectangle_color(xCenter,yCenter,xCenter + tileMapXX, yCenter + tilemapYY, c_black,c_black,c_black,c_black, false);
	draw_rectangle(xCenter,yCenter,xCenter + tileMapXX-2, yCenter + tilemapYY-2, true);
	for( var i = 0; i < tileMapXX; i ++)
	{
		for(var o = 0; o < tilemapYY; o ++)
		{
			if(global.mapGrid[# i, o] = 1) 
			{
				draw_point_color(i+ xCenter,o+yCenter, c_white);
				//potentially change this to use rectangle draw 2x2 instead of this, and modify the code to fit 
			}
		}
	}

	update = false;
	mapWrite = true;
	if(mapSprite != -1)
	{
	sprite_delete(mapSprite);
	}
	mapSprite = sprite_create_from_surface(global.map_surface, xCenter,yCenter,tileMapXX, tilemapYY, false, false, 0, 0);
	surface_reset_target();
	surface_free(global.map_surface); //if you don't free the surface it's located to it's generated position for some reason 
}

//later you'll have to let things get resized and zoom in / out, but not until you change the map to run
//at 60 FPS

//if(activateMap = true)
//{
	//draw_rectangle(xCenter,yCenter,xCenter + tileMapXX, yCenter + tilemapYY, true);
	//draw_sprite(mapSprite,0,xCenter, yCenter);
//}

//generate surface
//draw surface when done
//copy surface to sprite
//draw_said_sprite

if(activateMap = true)
{
	var xSizeMult = 1;
	var ySizeMult = 1;
	
	if(sprite_get_height(mapSprite) > sprite_get_width(mapSprite))
	{
		xSizeMult = 750 / sprite_get_height(mapSprite);
	}
	else
	{
		if(sprite_get_height(mapSprite) = sprite_get_width(mapSprite))
		{
			xSizeMult = 750 / sprite_get_height(mapSprite);
		}
		else
		{
			xSizeMult = 750 / sprite_get_width(mapSprite);
		}
	}
	
	draw_text(xCenter/ xSizeMult,yCenter/ xSizeMult-32, "MAP:");
	//sprite_set_offset(mapSprite,sprite_get_width(mapSprite)/2,sprite_get_height(mapSprite)/2)
	draw_sprite_ext(mapSprite,0,xCenter/ xSizeMult,yCenter/ xSizeMult,xSizeMult,xSizeMult,0,c_white,1);
	
	var x1 = tilemap_get_cell_x_at_pixel(global.Tiles_1, target.x, target.y)*3;
	var y1 = tilemap_get_cell_y_at_pixel(global.Tiles_1, target.x, target.y)*3;
	
	wobbleTimer += 3;
	var wobSize = -3 * xSizeMult;
	
	var wobble = (wobSize*dsin(wobbleTimer));
	
	//draw_sprite_ext(sp_location_indicator,0,(x1 + xCenter)/ xSizeMult, (y1 + yCenter + wobble)/ xSizeMult,xSizeMult,xSizeMult,0,c_white,1);
	draw_circle_color((x1 + xCenter)/ xSizeMult, (y1 + yCenter)/ xSizeMult,4,c_white,c_white,false);
	draw_circle_color((x1 + xCenter)/ xSizeMult, (y1 + yCenter)/ xSizeMult,4,c_black,c_black,true);
	draw_circle_color((x1 + xCenter)/ xSizeMult, (y1 + yCenter)/ xSizeMult,5+wobble,c_white,c_white,true);
	draw_circle_color((x1 + xCenter)/ xSizeMult, (y1 + yCenter)/ xSizeMult,6+wobble,c_black,c_black,true);
	//add a sine to the above so it hovers up and down 
}