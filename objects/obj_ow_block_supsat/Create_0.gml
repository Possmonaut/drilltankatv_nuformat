sprite_index = sp_shadow;
//mask_index = sp_shadow;

lower = false;
target = obj_ow_player_tank;

//depth = obj_ow_auto_tile_dark.depth +1;
depth = 48;
//trigger
collision = true;
drillable = true;
HP = 100;
dsTrig = true;
deathSpawn = obj_ow_supsat_gen;
tsTrig = false;
tileSpawn = -4;

myAngle = -1;

shadowActive = false;

deathAudio = so_crys_break;
drillAudio = so_drill_incrys;

//this doesn't seem to work; why 

cDest = false;


var l = layer_get_id("Tiles_Shadow_Lower");

var mT = layer_tilemap_get_id(l);

tilemap_set_at_pixel(mT,1,x,y);