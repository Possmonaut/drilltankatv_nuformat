var xCenter = (1024 - tileMapXX) / 2; //camera width
var yCenter = (768 - tilemapYY) / 2; //camera height

//later, add in another offset that will center the map on the player
//then let the arrow keys move the map around accordingly

if(activateMap = true && update = true)
{
draw_rectangle_color(xCenter,yCenter,xCenter + tileMapXX, yCenter + tilemapYY, c_black,c_black,c_black,c_black, false);
draw_rectangle(xCenter,yCenter,xCenter + tileMapXX, yCenter + tilemapYY, true);
	for( var i = 0; i < tileMapXX; i ++)
	{
		for(var o = 0; o < tilemapYY; o ++)
		{
			if(global.mapGrid[# i, o] = 1) 
			{
				draw_point_color(i+ xCenter,o+yCenter, c_white);
			}
		}
	}
	//update = false;
	//sprite_delete(mapSprite);
	//mapSprite = sprite_create_from_surface(application_surface, xCenter,yCenter,tileMapXX, tilemapYY, false, false, 0, 0);
}

//later you'll have to let things get resized and zoom in / out, but not until you change the map to run
//at 60 FPS

//if(activateMap = true)
//{
	//draw_rectangle(xCenter,yCenter,xCenter + tileMapXX, yCenter + tilemapYY, true);
	//draw_sprite(mapSprite,0,xCenter, yCenter);
//}