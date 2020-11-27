depth = 1;
myShadow = instance_create_depth(x, y, 11, obj_ow_shadow_block);
image_speed = 0;

line_detect_list = ds_list_create();
line_detect_list2 = ds_list_create();
ring_depth_list = ds_list_create();

for( var i = 0; i < 6; i ++){

	ring_depth_list[|i] = 0;
}


newDepth = 0;
depthSelect = 0;

targetX = -1;
targetX = -1;

target = obj_ow_player_tank;


LOSconfirm = 0;

x1 = 5;
y1 = 5;
x2 = 27;
y2 = 5;
x3 = 5;
y3 = 28;
x4 = 27;
y4 = 28;

x5 = 5;
y5 = 5;
x6 = 27;
y6 = 5;
x7 = 5;
y7 = 28;
x8 = 27;
y8 = 28;

/*
x1 = 1;
y1 = 1;
x2 = 31;
y2 = 1;
x3 = 1;
y3 = 32;
x4 = 31;
y4 = 32;