//note: ofst = offset
//image_alpha = 0;

//test vars
var1 = 0;
var2 = 0;
var3 = 0;

blockGenofst = 0; //basically offsets block for the proper 3D effect

global.blockGenofst = blockGenofst;

target = obj_ow_player_tank;

depthOFST = -100;
depth = target.depth-1 + depthOFST;


//this determines what cell the player is in
squareX = 0;
squareY = 0;

//used for tile updates
xStore = target.x;
yStore = target.y;
update = true;

//for the square detection space you can take the length, subtract 1, then divide by two to get the start point.
//note: the below are measured in cells of 32 pixels
//default: 27 is the minimum, 25 is a little too small but isn't really noticable
endCellGen = 27; //basically the length of each of the update box' sides, centered on the player
startCellGen = (endCellGen+1) /2;

endCellClean = endCellGen + 1; //basically the length of each of the delete box' sides, centered on the player
startCellClean = (endCellClean+1) /2;
ImobCellClean = startCellClean * 32;

targetTileX = 0;
targetTileY = 0;

//note: the below is needed to allow other objects to access the Tiles_1 layer for detection

var l = layer_get_id("Tiles_1");

global.Tiles_1 = layer_tilemap_get_id(l);

var k = layer_get_id("Tiles_Lower");

global.Tiles_Lower = layer_tilemap_get_id(k);

var j = layer_get_id("Tiles_Upper");

global.Tiles_Upper = layer_tilemap_get_id(j);

var h = layer_get_id("Tiles_Middle");

global.Tiles_Middle = layer_tilemap_get_id(h);

var g = layer_get_id("Tiles_UaL_Baseline");

global.Tiles_Baseline = layer_tilemap_get_id(g);

var h = layer_get_id("Tiles_Shadow_Lower");

global.Shadow_Lower = layer_tilemap_get_id(h);

var p = layer_get_id("Tiles_Ping_Shadow");

global.Shadow_Ping = layer_tilemap_get_id(p);
					
global.activeBlocks = ds_list_create();
//listt of blocks currently alive in the map. as of now not used for anything 3/1/2020

arrayMax = 10; //used to prevent out of bounds errors

//block array current just a array as it will most likely never need to be sorted 
global.blockArray[0] = 0;
global.blockArray[1] = obj_ow_nopass_block; //impassable and undrillable, shadows
global.blockArray[2] = obj_ow_nopass_block; //impassable and undrillable, shadows
global.blockArray[3] = obj_ow_block_generic_rock; //impassable, drillable, shadows
global.blockArray[4] = obj_ow_ore_vein; //rock, drops ore, shadows
global.blockArray[5] = obj_ow_nopass_hidden; //does not create a ping, impassable, shadows
global.blockArray[6] = obj_ow_superheated_wall; //rock, generates heat when drilled, shadows
global.blockArray[7] = obj_ow_superheated_floor; //generates heat when rolled over, no shadows
global.blockArray[8] = obj_ow_grinder_spawner; //enemy
global.blockArray[9] = obj_ow_auto_tile_test_block; //general; no behaviors, impassable, shadows
global.blockArray[10] = obj_ow_block_coral; //clone of default rock
global.blockArray[11] = obj_ow_block_generic_rock; //new rock; basically a way to make visually unique blocks with no mechanical differences
global.blockArray[12] = obj_ow_block_generic_rock; //crystal rock
global.blockArray[13] = obj_ow_block_generic_rock; //organic crystal
global.blockArray[14] = obj_ow_block_supsat; //supersaturated mech block
global.blockArray[15] = obj_ow_block_generic_rock; //fungal 1
global.blockArray[16] = obj_ow_block_generic_rock; //fungal 2
global.blockArray[17] = obj_ow_mimic_spawner;
global.blockArray[18] = obj_ow_swimbounce_spawner
global.blockArray[19] = obj_ow_rockswimmer_spawner;
global.blockArray[20] = obj_ow_monolith_spawner;
global.blockArray[21] = obj_ow_cTank_spawner;
global.blockArray[22] = obj_ow_spore_chim_spawner;
global.blockArray[23] = obj_ow_nopass_block; //impassable and undrillable, shadows, draws floor tile 
global.blockArray[24] = obj_ow_fleer_spawner;

arrayMax = array_length(global.blockArray)-1; //if this sends errors, add a +1 to the end 

