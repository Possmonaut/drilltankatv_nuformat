lower = false;
target = obj_ow_player_tank;

//trigger
collision = true;
drillable = true;
HP = 3;
dsTrig = false;
deathSpawn = -4;
tsTrig = false;
tileSpawn = -4;

shadowActive = false;

var l = layer_get_id("Tiles_Shadow_Lower");

var mT = layer_tilemap_get_id(l);

tilemap_set(mT,1,x,y);

myAngle = 0;