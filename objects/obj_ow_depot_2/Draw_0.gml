if(distance_to_object(target) > checkDist)
{
	exit;
}

draw_self();

eRad += circleSize;
circleAlpha -= 0.001;
if(eRad > radMax)
{
	eRad = 0;
	circleAlpha = 1;
}

draw_set_alpha(circleAlpha);
draw_circle(x+108,y+201,eRad,true);
draw_set_alpha(1);

draw_text_transformed(x+448,y+180,"0"+string(depot_num),3,3,0);