//if(collision_line(x + 16, y, target.x +16, target.y + 16, obj_ow_nopass, false, true) = noone)
//{depth = 9;}
//else
//{ depth = 30;}

draw_self();

	//22.5
	if(direction < 22.5 && direction > 337.5){upObj.image_index = 0;}
	//67.5
	if(direction < 67.5 && direction > 22.5){upObj.image_index = 1;}
	//112.5
	if(direction < 112.5 && direction > 67.5){upObj.image_index = 2;}
	//157.5
	if(direction < 157.5 && direction > 112.5){upObj.image_index = 3;}
	//202.5
	if(direction < 202.5 && direction > 157.5){upObj.image_index = 4;}
	//247.5
	if(direction < 247.5 && direction > 202.5){upObj.image_index = 5;}
	//292.5
	if(direction < 292.5 && direction > 247.5){upObj.image_index = 6;}
	//337.5
	if(direction < 337.5 && direction > 292.5){upObj.image_index = 7;}
	directionChange = 0;

draw_text_color(x,y,HP,c_red,c_red,c_red,c_red,1);

/*
draw_text(x, y - 20, LOSconfirm);

if(collision_line(x + 16, y + 16, target.x + 16, target.y + 16, obj_ow_nopass, false, true) = noone)
{ draw_line_color(x + 16, y + 16, target.x + 16, target.y + 16, c_red, c_red);}
	