//image_alpha = 0;
//image_speed = 0;
//depth = 599; //was 4 //was -10
target = obj_ow_player_tank;
originDepth = 0;

timer = 0;
rotation = 0;
storeFrame = 0;

vib = 0;
vibAxis = 0;
vibSwitch = -1;
vibTimer = 0;

vibFrame = 0;

turnComplete = false;
nextFrame = 0;

damageTaken = false;
damageFlash = false;
flashInterval = 0;
flashTimer = 0;

playerDeath = false;
flashSpeed = 10;
deathTimer = 0;

frameUpdate = 0; //checks whether it's time to update the rotation frames or not 

shake = true;
storeX = x;
storeY = y;
storeReturn = false;
shakeTimer = 0; 
nextRoom = false;

xscale = image_xscale;
yscale = image_yscale;

alphaScale = 0.16;

smokeTimer = 0;
maxSmoke = 3;
circleSize = 0;
circleAlpha = 1;


flashlight = instance_create_depth(x,y,-9,obj_ow_generic);

//depth = target.depth + 3;

trdOfst = 9;
trdSpd = 16;
treadLeft = instance_create_depth(x,y,depth+1,obj_ow_generic);
treadRight = instance_create_depth(x,y,depth+1,obj_ow_generic);
treadLeft.sprite_index = sp_tread_sp;
treadRight.sprite_index = sp_tread_sp;

//treadLeft.image_xscale = 2;
//treadLeft.image_yscale = 2;

//treadRight.image_xscale = 2;
//treadRight.image_yscale = 2;
//flashlight.sprite_index = sp_vision_cone_test; //sp_vision_cone_test;

bump = false;
bumpTimer = 0;
tSelect = 0;

treadTimer = 0;