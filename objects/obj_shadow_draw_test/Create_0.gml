//if operational, fuse into the light controller, alongside the global.activeblocks list 
//will need to draw AFTER lights to avoid lights overlapping the shadows

//activeList = global.activeBlocks;

dynamShadows = -1;

depth = 601;

target = obj_ow_player_tank;
camTarg = obj_ow_camera;

timer = 2;
interval = 3;


x1=0;
y1=0;
x2=0;
y2=0;
x3=0;
y3=0;
x4=0;
y4=0;

dirc = 0;

x11=0;
y11=0;
x21=0;
y21=0;
x31=0;
y31=0;
x41=0;
y41=0;

radius = 320;