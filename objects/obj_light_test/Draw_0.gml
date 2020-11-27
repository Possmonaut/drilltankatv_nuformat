if (surface_exists(global.shadows) = false) 
{global.shadows = surface_create(1280, 720);}

//draw_set_color(c_black);
gpu_set_blendmode(bm_add);
draw_surface(global.shadows, 0, 0);
gpu_set_blendmode(bm_normal);
//draw_set_color(c_white);