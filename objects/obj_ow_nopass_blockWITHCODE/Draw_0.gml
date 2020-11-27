draw_self();

	if(DLOS = true)
{
	if(LOSconfirm <= 3) // =0
	{
	distMultC = 1.0;
	downObj.distMultC = 1.0;
	upObj.distMultC = 1.0;
	}
	
	if(LOSconfirm > 3) // >0
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
		else
		{
			distMultC = 0.0;
			downObj.distMultC = 0.0;
			upObj.distMultC = 0.0;
		}
	}
}
else
{
	distMultC = 0.0;
	downObj.distMultC = 0.0;
	upObj.distMultC = 0.0;
}

if(DLOS = false)
{
if(point_distance(x + 15, y + 15, target.x + 15, target.y + 15) <= 128)
		{	upObj.depth = 1;
			depth = 2;
			downObj.depth = 3;
			
			if(point_distance(x + 15, y + 15, target.x + 15, target.y + 15) <= 96) // =2
			{
			distMultC = 0.25;
			downObj.distMultC = 0.25;
			upObj.distMultC = 0.25;
			}
			if(point_distance(x + 15, y + 15, target.x + 15, target.y + 15) <= 64) // =1
			{
			distMultC = 0.5;
			downObj.distMultC = 0.5;
			upObj.distMultC = 0.5;
			}
			if(point_distance(x + 15, y + 15, target.x + 15, target.y + 15) > 96) // =3
			{
			distMultC = 0.0;
			downObj.distMultC = 0.0;
			upObj.distMultC = 0.0;
		}
	}
}


if(target.y <= y)
{downObj.image_alpha = 0;}
else
{downObj.image_alpha = 1;}


shader_set(distance_shader);
shader_set_uniform_f(distMult, distMultC);
draw_self();
shader_reset();
	
LOSconfirm = 0;

