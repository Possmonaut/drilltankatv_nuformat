target = obj_ow_player_tank;

radarList = ds_list_create();
blockList = ds_list_create();
verticeListX = ds_list_create();
verticeListY = ds_list_create();
radarFadePointStart = 1;
radarFadePointEnd = 1;

keypress = false;
radarComplete = true;

rotateDir = 0;

depth = -10;

deleteChain = false;

fadeActive = false;
blCurrentFill = 1;

blockList[|0] = 0;

//these blocks need to be set in their corners, but each 1 pixel OUT for the scan to work correctly 
//check diagram in notes 
topLeftcblock = instance_create_depth(x-288,y-288,depth,obj_ow_lightsysmk2_test_corner_block);
topRightcblock = instance_create_depth(x+256,y-288,depth,obj_ow_lightsysmk2_test_corner_block);
botLeftcblock = instance_create_depth(x-288,y+256,depth,obj_ow_lightsysmk2_test_corner_block);
botRightcblock = instance_create_depth(x+257,y+257,depth,obj_ow_lightsysmk2_test_corner_block);

leng = 256;
//corner center top left 512 away

//create four targeting blocks. these unique blocks have the nopass paarent but if detected will be targeted towards
//the CENTER as opposed to the corners

//9/14 chang log
//
twoHit = false;

dir1 = 0;
dir2 = 0;
dir3 = 0;
dir4 = 0;