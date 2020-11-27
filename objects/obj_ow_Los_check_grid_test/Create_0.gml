depth = 0; 

target = obj_ow_player_tank;

losGrid = ds_grid_create(32,32);

losCheck = 0;

var l = layer_get_id("Tiles_Shadow");

global.Tiles_Shadow = layer_tilemap_get_id(l);

var k = layer_get_id("Tiles_Shadow_Visual");

global.Tiles_Shadow_Visual = layer_tilemap_get_id(k);

update = true;

squareX = 0;
squareY = 0;

targetTileX = 0;
targetTileY = 0;