myPath = path_add();
path_set_kind(myPath, 1); //sets path, 0 for straight 1 for smooth
myArm = instance_create_depth(x+16,y+16,depth,obj_ow_grinder_arms);
//set sprites for garms. we'll probably need to create a new arm type that also has hands 

tAngle = 0;
tDist = 0;

target = obj_ow_player_tank;


state = 0;
timer = 0; 
updateTimer = 0;
updateInterval = 60;


