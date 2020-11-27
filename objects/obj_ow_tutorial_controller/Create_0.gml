//create and manipualte sprites during the tutorial
//monitor player inputs
//feed data to the transponder 
tutorialActive = true;
delayTimer = 0;
stageDelay = 180;
currentDelay = 0; 
currentKey = -1;
target = obj_ow_player_tank;
depth = 0;
finalDelay = 360;


timer = 0;
fadeDone = false; //if the title crawl is done

centerParking = 160;

elevatorX = x; //384
elevatorY = y-1280; //-960

transponder = obj_ow_transponder_controller_temp;
//writeLine = obj_ow_transponder_controller_temp.lineList[|0];

targetX = x; //384
targetY = y; //320

//player is at depth -2

obj_elevator = 0;
//obj_girder = instance_create_depth(x,y+16,depth+1,obj_ow_generic);
//obj_girder.sprite_index = sp_elevator_girder;
//obj_girder2 = instance_create_depth(x,y,depth-4,obj_ow_generic);
//obj_girder2.sprite_index = sp_elevator_girder_wide;

//obj_vater_walls = instance_create_depth(elevatorX,0,depth+1,obj_ow_generic);
//obj_vater_walls.sprite_index = sp_elevator_walls;
//obj_vater_walls.image_yscale = 1.5;
//obj_vater_walls_2 = instance_create_depth(elevatorX-32,0,depth+1,obj_ow_generic);
//obj_vater_walls_2.sprite_index = sp_elevator_walls_wide;
//obj_vater_walls_2.image_yscale = 1.5;

girderDelay = 120;

descendSpeed = 1;

//needs to read up the transponder logs
//logs go from up to down,and will scroll the oldest off the top 
//fairly quick writing speed since they won't be leaving the screen super fast
//after being placed on the screen, wait for the player to perform the correct
//input

//note: this is probably a very ineffecient way to do this, but hey, it'll work

descendAnim = false;

inputStage = -1; //change this back to -1
finalStage = 43;
//0 = accelerate
//1 = decellaret
//2 = left
//3 = right
//4 = recenter
//5 = engage drill for X seconds, manually generate heat
//6 = emergency brake 
//7 = demo charge
//8 = radar
//9 = map
//10 = radio, and radio tune keys (always do this last to play the player in)
////11 = transponder logs (tab) (add later once this is working)
//11 = end 

alarm[0] = 1;

myName = "flightcheck";

tutActive = false;