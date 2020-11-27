//breaks if player is in the same x/y and deals damage to them
//breaks if drilled for X
//will collapse and play collapse animation after X, killing self 
//will have to be a hybrid of the normal block and unique code; code: is gonna need to 
//have it's above ping draw a unique sprite 

timer = 0 ;
deathTime = 1200;

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

myPingAs = -4; //instance_create_depth(x,y,obj_ow_auto_tile_dark.depth+1,obj_ow_ping_floor);
vibOFST = 0;
vibTimer = 0;

myDir = 0;
