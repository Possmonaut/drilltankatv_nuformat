if(draw_shadows = true)
{
	if(LOSconfirm <= 7)
	{
	
		if(instance_position(x + 16, y + 32, obj_ow_nopass) != noone)
		{
			LOSconfirm -= 2;
		}
	
		if(instance_position(x + 16, y - 32, obj_ow_nopass) != noone)
		{
			LOSconfirm -= 2;
		}
	
		if(instance_position(x + 32, y + 16, obj_ow_nopass) != noone)
		{
			LOSconfirm -= 2;
		}
	
		if(instance_position(x -32, y + 16, obj_ow_nopass) != noone)
		{
			LOSconfirm -= 2;
		}
	}
	
	
	if(LOSconfirm <= 3) // =0
	{
	distMultC = 1.0;
	//downObj.distMultC = 1.0;
	//upObj.distMultC = 1.0;
	}
	
	if(LOSconfirm > 3) // >0
	{
		if(distance_to_point(target.x + 16, target.y + 16) <= 128)
		{
			if(LOSconfirm >= 4) // =1
			{
			distMultC = 0.5;
			//downObj.distMultC = 0.5;
			//upObj.distMultC = 0.5;
			}
			if(LOSconfirm >= 8) // =2
			{
			distMultC = 0.25;
			//downObj.distMultC = 0.25;
			//upObj.distMultC = 0.25;
			}
			if(LOSconfirm >= 12) // =3
			{
			distMultC = 0.0;
			//downObj.distMultC = 0.0;
			//upObj.distMultC = 0.0;
			}
		}
		else
		{
			distMultC = 0.0;
			//downObj.distMultC = 0.0;
			//upObj.distMultC = 0.0;
		}
	}
	
	
	//if(target.y <= y)
	//{downObj.image_alpha = 0;}
	//else
	//{downObj.image_alpha = 1;}
	
	if(myShadow = noone)
	{myShadow = instance_create_depth(x, y, shadowDepth, obj_ow_shadow_block);}
	draw_shadows = false;
	
}
else
{
	distMultC = 0.0;
	//downObj.distMultC = 0.0;
	//upObj.distMultC = 0.0;
	if(myShadow != noone)
	{instance_destroy(myShadow);}
	myShadow = noone;
	draw_shadows = false;
}

shader_set(distance_shader);
shader_set_uniform_f(distMult, distMultC);
draw_self();
shader_reset();

if(position_meeting(mouse_x, mouse_y, id) = true)
{

	depth = -10;
	draw_line_color(x + x1, y +y1, target.x+x5, target.y+y5,c_red, c_red);
	draw_line_color(x + x2, y +y2, target.x+x6, target.y+y6,c_red, c_red);
	draw_line_color(x + x3, y +y3, target.x+x7, target.y+y7,c_red, c_red);
	draw_line_color(x + x4, y +y4, target.x+x8, target.y+y8,c_red, c_red);
	draw_line_color(x+16, y+16, target.x+16, target.y+16, c_red, c_red);
	
	draw_text_color(x + 28, y +40, LOSconfirm1, c_red, c_red, c_red, c_red, 1);
	draw_text_color(x + 40, y +40, LOSconfirm2, c_red, c_red, c_red, c_red, 1);
	draw_text_color(x + 28, y +60, LOSconfirm3, c_red, c_red, c_red, c_red, 1);
	draw_text_color(x + 40, y +60, LOSconfirm4, c_red, c_red, c_red, c_red, 1);
	draw_text_color(x + 28, y +80, LOSconfirm5, c_red, c_red, c_red, c_red, 1);
	draw_text_color(x + 40, y +80, LOSconfirm, c_red, c_red, c_red, c_red, 1);
	depth = 5;

}



LOSconfirm = 0;
LOSconfirm1 = 0;
LOSconfirm2 = 0;
LOSconfirm3 = 0;
LOSconfirm4 = 0;
LOSconfirm5 = 0;
