//updates:
//have gas clouds expand from initial point outwards
//string trails for the hairs? or just single pixel particles trails maybe? 
//gas particle effects 
//clean up tail behavior; review the tutorial, as I'm not really sure what I'm doing wrong here 
//if sticking continues to be an issue, figure out some other solutions

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

gasTimer = 0;
gasTime = 120;
partTimer = 60;

segArray[0] = id;

//number of segments
segNum = 5;

for(var i = 1; i < segNum; i ++)
{
	segArray[i] = instance_create_depth(x,y,depth-1,obj_ow_generic);
	segArray[i].sprite_index = sp_sb_gut_tail_rsz;
	segArray[i].progen = id;
	//create unique look for last segment
	if(i=1){segArray[i].sprite_index = sp_sb_body;}
}

activeDraw = 1;
nlosPing = instance_create_depth(x,y,-10,obj_ow_ping_monster);

collision = true;
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
audio_sound_pitch(myAudA,0.1);
audio_sound_gain(myAudA,0,0);

deathAudio = so_meat_break;
drillAudio = so_drill_inmeat;