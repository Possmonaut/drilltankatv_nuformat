//draw_self();
//draw_sprite(sp_default_32,0,x,y);
draw_circle(x,y,4,false);

eRad += circleSize;
circleAlpha -= 0.01;
if(eRad > radMax)
{
	eRad = 0;
	circleAlpha = 1;
}

draw_set_alpha(circleAlpha);
draw_circle(x,y,eRad,true);
draw_set_alpha(1);