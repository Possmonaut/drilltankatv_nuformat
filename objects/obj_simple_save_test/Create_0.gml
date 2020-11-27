//space to enter data
//check for file
//if no file, create file
//write data to file
//if file detected, load button active
//when load is pressed, write data to screen
//later,. store and write data to grid (data, visual)
//store as json by converting grid to map 

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

var yy = tilemap_get_height(tilemap);
var xx = tilemap_get_width(tilemap);
	
transGrid = ds_grid_create(xx,yy);
transMap = ds_map_create();


saveLocal = "";
init = true; //use this to create the directory at the beginning of the game. jujst so we don'tt load said saving code each time 