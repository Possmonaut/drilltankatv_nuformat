/// @description Insert description here
// You can write your code in this editor

//you'll need to change the below to update according t o whatever room you're in
//this needs to = x4 the size of eaech var so that you can have 4x4 size pixels
//then have the radar set 4 of each of the scanned object
global.mapGrid = ds_grid_create(tilemap_get_width(global.Tiles_1) *4, tilemap_get_height(global.Tiles_1)*4);
//surface we'll be shading
global.map_surface = 0;

//the variable(s) we'll be passing into the shader
mapGridS = shader_get_uniform(map_shader, "mapGridInside");
gridMap[0,0] = 0;

//turn on dat fookin' map
activateMap = false;
releaseMap = false;
mapActive = false;

//we'll need to pass in the grid as the data for the vec3, which i'm assuming is on the first page of the shader
//then have the shader shade the object according to the pixel currently targeted on the second page
//which is just if 0, black, if 1, white

//note: shader has two tabs

//todo:
//decide on pixel size. 8x, or 4x? 

//shaders can only handle array sizes of 178. which is fine, but you'll basically have to split the shader arrays
//into smaller groups before shading the surface. 

depth = -20;

