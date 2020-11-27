//add HP and bomb interactions 
//place grinder under enemy parent type 

//image_alpha = 0;
progen = 0;

activated = false;
fadeVal = 0.85;
forceActivate = false;

angleDir = 0;
timer = 0; 
updateTimer = 240;
updateInterval = 240;

target = obj_ow_player_tank;

//nlosPing = instance_create_depth(x,y,-10,obj_ow_ping_monster);

activeDraw = 1;

state = 0;

//used by player_tank
HP = 50;
drillable = true;
collision = true
dsTrig = false;
deathSpawn = -4;
tsTrig = false;
tileSpawn = -4;

death = false;
death2 = false;
dTimer = 0;
dTime = 120;

collisionVeloX = 0;
collisionVeloY = 0;
spd = 2;
velocity = spd;

veloDecay = 0.01;



myAngle = -1;

cDir = 0;
imageInd = 0;
imageSpd = 2/60;

timer = 0;
lifeTime = 1200;

myAudA = audio_play_sound(so_spore_idle2,1,true);
audio_sound_gain(myAudA,0,0);

deathAudio = so_meat_break;
drillAudio = so_drill_inmeat;
