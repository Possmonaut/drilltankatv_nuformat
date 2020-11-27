//spawn in when instantiator spawns in
//if player nearby and LOS, spores
//if player no longer nearby, run checks on spores
//spores will have a self timer 
//if all spores dead, also kill self

//spore now needs a new death anim, and gas-spore spawning behaviors

timer = 0;
currSp = sp_spore_chimney;

sporeNum = 3;
sporeSubNum = 1;
sporeOut = 0;

myDist = 1024;
spawnDist = 256;

spawnDeath = false;

fire = false;
fireAnim = true;

idleAnimFrames = sprite_get_number(sp_spore_chimney);
fireAnimFrames = sprite_get_number(sp_spore_chimney_fire);

idleTimer = 0;
idleTime = 60;

animFrame = irandom(idleAnimFrames);
launched = false;

fireTimer = 0;
fireTime = 120;
fireInt = fireAnimFrames / fireTime;

dir = irandom_range(0,359);

target = obj_ow_player_tank;

spawnTimer = 0;
spawnTime = 360;

collision = true;
drillable = true;
HP = 300;
dsTrig = false;
deathSpawn = -4 //obj_ow_spore_chim_dummy;
tsTrig = true;
tileSpawn = 22;

myAngle = -1;

death = false;
death2 = false;

myAudA = audio_play_sound(so_spore_chim_idle,1,true);
audio_sound_gain(myAudA,0,0);

myAudMeat = -1;

deathAudio = so_meat_break;
drillAudio = so_drill_inmeat;

forceActivate = false;
myPing = 0;