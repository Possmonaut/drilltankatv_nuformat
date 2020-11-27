global.debugOn = false;

//if(global.debugOn = true){image_alpha = 0.5;}
//else{image_alpha = 0;}

image_alpha = 0;

//default depth is 0
//depth = -100;
visualSpriteTank = instance_create_depth(x + 16, y +16, -2, obj_ow_player_tank_sp);
visualSpriteDrill = instance_create_depth(x +16, y +16, -2, obj_ow_tank_sp_drill);
colliderDrill = instance_create_depth(x, y -32, depth, obj_ow_tank_drill);
//killZone = instance_create_depth(x,y,depth,obj_ow_kill_detect);
//killZone = image_alpha = 0;

draw_set_font(pixelette16);

var l = layer_get_id("collision_map");
tilemap = layer_tilemap_get_id(l);

alartTest = false; //used to turn the object on / off

movespeed = 32;

sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);

timer = 0; //times everything 
accelTimer = 0; //pauses between acceleration / deceleration / turning
turnTimer = 0;
turningTimer = 0; //pauses movement while rotating
visualTurningTimer = 0;
turning = 0; //0 = not turning, 1 = right, 2 = left
jumpTimer = 0; //measures between pixel hops

dir = 0; //0 = up 1 = right 2 = down 3 = left
facing = 0; //same as dir, but only controls the facing for collision detection
rotateFrame = 0; //frame for tank rotation sprite
spriteRotate = 0; //angle for flashlight
forwardSpeed = 0; //maximum speed. 0 = no movement, 1 = half speed, 2 = full speed
drillTimer = 0; //sets the damage per second
drillOn = false; //if drill is dealing damage
drillDamage = 1; //base damage of drill
visualJumptimer = 0; //for the movement of the tanksprite
slowing = false; //if slowing from 2 to 0
keyOff = true; //check for key release on turn

stopTimer = false;
stopTimerTimer = 0;
stopPause = false;

collision = false; //did we slam into something?
againstWall = 0; // are we against something?
decel = false; //stores deceleration commands

drillStop = false;
drillStopTimer = 0;
drillHeat = 0;
drilling = false; //are we drillin' or uh

//below this point are variables you should add in later for ease of modification
topSpeed = 0;
rammingSpeed = 2;
rammingBonus = 3;

activeBomb = 0;
blastTriggerDelay = 0;

debug1 = 0;
debug2 = 0;
debug3 = 0;
debug4 = 0;

velocity = 0;
acc = 0.025;
xVelo = 0;
yVelo = 0;

angleDir = 270;

//visualSpriteDrill = instance_create_depth(x +16, y +16, -2, obj_ow_test_drill);
visualSpriteDrill.image_angle = 270;

timer = 0;
dirTimer = 0;
rPause = false;

sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);

facing = 0;

collisionVeloX = x;
collisionVeloY = y;

RPosX = 0;
RPosY = 0;

rOffset = 0;
distOffset = 0;

rotateAccel = 0; //uses for rotation accel / decel
rotateUpdate = 0; //lame thing used to update the drill rotation

maxFSpeed = 1.5; //top speed, modified via turning
maxRSpeed = -0.5; //top reverse speed

drillArray[0] = 0; //for loading the three points in the drill triangle
drillArray[1] = 0;
drillArray[2] = 0;
drillArrayC = 0; //for changing the index to damage

ore = 0;
HP = 99;
HPMax = 99;
paycheck = 0;
bombs = 3;



var l = layer_get_id("Tiles_1");
global.Tiles_1 = layer_tilemap_get_id(l);

controlPause = false;
tutComplete = false;

currGear = 0;
gearTimer = 0;
lastGear = 0;

audio_play_sound(amb_rumble_drone,1,true);

centerDrillXX = 0;
centerDrillYY = 0;

//instance_create_depth(x,y,-1, obj_ow_tile_instantiator);