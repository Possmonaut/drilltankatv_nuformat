//todo
/*
this has been modified from it's children, so you will need to update them all
*/


target = obj_ow_player_tank;
lineTrigger = true;

image_alpha = 0;

xfst = sprite_width *0.5;
yfst = sprite_height*0.5;

myLine = "";
myName = "BB Record xxGKY";

myTrig = 10; //set me to whatever save point I am reading from

image_index = 1;

myLine = "Local Probe Detected in Vicinity. ";

addLine = "Relaying information: bees bees bees.";

eRad = 0;
radMax = 120;

distTrig = 256;
closeTrig = 17;

circleSize = distTrig / radMax;
circleAlpha = 1;

myBod = instance_create_depth(x+16,y+16,target.depth-1,obj_ow_generic);
myBod.sprite_index = sp_drill_probe;
myBod.image_angle = irandom(360);

var l = layer_get_id("Tiles_1");
colliderTile = layer_tilemap_get_id(l);
alarm[0] = 1;

activated = false;
forceActivate = false;

