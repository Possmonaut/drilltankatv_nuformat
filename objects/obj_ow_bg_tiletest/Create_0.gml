//generate a bunch of random tiles
//create a grid the size of the room / 32
//defaultt is 8000
//create a tilemap the size of the room
//fill grid with random values from 1-24
//set each tile in the tile grid to the random value in the grid
//then kill the thing

var l = layer_get_id("tlset_bg_gravel");
bg_gravel = layer_tilemap_get_id(l);

var r = layer_get_id("lava_tile");
bg_lava = layer_tilemap_get_id(r);

var p = layer_get_id("Tiles_1");
tiles_core = layer_tilemap_get_id(p);


filled = false;