spriteList[0] = sp_nopass;
spriteList[1] = sp_block_unbreak;
spriteList[2] = sp_nopass;
spriteList[3] = sp_block_rock
spriteList[4] = sp_ore_ping_block;
spriteList[5] = sp_nopass; //needs to have a floor ping and not generate a shadow
spriteList[6] = sp_supeheated_block;
spriteList[7] = sp_nopass;
spriteList[8] = sp_enemy_marker;
spriteList[9] = sp_ping_block_general;
spriteList[10] = sp_block_coral;
spriteList[11] = sp_block_seastone;
spriteList[12] = sp_block_crystal;
spriteList[13] = sp_block_org_crystal;
spriteList[14] = sp_block_supsat;
spriteList[15] = sp_block_fungal;
spriteList[16] = sp_block_fungal2;
spriteList[17] = sp_enemy_marker;
spriteList[18] = sp_enemy_marker;
spriteList[19] = sp_enemy_marker;
spriteList[20] = sp_enemy_marker;
spriteList[21] = sp_enemy_marker;
spriteList[22] = sp_enemy_marker;
spriteList[23] = sp_ping_block_floor;
spriteList[24] = sp_enemy_marker
//spriteList[23] = sp_ichor_sphincter;


bgAlpha = 1; //out of bounds
hazeBegin = true; //out of bounds

timer = 0;
updateTimer = 0;

debug1 = 0;

global.mp_grid32 = mp_grid_create(0, 0,room_width/32, room_height/32,32,32);

//list init for tileset frame data
global.tileFrameList_island = ds_list_create();
global.tileFrameList = ds_list_create();

var l = global.tileFrameList_island; //list of tile values. currently not used 3/1/2020 but kept as backup

l[|2] = 1;
l[|8] = 2;
l[|10] = 3;
l[|11] = 4;
l[|16] = 5;
l[|18] = 6;
l[|22] = 7;
l[|24] = 8;
l[|26] = 9;
l[|27] = 10;
l[|30] = 11;
l[|31] = 12;
l[|64] = 13;
l[|66] = 14;
l[|72] = 15;
l[|74] = 16;
l[|75] = 17;
l[|80] = 18;
l[|82] = 19;
l[|86] = 20;
l[|88] = 21;
l[|90] = 22;
l[|91] = 23;
l[|94] = 24;
l[|95] = 25;
l[|104] = 26;
l[|106] = 27;
l[|107] = 28;
l[|120] = 29;
l[|122] = 30;
l[|123] = 31;
l[|126] = 32;
l[|127] = 33;
l[|208] = 34;
l[|210] = 35;
l[|214] = 36;
l[|216] = 37;
l[|218] = 38;
l[|219] = 39;
l[|222] = 40;
l[|223] = 41;
l[|248] = 42;
l[|250] = 43;
l[|251] = 44;
l[|254] = 45;
l[|255] = 46;
l[|0] = 47;

var l = global.tileFrameList; //list of tile values. used with sc_autotile_image_48_0_tile script

l[|88] = 1;
l[|82] = 2;
l[|81] = 3;
l[|80] = 4; 
l[|74] = 5;
l[|76] = 6;
l[|72] = 7;
l[|66] = 8;
l[|69] = 9;
l[|68] = 10;
l[|65] = 11;
l[|64] = 12; 
l[|26] = 13;
l[|24] = 14;
l[|50] = 15;
l[|49] = 16;
l[|48] = 17;
l[|138] = 18;
l[|140] = 19;
l[|136] = 20;
l[|162] = 21;
l[|165] = 22;
l[|36] = 23; 
l[|161] = 24;
l[|160] = 25;
l[|18] = 26;
l[|17] = 27;
l[|16] = 28;
l[|130] = 29;
l[|129] = 30;
l[|132] = 31;
l[|129] = 32;
l[|128] = 33;
l[|10] = 34;
l[|12] = 35;
l[|8] = 36; 
l[|34] = 37;
l[|37] = 38;
l[|36] = 39;
l[|33] = 40;
l[|32] = 41;
l[|2] = 42;
l[|5] = 43;
l[|4] = 44;
l[|1] = 45;
l[|90] = 46;
l[|0] = 47;

deleteList = ds_list_create();
blockList = ds_list_create();
cRoom = rm_setup;
updateBlock = true; //you can use this as a trigger to turn the update system on and off
//alarm[0] = 30;
