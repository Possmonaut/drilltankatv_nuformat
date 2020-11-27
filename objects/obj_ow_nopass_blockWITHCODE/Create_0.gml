uDepth = 1;
mDepth = 2;
dDepth = 3;
sDepth = 13;


upObj = instance_create_depth(x, y-32, uDepth, text_wall_no_pass_top);
depth = mDepth;
downObj = instance_create_depth(x, y + 24, dDepth, text_wall_no_pass_bot);
myShadow = instance_create_depth(x, y, sDepth, obj_ow_shadow_block);
upObj.image_speed = 0;
image_speed = 0;
downObj.image_speed = 0;
sprite_index = sp_iso_test21;

line_detect_list = ds_list_create();
line_detect_list2 = ds_list_create();
ring_depth_list = ds_list_create();

HP = 3;

for( var i = 0; i < 6; i ++){

	ring_depth_list[|i] = 0;
}

DLOS = 0;
DLOS2 = 0;

newDepth = 0;
depthSelect = 0;

distMult = shader_get_uniform(distance_shader, "distMult");
distMultC = 0;

targetX = -1;
targetY = -1;

target = obj_ow_player_tank;


LOSconfirm = 0;

LOSconfirm1 = 0;
LOSconfirm2 = 0;
LOSconfirm3 = 0;
LOSconfirm4 = 0;

x1 = 2;
y1 = 2;
x2 = 30;
y2 = 1;
x3 = 1;
y3 = 30;
x4 = 29;
y4 = 29;

x5 = 15;
y5 = 15;
x6 = 16;
y6 = 15;
x7 = 15
y7 = 15;
x8 = 16;
y8 = 16;