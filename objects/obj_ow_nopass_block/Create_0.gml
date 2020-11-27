lower = false;
target = obj_ow_player_tank;

depth = 48;
sprite_index = sp_shadow;

//trigger
collision = true;
drillable = false;
HP = 100;
dsTrig = false;
deathSpawn = -4;
tsTrig = false;
tileSpawn = -4;

myAngle = -1;

shadowActive = false;

tilemap_set_at_pixel(global.Shadow_Lower,1,x,y);
