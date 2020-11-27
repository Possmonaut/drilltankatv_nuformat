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
dsTrig = false;
deathSpawn = -4;
tsTrig = false;
tileSpawn = -4;

myAngle = -1;

shadowActive = false;

deathAudio = so_rock_break;
drillAudio = so_drill_inrock;

tilemap_set_at_pixel(global.Shadow_Lower,1,x,y);

