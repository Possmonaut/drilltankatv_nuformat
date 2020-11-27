x = target.x;
y = target.y;

//for now we're having the objects create their own entries into the global.activeBlocks list
//later we can change it to be a bit more simple

//have each object, when it is created, add itself to the global.blocklist
//then have this object run a for loop
//have it use a VAR for the indicator. so var max = ds_list_size_(global.blocklist);
// for(var i = 0; i < max; i ++)
//potentially have it do all of this on the END step so that it doesn't overlap with the instantiator's obj. creation.
//instantiator should add the objects and delete the objects, not the objects themselves
//also make sure things are being drawn at the correct depth. either change the depth of self or
//draw_set_depth? 
//then go through each and do the draw via the draw event 

//we're going to want to figure out how to throttle things below so we don't run for loops more times per
//frame than we need

