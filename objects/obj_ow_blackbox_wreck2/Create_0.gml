target = obj_ow_player_tank;
lineTrigger = true;

image_alpha = 0;

xfst = sprite_width *0.5;
yfst = sprite_height*0.5;

myLine = "";
myName = "bbox pai140";

var line = irandom(2);
myTrig = 10; //set me to whatever save point I am reading from

image_index = 1;

myLine = "error"

eRad = 0;
radMax = 60;

circleSize = 0.5;
circleAlpha = 1;

myBod = instance_create_depth(x+16,y+16,target.depth-1,obj_ow_generic);
myBod.sprite_index = sp_wrecked_tank_1;
myBod.image_angle = irandom(360);

var l = layer_get_id("Tiles_1");
colliderTile = layer_tilemap_get_id(l);
alarm[0] = 1;

activated = false;
forceActivate = false;