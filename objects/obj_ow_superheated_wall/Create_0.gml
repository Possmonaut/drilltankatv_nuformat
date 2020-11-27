lower = false;
target = obj_ow_player_tank;

depth = obj_ow_auto_tile_dark.depth +1;

//trigger
collision = true;
drillable = true;
HP = 100;
dsTrig = false;
deathSpawn = -4;
tsTrig = true;
tileSpawn = 7;

myAngle = -1;

shadowActive = false;

deathAudio = so_rock_break;
drillAudio = so_drill_inrock;

tilemap_set_at_pixel(global.Shadow_Lower,1,x,y);