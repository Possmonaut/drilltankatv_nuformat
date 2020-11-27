/// @make enemy tiles
//image_alpha = 0;

//test vars
var1 = 0;
var2 = 0;
var3 = 0;

target = obj_ow_player_tank;

depth = target.depth-1;

//this determines what cell the player is in
squareX = 0;
squareY = 0;

//used for tile updates
xStore = target.x;
yStore = target.y;
update = true;

//>>>>> you'll want to inscrease the value of below or else enemies cannot path correctly
//or change enemy pathing to base itself off tilesets, not entity maps 

//for the square detection space you can take the length, subtract 1, then divide by two to get the start point.
//note: the below are measured in cells of 32 pixels
//default: 27 is the minimum, 25 is a little too small but isn't really noticable
endCellGen = 31; //basically the length of each of the update box' sides, centered on the player
startCellGen = (endCellGen+1) /2;

endCellClean = endCellGen + 2; //basically the length of each of the delete box' sides, centered on the player
startCellClean = (endCellClean+1) /2;
ImobCellClean = startCellClean * 32;

//note: the below is needed to allow other objects to access the Tiles_1 layer for detection



var l = layer_get_id("Tiles_1");

global.Tiles_1 = layer_tilemap_get_id(l);


global.activeBlocks = ds_list_create();

arrayMax = 9; //used to prevent out of bounds errors
//global.blockArray = ds_list_create();
global.blockArray[0] = 0;
global.blockArray[1] = obj_ow_generic;
global.blockArray[2] = obj_ow_nopass_block;
global.blockArray[3] = obj_ow_rock;
global.blockArray[4] = obj_ow_ore_vein;
global.blockArray[5] = obj_ow_nopass_hidden;
global.blockArray[6] = obj_ow_superheated_wall;
global.blockArray[7] = obj_ow_superheated_floor;
global.blockArray[8] = obj_ow_enemy_chaser;
global.blockArray[9] = obj_ow_auto_tile_test_block;

bgAlpha = 1;
hazeBegin = true;

timer = 0;
updateTimer = 0;

debug1 = 0;