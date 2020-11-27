/*
//move sprite location variables 
//draw sprites
//draw line
//draw title screen
//set surface to sprites 
//loop and repeat 

//sp_title_screen_placeholder1

//new test: ignore loop, just get it to draw the sprite from the bottom and add a line each time 

sprite1Y -= 1;
sprite2Y -= 1;
if(sprite1Y = -576)
{
	sprite1Y = 704;
	activeSprite = 1;
	//sprite_delete(sp_seismo_sprite1);
	sp_seismo_sprite1 = 0;
}

if(sprite2Y = -576)
{
	sprite2Y = 704;
	activeSprite = 2;
	//sprite_delete(sp_seismo_sprite2);
	//sp_seismo_sprite2 = 0;
}

draw_sprite_ext(sp_seismo_sprite1, 0, sprite1X, sprite1Y, 1,1, 0, c_white, 1);
draw_sprite_ext(sp_seismo_sprite2, 0, sprite2X, sprite2Y, 1,1, 0, c_white, 1);

newX = irandom_range(-10,10);
var addX = newX + oldX;
if(addX > 864)
{
	addX = 864
}
if(addX < 704)
{
	addX = 704;
}

draw_line(addX, 703, oldX, 702);
oldX = addX;

if(activeSprite = 2)
{
sp_seismo_sprite2 = sprite_create_from_surface(application_surface, 704,sprite2Y, 160, 640, false, false, 0, 0);
}
else
{
sp_seismo_sprite1 = sprite_create_from_surface(application_surface, 704,sprite1Y, 160, 640, false, false, 0, 0);
}
draw_sprite_ext(sp_title_screen_placeholder1,0,0,0,1,1,0,c_white,1);


//so create temp sprite
//merge temp w/ sp_seismosprite
//delete temp
//delete sp_seismosprite when hitting kill point
//reset sp_seismosprite when hitting kill point by setting it a new sprite as created by create from surface

draw_text(0,0, fps);