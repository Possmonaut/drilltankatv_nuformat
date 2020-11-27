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
	sprite_delete(sp_seismo_sprite1);
	sp_seismo_sprite1 = sprite_create_from_surface(application_surface, -704,sprite1Y, 160, 640, false, false, 0, 0);

}

if(sprite2Y = -576)
{
	sprite2Y = 704;
	activeSprite = 2;
	sprite_delete(sp_seismo_sprite2);
	sp_seismo_sprite2 = sprite_create_from_surface(application_surface, -704,sprite2Y, 160, 640, false, false, 0, 0);

}

draw_sprite_ext(sp_seismo_sprite1, 0, sprite1X, sprite1Y, 1,1, 0, c_white, 1);
draw_sprite_ext(sp_seismo_sprite2, 0, sprite2X, sprite2Y, 1,1, 0, c_white, 1);

timer ++;

if(timerRand <= timer)
{
	timerRand = timer + irandom_range(200,300);
	magTarg += irandom_range(10,40);
	newBurst = true;
}


if(newBurst = true)
{
	if(magGain < magTarg)
	{
		magGain += 2;
		magGain += irandom_range(-8,4);
	}
	else
	{
		newBurst = false;
	}
}
else
{
	magGain -= 2;
}

if(magGain < 0)
{
 magGain = 0;
}
if(magTarg < 0)
{
 magTarg = 0;
}

var addX = 784+sin(current_time/15)*magGain;


if(addX > 864)
{
	addX = 864
}
if(addX < 704)
{
	addX = 704;
}

draw_line(addX, 688, oldX, 687);
oldX = addX;

if(activeSprite = 2)
{
	sprite_delete(sp_seismo_sprite2);
	sp_seismo_sprite2 = sprite_create_from_surface(application_surface, 704,sprite2Y, 160, 640, false, false, 0, 0);
}
else
{
	sprite_delete(sp_seismo_sprite1);
	sp_seismo_sprite1 = sprite_create_from_surface(application_surface, 704,sprite1Y, 160, 640, false, false, 0, 0);
}
draw_sprite_ext(sp_title_screen_placeholder1,0,0,0,1,1,0,c_white,1);

draw_circle(784,764,4,false);
draw_line(784, 764, addX, 687);
draw_text(0,0, fps);