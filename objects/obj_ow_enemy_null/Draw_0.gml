//if(collision_line(x + 16, y, target.x +16, target.y + 16, obj_ow_nopass, false, true) = noone)
//{depth = 9;}
//else
//{ depth = 30;}


draw_self();
draw_text(x - 20, y - 20, LOSconfirm);
LOSconfirm = 0;

/*
draw_text(x, y - 20, LOSconfirm);

if(collision_line(x + 16, y + 16, target.x + 16, target.y + 16, obj_ow_nopass, false, true) = noone)
{ draw_line_color(x + 16, y + 16, target.x + 16, target.y + 16, c_red, c_red);}
	