//todo:
/*
	need to update the lower part of the crystal sprite to recede, or to just be drawn on a lower depth
		than the crystal (2 sprites I guess)
	clean up code; remove unused variables and states 
	spawner behavior
	fix depths 
	the crystals it leaves behind might be too flashy; maybe make them recede and to better resemble crystal doodads
	sprite updates; needs to look more like it's breakign through the floor + have "roots" from the cenrtal body
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
updateInterval = 60;

eatTimer = 0;
eatInterval = 0;

strikeTimer = 0;
windUpTime = 60;
strikeInterval = 180;

chaseTimer = 480;
chaseTimerInterval = 480;

target = obj_ow_player_tank;

mySpeed = 32;

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

rammingDistance = 32;

stepTrigger = true;
stepAlterantor = false;

death = false;
death2 = false;
dTimer = 0;
dTime = 120;

moveTimer = 0;
moveTime = 120;
idleMoveTime = 300;

prevPntX = 0;
prevPntY = 0;

animTimer = 0;
animMax = sprite_get_number(sp_monolith_comp_outline);
animInterval = (animMax)/moveTime;
animDir = 0;

partBurst = false;

vibOFST = 0;
vibTimer = 0;

deathAudio = so_crys_break;
drillAudio = so_drill_incrys;

myAudA = audio_play_sound(so_drill_inrock,1,true);
audio_sound_gain(myAudA,0,0);
audio_sound_pitch(myAudA,0.75);

myDAud = -1;