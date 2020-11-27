lower = false;
target = obj_ow_player_tank;

depth = 48;
//trigger
collision = true;
drillable = true;
HP = 100;
dsTrig = true;
deathSpawn = -4;
tsTrig = false;
tileSpawn = -4;

myAngle = -1;

var pChance = irandom(1000);
if(pChance = 1000)
{
deathSpawn = obj_ow_possum;
}
else
{
deathSpawn = obj_ow_ore_chunk;
}


shadowActive = false;

deathAudio = so_rock_break;
drillAudio = so_drill_inrock;

sprite_index = sp_shadow;

tilemap_set_at_pixel(global.Shadow_Lower,1,x,y);

var _b = instance_create_depth(x,y,depth,obj_ow_radar_blip);
_b.progen = id;