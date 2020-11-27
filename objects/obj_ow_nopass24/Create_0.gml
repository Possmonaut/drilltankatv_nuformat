
sprite_index = sp_iso_test21;
upObj = instance_create_depth(x, y-32, -10, text_wall_no_pass_top);
downObj = instance_create_depth(x, y + 24, 10, text_wall_no_pass_bot); //depth 10

LOSconfirm = 0;
directLOS = false;

line_detect_list = ds_list_create();
myShadow = noone;

myShadowUpper = noone;
myShadowMid = noone;
myShadowLower = noone;

target = obj_ow_player_tank;
draw_shadows = false;

distMult = shader_get_uniform(distance_shader, "distMult");
distMultC = 0;

techDepth = 0;

LOSconfirm1 = 0;
LOSconfirm2 = 0;
LOSconfirm3 = 0;
LOSconfirm4 = 0;