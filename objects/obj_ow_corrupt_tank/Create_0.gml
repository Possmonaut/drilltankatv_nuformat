//todo
/*
tweak movement; give it some accel & decel on speed up / down and rotation
also, probably incrase the slow ammount or something. make it more dangerous feeling
blood, damage, death
leave spore trails while moving 
spawner behavior 
increase damage "area" and possibly the spike itself using a rectangle collider (or the object itself?)
yeah def increase spike size. it's tough to see and the range is WAY too small
have it spray blood / spores when using it's melee strike 
speed up melee strike speed to make it feel more punchy
probably some minor sprite updates 
maybe have it speed up once the player is slowed?
possibly have it spray spores in a shot-gun fan (semi-random dirs, semi-random timers)

add additional line collision checks on stab
*/

//image_alpha = 0;
progen = 0;

activated = false;
fadeVal = 0.85;
forceActivate = false;
myPing = 0;

angleDir = 0;

//var startDir = irandom(3);
//direction = startDir*90;

timer = 0; 
updateTimer = 0;
updateInterval = 30;

eatTimer = 0;
eatInterval = 0;

strikeTimer = 0;
windUpTime = 60;
strikeInterval = 180;

chaseTimer = 360;
chaseTimerInterval = 360;

target = obj_ow_player_tank;
targetDir = 0;

mySpeed = 32;

//drillCollider = instance_create_depth(x,y,depth+1,obj_ow_generic);
//drillCollider.sprite_index = sp_grinderface_32x16;
//visualSp = instance_create_depth(x,y,depth+1,obj_ow_arm_controller_dir_control);
//visualSp.progen = id;

//visualSp.image_alpha = 0;
//drillCollider.image_alpha = 0;

//nlosPing = instance_create_depth(x,y,-10,obj_ow_ping_monster);
visualSp = instance_create_depth(x,y,depth-1,obj_ow_generic);
visualSp.image_xscale = 0.75;
visualSp.image_yscale = 0.75;
visualSp.sprite_index = ctank_main_body;
meleeSp = 0;
activeDraw = 1;

state = 0;
//0 = idle
//1 = chase
//2 = charge
//3 = eat
//4 = death

damageTrigger = false;
chrgeSpd = 2.5;
chrgeBase = 2.5;

detectRange = 256;


//used by player_tank
HP = 210;
drillable = true;
collision = true
dsTrig = false;
deathSpawn = -4;
tsTrig = false;
tileSpawn = -4;

atkdist = 32;

rammingDistance = 24;

stepTrigger = true;
stepAlterantor = false;

death = false;
death2 = false;
dTimer = 0;
dTime = 120;

moveTimer = 0;
moveTime = 120;
idleMoveTime = 240;

prevPntX = 0;
prevPntY = 0;

collisionVeloX = 0;
collisionVeloY = 0;
velocity = 1;

launched = false;
myDir = irandom(359);
mMove = true;
durSpd = 1;

firing = false;

trdOfst = 15; //was 20
trdSpd = 8;
treadLeft = instance_create_depth(x,y,depth,obj_ow_generic);
treadRight = instance_create_depth(x,y,depth,obj_ow_generic);
treadLeft.sprite_index = sp_tread_sp;
treadRight.sprite_index = sp_tread_sp;
treadLeft.image_xscale = 1.5;
treadLeft.image_yscale = 1.5;
treadRight.image_xscale = 1.5; //was 2
treadRight.image_yscale = 1.5;
trTurn = 1;

meleeVar = 0;
meleeGain = sprite_get_number(ctank_spike) / 60;
meleeMax = sprite_get_number(ctank_spike);

myAudA = audio_play_sound(so_ctank_idle,1,true);
audio_sound_gain(myAudA,0,0);
audio_sound_pitch(myAudA,0.5);

deathAudio = so_meat_break;
drillAudio = so_drill_inmeat;

alertAudList[0] = so_ctank_alert1;
alertAudList[1] = so_ctank_alert2;
alertAudList[2] = so_ctank_alert3;

alerted = false;

dFrame = 0;
dFrameGain = sprite_get_number(sp_death_splat_2) / dTime;
dDir = irandom(359);
dFrameTot = sprite_get_number(sp_death_splat_2);

d2Frame = 0;
d2FrameGain = sprite_get_number(sp_death_splat_pulse) / 60;

stunTime = 0;

debug1 = 0;
debug2 = 0;

treadTimer = 0;