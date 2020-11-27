target = obj_ow_player_tank;
camTarg = obj_ow_camera;

oreLoss = 0;
shake = true;
image_alpha = 0;
depth = -1;
letterTimer = 0;

onDepo = false;
keySpace = false;
repairTimer = 0;

timer = 0;

buttonGen = false;
buttonArray = 0;
buttonArrayActive[0] = 0;
buttonArrayActive[1] = 0; //repair
buttonArrayActive[2] = 0; //buy bombs
buttonArrayActive[3] = 0; //exit
keyUp = 0;
keyDown = 0;
docked = false;

armSpeed = 0.25;

saveTrigger = false;
saveComplete = false;

midX = sprite_width * 0.5;
midY = sprite_height * 0.5;

tCollide = false;

myIndicate = instance_create_depth(x,y,target.depth+1,obj_ow_generic);
myIndicate.sprite_index = sp_depot_indicator;

myArm = 0;

checkDist = 256;