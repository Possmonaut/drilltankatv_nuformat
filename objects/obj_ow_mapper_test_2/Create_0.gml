global.mapGrid = ds_grid_create(tilemap_get_width(global.Tiles_1) *3, tilemap_get_height(global.Tiles_1)*3);
//surface we'll be shading
global.map_surface = -1;

target = obj_ow_player_tank;
update = true; 

//turn on dat fookin' map
activateMap = false;
releaseMap = false;
mapActive = false;

tileMapXX = 0;
tilemapYY = 0;

depth = -20;

image_alpha = 0;

updateTimer = 0;
timer = 0;
wobbleTimer = 0;

mapSprite = -1;
mapWrite = false;

//you need to change this to draw to some sort of saveable surface, as while is doesn't cause any major issues RN,
//you framerate while the map is active drops to 6 or so 