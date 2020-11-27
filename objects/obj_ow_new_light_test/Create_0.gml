


//object with light needs to add self to this object's newsources list and have a lightSize variable 

//this means this object will need to be loaded before any other objects that add themselves to it's draw list

//todo: set up newer blendmode values to get lightsource gradients to blend properly
//https://www.yoyogames.com/blog/476/quick-and-simple-lighting

depth = -1000;

camTarg = obj_ow_camera;

newSources = ds_list_create();
activeSources = ds_list_create();
activeSrcSprt = ds_list_create();
activeSourcesX = ds_list_create();
activeSourcesY = ds_list_create();
activeSourcesSize = ds_list_create();

shadow = -1;

babyMode = true;
shadowSprite = -1;

target = obj_ow_player_tank;

//player will draw their own lighting source



