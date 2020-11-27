//add HP and bomb interactions 
//place grinder under enemy parent type 

image_alpha = 0;

activated = false;
fadeVal = 0.85;
forceActivate = false;

angleDir = 0;

var startDir = irandom(3);
direction = startDir*90;

drillArray = ds_list_create();

timer = 0; 
updateTimer = 0;
updateInterval = 60;

eatTimer = 0;
eatInterval = 0;

strikeTimer = 0;
windUpTimer = 60;
strikeInterval = 180;

chaseTimer = 240;
chaseTimerInterval = 240;

target = obj_ow_player_tank;

myPath = path_add();
path_set_kind(myPath, 1); //sets path, 0 for straight 1 for smooth

mySpeed = 0.75;

drillCollider = instance_create_depth(x,y,depth,obj_ow_generic);
drillCollider.sprite_index = sp_grinderface_32x16;
visualSp = instance_create_depth(x,y,depth,obj_ow_generic);
visualSp.sprite_index = sp_grinder_test_2;
visualSp.image_speed = 0;

visualSp.image_alpha = 0;
drillCollider.image_alpha = 0;

state = 0;
//0 = idle
//1 = chase
//2 = charge
//3 = eat
//4 = death

damageTrigger = false;
chrgeSpd = 2.5;
chrgeBase = 2.5;

detectRange = 128;
rammingDistance = 96;

//used by player_tank
HP = 200;
drillable = true;
collision = true
dsTrig = false;
deathSpawn = -4;
tsTrig = false;
tileSpawn = -4;

stepTrigger = true;
stepAlterantor = false;