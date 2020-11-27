
//draw_sprite(sp_tank1,0,x-32,y-16);

//draw_circle(endpointX, endpointY, 4, false);
//draw_circle(midjointX, midjointY, 4, false);
//draw_circle(x,y,4,false);

//draw_line(x,y,midjointX,midjointY);
//draw_line(midjointX,midjointY,endpointX,endpointY);
//draw_line(endpointX,endpointY,endpointX,endpointY+16);

//point_Direction base to mid
//point direction mid to hand
//angle of hand always = whatever 
//draw_sprite_ext( sprite, subimg, x, y, xscale, yscale, rot, colour, alpha ); //bicep
//draw_sprite_ext( sprite, subimg, x, y, xscale, yscale, rot, colour, alpha ); //forearm
//draw_sprite_ext( sprite, subimg, x, y, xscale, yscale, rot, colour, alpha ); //hand

var armF = 1 * armType;
var armOfst = 415;
if(armType = -1)
{
	armOfst = 125;
}




armDirBase = point_direction(x,y,midjointX,midjointY) + armOfst;
armDirMid = point_direction(midjointX,midjointY,endpointX,endpointY) + 270;
draw_sprite_ext(sp_grinder_bicep, 0, x, y, armF, 1, armDirBase, c_white, image_alpha);
draw_sprite_ext(sp_grinder_forearm, 0, midjointX, midjointY, armF, 1, armDirMid, c_white, image_alpha);
//draw_sprite_ext(sp_welder_arm_hand, 0, endpointX, endpointY, 1, 1, 45, c_white, 1);