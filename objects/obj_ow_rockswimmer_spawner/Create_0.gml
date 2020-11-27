depth = 250;

target = obj_ow_player_tank;
mySpawn = instance_create_depth(x,y,depth,obj_ow_rockswimmer);
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
