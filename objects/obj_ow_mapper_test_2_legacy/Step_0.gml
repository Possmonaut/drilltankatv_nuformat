//if room change
x=target.x;
y=target.y;

timer ++;

activateMap = keyboard_check(ord("M"));
releaseMap = keyboard_check_released(ord("M"));

tileMapXX = tilemap_get_width(global.Tiles_1) * 3;
tilemapYY = tilemap_get_height(global.Tiles_1) * 3;
