surface_free(global.shadows);
global.shadows = surface_create(1280, 720);
surface_set_target(global.shadows);
draw_sprite(spr_light_test, -1, mouse_x, mouse_y);