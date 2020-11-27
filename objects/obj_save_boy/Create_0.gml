//todo
/*
add a metadata list that load swhen the game starts and tracks things like "have we visited this room before"
*/


var l = layer_get_id("Tiles_1");
tilemap = layer_tilemap_get_id(l);

tempText = ""; //our entered text stored as string
displayText = "";

key_back = false;
key_enter = false;
key_current = "";
key_active = false;
key_load = false;
key_erase = false;

saveTrigger = false;
loadTrigger = false;
eraseTrigger = false;

var yy = 250;//tilemap_get_height(250); //note: you will need to change this to correct it's own size when using dif sized rooms
var xx = 250;//tilemap_get_width(250);
	
transGrid = ds_grid_create(xx,yy);
transMap = ds_map_create();

//remove this later
//ds_map_add(transMap, "arse", "a butt");

displayTrigger = "";
displayObj = 0;
displayActive = true;

saveLocal = "";
init = true; //use this to create the directory at the beginning of the game. jujst so we don'tt load said saving code each time 

triggerList = ds_list_create();

triggerList[|0] = false; //opening complete. true = has been played, false = new game
triggerList[|1] = 1; //depot to spawn at. 0 = elevator. 1 = first depot, etc
triggerList[|2] = rm_new_demo; //room to spawn in
triggerList[|3] = 480; //x of the depot to spawn in. defaults to elevator
triggerList[|4] = 544; //y of the depot to spawn in. defaults to elevator
triggerList[|5] = 99; //health
triggerList[|6] = 99; //hpMax
triggerList[|7] = 0; //ore
triggerList[|8] = 0; //paycheck 
triggerList[|9] = 3; //bombs
triggerList[|10] = 0; //obj_ow_black_wreck
triggerList[|11] = 0; // transponder key
triggerList[|12] = false; //if we've saved, aka if the load option is avaiable 
triggerList[|13] = 0; //ore mined
triggerList[|14] = 3; //master volume
triggerList[|15] = 0; //money earned 
triggerList[|16] = 0; // time played

bboxMax = 50;
for(i = 0; i < bboxMax; i ++)
{
	triggerList[|17 + i] = 0; //for bbox values
}

target = obj_ow_player_tank;
tInstantiator = obj_ow_auto_tile_dark;
fade = obj_ow_fade_handler;
//once done, remove the triggers from the begin step, as itt will be other objects that will trigger the 
//save / load states, as opposed to this object itself 

TPTrigX = 0;
TPTrigY = 0;
TPTrig = false;

cRoom = rm_new_demo;
rSwap = false;

rmStrList = 0;
rmStrList[0] = "tileMap"; //rm_new_demo
rmStrList[1] = "radarMap";

rmStrList[2] = "tileMap1"; // rm_ocean1
rmStrList[3] = "radarMap1";

rmStrList[4] = "tileMap2"; // rm_crystal_1
rmStrList[5] = "radarMap2";

rmStrList[6] = "tileMap3"; // rm_fungal_1
rmStrList[7] = "radarMap3";

roomLoad = true;
trigLoad = true;
opnLoad = false;
newGame = false; 

roomGoto = 0;

roomSwap = false;
openLoad = false;
bootLoad = false;

saveComp = false;
saveSwitch = false;
roomGotoComp = false;
loadComp = false;
coordLoadComp = false;
blockClear = false;
loadSwitch = false;
audSwitch = false;

debug1 = 0;

timer = 0;
