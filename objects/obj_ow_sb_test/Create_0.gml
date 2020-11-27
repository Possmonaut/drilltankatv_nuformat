//todo
/*
moving sprites (breathing, jaw open / close)
needs to leave a trail of gas particles probably 
should be good afaik
*/

depth = 250;

HP = 150;
cHP = 150;
bTimer = 0;
bTime = 60;


myDir = (irandom_range(0,3)*90 ) + 45;
spd = 0;
alarm = 120;

target = obj_ow_player_tank;

segDir = myDir;
dSpd = 3;

refOccu = ds_list_create();
refPList = ds_list_create();

for(var i = 0; i < 16; i++)
{
	ds_list_add(refOccu,0);
}

collision = false;
collisionVeloX = x;
collisionVeloY = y;
bbox_side = 0;

gasTimer = 0;
gasTime = 120;
partTimer = 60;

segArray[0] = id;

//number of segments
segNum = 10;

for(var i = 1; i < segNum; i ++)
{
	segArray[i] = instance_create_depth(x,y,depth-1,obj_ow_generic);
	segArray[i].sprite_index = sp_sb_tail_test;
	segArray[i].progen = id;
	segArray[i].image_index = irandom(3);
	//create unique look for last segment
	if(i=1){segArray[i].sprite_index = sp_sb_body;}
	if(i=segNum-1){segArray[i].image_index = 4;}
}

activeDraw = 1;
//nlosPing = instance_create_depth(x,y,-10,obj_ow_ping_monster);


spd = 1;
myDir = 0;
dirGain = 0;
dirAdd = 1;

drillable = true;
HP = 150;
dsTrig = false;
deathSpawn = -4 //obj_ow_spore_chim_dummy;
tsTrig = false;
tileSpawn = -4;

myAngle = -1;

deathTimer = 0;
deathTime = 60;
death2 = false;

myAudA = audio_play_sound(so_rs_ambient,1,true);
audio_sound_pitch(myAudA,0.2);
audio_sound_gain(myAudA,0,0);

deathAudio = so_meat_break;
drillAudio = so_drill_inmeat;

activated = false;
forceActivate = false;
myPing = 0;