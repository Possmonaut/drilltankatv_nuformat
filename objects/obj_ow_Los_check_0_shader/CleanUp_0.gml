ds_list_destroy(blockList);
ds_list_destroy(radarList);
ds_grid_destroy(scanGrid);

//quick tests: make line colliders (obj ow nopass) smaller than 32 insetad of bigger
//make them fully 34 instead of 33, with offset of course
//fix scangridd offset
//should be good after that. make some better sprites and we're off
//store legacies
//full implimentation 
//skip lighting 3.0; we don't really need it after this, I think
//transponders

//note: if issues arise in max size room, might be because making a room sized tilemap. 
//if case, can make maps dynamically follow the player 

//you need the above to resize if the player is on the borders of the room or something 