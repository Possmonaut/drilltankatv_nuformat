depth = 250;
target = obj_ow_player_tank;
mySpawn = instance_create_depth(x,y,depth-1,obj_ow_mimc_snail_v4);
mySpawn.progen = id;
myDist = 1024;
spawnDist = 256;

spawnDeath = false;

isHome = false;

//spawn behavior
//if player within x, spawn
//if player outside x, have spawn return to point, then despawn it and reset
//otherwise if spawn is active, but dead
//kill spawn, and do not respawn anything 

//logic rundown
//when spawned by tile_instantiator, also spawn mySpawn
//if player outside spawn range, check where mySpawn is reletive to player
//if also out of range, kill mySpawn and kill self

//else, if myspawn is dead, do not kill self; remain but stay shut down to keep more 
//enemies from spawning at own point 