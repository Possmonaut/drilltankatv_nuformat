if(surface_exists(global.shadows))
{
surface_set_target(global.shadows);
draw_sprite(spr_light_test, image_index, mouse_x, mouse_y);
surface_reset_target();
}
