//myAlpha -= (life / 10000);
draw_set_alpha(myAlpha);
draw_rectangle(x, y, x + mySize, y + mySize, false);
draw_set_alpha(1);

if(life <= life - 60)
{
	myAlpha -= 0.01;
}