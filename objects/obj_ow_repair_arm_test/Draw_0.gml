
//draw_sprite(sp_tank1,0,x-32,y-16);

if(distance_to_object(target) > checkDist)
{
	exit;
}

draw_circle(endpointX, endpointY, 4, false);
draw_circle(midjointX, midjointY, 4, false);
draw_circle(x,y,4,false);

draw_line(x,y,midjointX,midjointY);
draw_line(midjointX,midjointY,endpointX,endpointY);
draw_line(endpointX,endpointY,endpointX,endpointY+16);

//point_Direction base to mid
//point direction mid to hand
//angle of hand always = whatever 
//draw_sprite_ext( sprite, subimg, x, y, xscale, yscale, rot, colour, alpha ); //bicep
//draw_sprite_ext( sprite, subimg, x, y, xscale, yscale, rot, colour, alpha ); //forearm
//draw_sprite_ext( sprite, subimg, x, y, xscale, yscale, rot, colour, alpha ); //hand

armDirBase = point_direction(x,y,midjointX,midjointY) + 270;
armDirMid = point_direction(midjointX,midjointY,endpointX,endpointY) + 270;
draw_sprite_ext(sp_welder_arm_bicep, 0, x, y, 1, 1, armDirBase, c_white, 1);
draw_sprite_ext(sp_welder_arm_forearm, 0, midjointX, midjointY, 1, 1, armDirMid, c_white, 1);
draw_sprite_ext(sp_welder_arm_hand, 0, endpointX, endpointY, 1, 1, 45, c_white, 1);