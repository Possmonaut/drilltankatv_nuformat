/// @description Insert description here
// You can write your code in this editor

ds_grid_destroy(global.mapGrid);
surface_free(global.map_surface);

/// @description Insert description here
// You can write your code in this editor

//needs to get data from tilemap
//needs to take data from radar sweeps and visually ID'd blocks. 
//copy tilemap form and size
//three grids:
//tilemap
//"is visible" / "has been ID'd"
//actual display map
//the display map will be the one written to the screen

//transfer grid map to shader
//have shader draw to a blank surface
//display surface w/ some offset

//for this test have the radar apply the "visible" tag to the same x/y tiles in the visible grid as the tilemap
//so when it checks a square, if tilemap_index > 0, that cell x / y sets the x / y in the "visible" grid to 1;
//if button pressed, create surface
// read "visible" grid and create the xx / yy bitmap for the shader
//shader bitmap size is the same as the surface
//white for 1 on a 4x4 space, black for 0 on a 4x4 space
//2 will be the unique ID for the block the player is in
//"save" shader?
//display to screen, center on the player's coordinates (the "2" space)
//close and kill / clean up when button is pressed again
//monitor for lag
//later, let players move the 3 position around the map with arrow keys 

