var lDist = 384;
var lDist2 = 128;

var point1 = target.angleDir + 15;
var point2 = target.angleDir + 345;
var XX = target.x+12-(camTarg.x-512);
var YY = target.y+12-(camTarg.y-384);

gpu_set_blendmode(bm_subtract);
surface_set_target(obj_ow_new_light_test.shadow);
draw_triangle_color(XX,YY,XX+lengthdir_x(lDist,point1),YY+lengthdir_y(lDist,point1),XX+lengthdir_x(lDist,point2),YY+lengthdir_y(lDist,point2),c_white,c_black,c_black,false);
draw_circle_color(XX,YY,lDist2,c_white,c_black,false);
surface_reset_target();
gpu_set_blendmode(bm_normal);

