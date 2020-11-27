//depth = 603;
global.debug = true;
defaultDepth = depth;
//if(global.debugOn = true){image_alpha = 0.5;}
//else{image_alpha = 0;}

image_alpha = 0;

//default depth is 0
//depth = -100;
visualSpriteTank = instance_create_depth(x + 16, y +16, depth-1, obj_ow_player_tank_sp);
visualSpriteTank.originDepth = depth-1;
visualSpriteDrill = instance_create_depth(x +16, y +16, depth-2, obj_ow_tank_sp_drill);
colliderDrill = instance_create_depth(x, y -32, depth, obj_ow_tank_drill);
pickupCollider = instance_create_depth(x,y,depth+1,obj_ow_generic);
pickupCollider.sprite_index = sp_default_48;
pickupCollider.visible = false;
//killZone = instance_create_depth(x,y,depth,obj_ow_kill_detect);
//killZone = image_alpha = 0;
colliderDrill.visible = false;

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
drillDamage = 2.5; //base damage of drill
drillBaseDam = 2.5;
drillHeatGain = 0.05; //drill heat gain when in rock
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
drillVelo = 0.05;
acc = 0.015; //changed from 025 on 11/12
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
rotateSp = 0.05; //gain on rotation speed 
maxRotateSp = 0.05;


maxFSpeed = 0.8; //top speed, modified via turning
maxRSpeed = -0.8; //top reverse speed
axMaxFSpeed = 0.8;
axMaxRSpeed = -0.8;


drillArray[0] = 0; //for loading the three points in the drill triangle
drillArray[1] = 0;
drillArray[2] = 0;
drillArray[3] = 0;
drillArrayC = 0; //for changing the index to damage

ore = 0;
HP = 100;
HPMax = 99;
paycheck = 100;
bombs = 15;
bombMax = 15;

oldAngle = 0;
angleAccel = 0;
maxAnglAccel = 1; //maximum rotation speed
baseMaxAAccel = 1;

var l = layer_get_id("Tiles_1");
global.Tiles_1 = layer_tilemap_get_id(l);

controlPause = false;
tutComplete = false;

currGear = 0;
gearTimer = 0;
lastGear = 0;

//audio_play_sound(amb_rumble_drone,1,true);

centerDrillXX = 0;
centerDrillYY = 0;

inRock = false;
mobile = true;
drillCollision = true;
//instance_create_depth(x,y,-1, obj_ow_tile_instantiator);

//bigAssBG = instance_create_depth(x,y,depth+2,obj_ow_generic);
//bigAssBG.sprite_index = sp_bigassBlackBG;

drillable = false;
destTic = 0;

heatShutdown = false;
overHeat = false;
safeTemp = 80;
overTemp = 90;
maxTemp = 100;
ventTimeMin = 180;
ventTimeMax = 480;


steamTimer = 0;
steamInterval = 5;
steamBurst = true;

override = false;

bombRTimer = 0;
bombReload = false;
bombRTime = 270;

drillAccel = 0;
drillAccMax = 1;
drillAccVar = 0.01;

fathomX = 0;
fathomY = 0;

OOB = false;
slowed = false;

so_drillPitch = 1/60;

pitchGainMax = 0.2;
pitchGain = 0;

drillSoundTrig[0] = false;
drillSoundTrig[1] = false;
drillSoundTrig[2] = false;

myAudInrock = audio_play_sound(so_drill_inrock,1,true);
audio_sound_gain(myAudInrock,0,0);
myAudIncrys = audio_play_sound(so_drill_incrys,1,true);
audio_sound_gain(myAudIncrys,0,0);
myAudInmeat = audio_play_sound(so_drill_inmeat,1,true);
audio_sound_gain(myAudInmeat,0,0);

drillSoundList[0] = myAudInrock;
drillSoundList[1] = myAudIncrys;
drillSoundList[2] = myAudInmeat;

drillSoundGain[0] = 0.25;
drillSoundGain[1] = 0.25;
drillSoundGain[2] = 0.5;


inTunnel = false;
inMagma = false;
soundVent = true;

audOHeat = 0;
audOHeatMod = 0.05;

audDrillJam = -1;
audDrillJamMod = 0.1;

tDraw = -1;

spoolTimer = 0;
spoolTime = irandom_range(60,120);

oHeatTimer = 0;
oHeatTime = 60;

deathAudTemp = 0;

debugAudio = global.audioGain;

so_engineIdle = audio_play_sound(so_drill_engine,1,true);
audio_sound_gain(so_engineIdle,0.05,0);
audio_sound_pitch(so_engineIdle,0.5);

controlBool = false;