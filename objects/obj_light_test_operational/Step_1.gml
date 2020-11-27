
if(surface_exists(global.shadows) = true)
{

surface_set_target(global.shadows);

draw_clear_alpha(c_black,0); //this clears the screen, presumably it can reset it to a color

draw_sprite(spr_light_test, -1, mouse_x, mouse_y);

}

