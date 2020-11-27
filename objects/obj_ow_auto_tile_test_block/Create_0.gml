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

//this doesn't seem to work; why 

/*
var l = layer_get_id("Tiles_Shadow_Lower");

var mT = layer_tilemap_get_id(l);

tilemap_set_at_pixel(mT,1,x,y);
*/

deathAudio = so_rock_break;
drillAudio = so_drill_inrock;


tilemap_set_at_pixel(global.Shadow_Lower,1,x,y);
tilemap_set_at_pixel(global.Shadow_Ping,1,x,y);

//sprite_index = sp_32_simplo_block;



/*
tileX = tilemap_get_cell_x_at_pixel(global.Tiles_1,x,y);
tileY = tilemap_get_cell_y_at_pixel(global.Tiles_1,x,y);

lowerT = 0;

if(tilemap_get(global.Tiles_1,tileX,tileY+1) = 0)
{
	lowerT = instance_create_depth(x,y+32,depth,obj_ow_lightless_no_collision);
}
