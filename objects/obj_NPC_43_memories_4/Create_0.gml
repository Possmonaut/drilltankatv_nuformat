//todo
/*
this has been modified from it's children, so you will need to update them all
if making one of these persistent, will need to make it so that it will detecy more of itself in create,
	and if so, kill self and exit
	then persistence cna be used to check if rooms have been moved between for counters and such 
probably change the below to a ds_grid so that it can read off multiple lines IF needed, then write dif lines when the player comes back
*/

target = obj_ow_player_tank;
depth = target.depth -50;
image_alpha = 0;

xfst = sprite_width *0.5;
yfst = sprite_height*0.5;

myLine = "";
myName = "0o2 4||||400|4";
myNum = 43; //set this to the ID number of this NPC

myTrig = 10; //set me to whatever save point I am reading from

image_index = 1;

myLine = "...Feed strength low. Please connect directly to probe..";

listSz = 1; //set to line number +1

for(var i = 0; i < listSz; i++){addLine[0] = "";}

addLine[0] = "Stuck here at the bottom of the ocean in some half dead beast all because some shithead up top wanted to add another trillion to their high score."


//read the line data below 

lineTarg = 0;
lineTrigger = true;
lineTrig2 = false;

branchTrig = false;
spoolOut = false; //will say all lines then stop
cycleBack = false; //will go back to the beginning
randLine = false; //chooses a randomLine

spoolSt = false; //used for trigger seperation and timing. DO NOT TURN ON turn on spoolOut
spoolTimer = 0;
spoolTime = 120;

randLineMin = 0;
randLineMax = 0;

eRad = 0;
radMax = 120;

distTrig = 256;
closeTrig = 24;

circleSize = distTrig / radMax;
circleAlpha = 1;

myBod = instance_create_depth(x+16,y+16,target.depth-1,obj_ow_generic);
myBod.sprite_index = sp_fungal_probe;
myBod.image_angle = irandom(360);

var l = layer_get_id("Tiles_1");
colliderTile = layer_tilemap_get_id(l);
alarm[0] = 1;

activated = false;
forceActivate = false;

myAud = -1;
trnspndrBeep = false;

var _b = instance_create_depth(x,y,depth,obj_ow_radar_blip_no_despawn);
_b.progen = id;