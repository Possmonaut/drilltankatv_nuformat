depth = 0;
downObj.depth = 10;
upObj.depth = -10;
if(myShadow != noone)
{myShadow.depth = 20;}

if(LOSconfirm < 4)
{techDepth = 1;}
if(LOSconfirm >= 4)
{techDepth = 2;}
if(LOSconfirm < 8)
{techDepth = 3;}
if(LOSconfirm < 12)
{techDepth = 4;}

depth += techDepth;
downObj.depth += techDepth;
upObj.depth += techDepth;
if(myShadow != noone)
{myShadow.depth += techDepth;}


if(draw_shadows = true)
{
	
	if(LOSconfirm < 4) // =0
	{
	distMultC = 1.0;
	downObj.distMultC = 1.0;
	upObj.distMultC = 1.0;
	}
	
	if(LOSconfirm >= 4) // >0
	{
		if(distance_to_point(target.x + 16, target.y + 16) <= 128)
		{
			if(LOSconfirm >= 4) // =1
			{
			distMultC = 0.5;
			downObj.distMultC = 0.5;
			upObj.distMultC = 0.5;
			}
			if(LOSconfirm >= 8) // =2
			{
			distMultC = 0.25;
			downObj.distMultC = 0.25;
			upObj.distMultC = 0.25;
			}
			if(LOSconfirm >= 12) // =3
			{
			distMultC = 0.0;
			downObj.distMultC = 0.0;
			upObj.distMultC = 0.0;
			}
		}
		else
		{
			distMultC = 0.0;
			downObj.distMultC = 0.0;
			upObj.distMultC = 0.0;
		}
	}
	
	
	if(target.y <= y)
	{downObj.image_alpha = 0;}
	else
	{downObj.image_alpha = 1;}
	
	if(myShadow = noone)
	{myShadow = instance_create_depth(x, y, 20, obj_ow_shadow_block);}
	draw_shadows = false;
	
}
else
{
	distMultC = 0.0;
	downObj.distMultC = 0.0;
	upObj.distMultC = 0.0;
	if(myShadow != noone)
	{instance_destroy(myShadow);}
	myShadow = noone;
	draw_shadows = false;
}

/*
if(point_distance(target.x, target.y, x, y) <= 256)
{
draw_text_color(x + 8, y +40, LOSconfirm1, c_red, c_red, c_red, c_red, 1);
draw_text_color(x + 20, y +40, LOSconfirm2, c_red, c_red, c_red, c_red, 1);
draw_text_color(x + 8, y +60, LOSconfirm3, c_red, c_red, c_red, c_red, 1);
draw_text_color(x + 20, y +60, LOSconfirm4, c_red, c_red, c_red, c_red, 1);
}
*/

shader_set(distance_shader);
shader_set_uniform_f(distMult, distMultC);
draw_self();
shader_reset();
LOSconfirm = 0;
LOSconfirm1 = 0;
LOSconfirm2 = 0;
LOSconfirm3 = 0;
LOSconfirm4 = 0;
