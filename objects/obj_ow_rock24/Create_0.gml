image_speed = 0;
HP = 3;

LOSconfirm = 0;
directLOS = false;
distance = 0;

line_detect_list = ds_list_create();
myShadow = noone;

target = obj_ow_player_tank;

draw_shadows = false;

sprite_index = sp_iso_test22;

upObj = instance_create_depth(x, y-32, 0, test_wall_top);
depth = 5;
downObj = instance_create_depth(x, y + 24, 10, test_wall_bot);
shadowDepth = 15;
upObj.image_speed = 0;
downObj.image_speed = 0;

distMult = shader_get_uniform(distance_shader, "distMult");
distMultC = 0;

techDepth = 0;

LOSconfirm1 = 0;
LOSconfirm2 = 0;
LOSconfirm3 = 0;
LOSconfirm4 = 0;
LOSconfirm5 = 0;

x1 = 1;
y1 = 1;
x2 = 31;
y2 = 1;
x3 = 1;
y3 = 32;
x4 = 31;
y4 = 32;

x5 = 1;
y5 = 1;
x6 = 31;
y6 = 1;
x7 = 1;
y7 = 32;
x8 = 31;
y8 = 32;

/*
x1 = 0;
y1 = 0;
x2 = 31;
y2 = 1;
x3 = 0;
y3 = 30;
x4 = 31;
y4 = 30;

x5 = 0;
y5 = 0;
x6 = 31;
y6 = 1;
x7 = 0;
y7 = 30;
x8 = 31;
y8 = 30;
/*