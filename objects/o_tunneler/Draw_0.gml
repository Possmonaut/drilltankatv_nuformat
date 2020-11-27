draw_circle(mX,mY,mRad,false);
draw_set_color(c_black);
draw_circle(mX,mY,mRad-20,false);
draw_set_color(c_white);

draw_circle(x,y,bRad,true);
for(var i= 0;i < 18; i++)
{
	draw_line(botCircle[# i, 0],botCircle[# i, 1],midCircle[# i,0],midCircle[# i,1]);
}

for(var i= 0;i < 18; i++)
{
	draw_line(midCircle[# i,0],midCircle[# i,1],topCircle[# i,0],topCircle[# i,1]);
}
draw_circle(x,y,tRad,true);

/*
bot, middle, top
bot / top a stable until we mod them
middle shifts randomly
sent circles up from bottom that will move to meet middle then move to meet top

*/



if(aRad <= mRad)
{
aRad += (bRad / tRad) * spd;
aX = lerp(x, mX, aRad / tRad);
aY = lerp(y, mY, aRad / tRad);
}
else
{
	aRad += (bRad / tRad) * spd;
	aX = lerp(mX, x, aRad / tRad);
	aY = lerp(mY, y, aRad / tRad);
}

if(aRad > tRad)
{
	aRad = bRad;
	aX = x;
	aY = y;
}

draw_circle(aX,aY,aRad,true);

