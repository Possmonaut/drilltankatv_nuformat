depth = obj_ow_auto_tile_dark.depth +2;
image_alpha = 0;
/*
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

var XX = ((x - obj_ow_camera.x) * (gui_width / 1024))+gui_width/2;
var YY = ((y - obj_ow_camera.y) * (gui_height / 768))+gui_height/2;

activeHaze = haze_rect_add(XX, YY, 32, 32);
*/

//use the below, but only after the game has fully tiled the level; basically, g ivet he player a set up
//time before things like the instantiator go active


var l = layer_get_id("tlset_bg_gravel");
bg_gravel = layer_tilemap_get_id(l);

drillable = false;
collision = false;

alarm[0] = 1;