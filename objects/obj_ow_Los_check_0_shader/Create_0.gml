target = obj_ow_player_tank;
image_alpha=0;
rotateDir = 0;
radarList = ds_list_create();
sweepLength = 512;
blockList = ds_list_create();
//distMultC = 0;
losCheck = 0;

var l = layer_get_id("Tiles_Shadow");

global.Tiles_Shadow = layer_tilemap_get_id(l);

var k = layer_get_id("Tiles_Shadow_Visual");

global.Tiles_Shadow_Visual = layer_tilemap_get_id(k)

scanGrid = ds_grid_create(64,64);

//todo: smooth our blocks. potentially have a small buffer between alphas so it's less noticable as they light up
//or make the gain in much smaller increments 

//you can probably ditch the image_alpha checks in favor of setting the distMult to something 

timer = 0;
timerUpdate = 10;
update = true;