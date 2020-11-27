HP = 210;
cHP = HP;

progen = 0;

tPointX = 0;
tPointY = 0;
target = obj_ow_player_tank;
//nlosPing = instance_create_depth(x,y,-10,obj_ow_ping_monster);
tDist = 1;
spd = 2;

myDir = 0;
tDir = 0;

dSpd = 0.5;

activeDraw = 1; // are we invis or uh
myBod = sp_rs_head; //the sprite for the body or whatever 

inRock = false;

//segArray = ds_list_create;
segArray[0] = id;

//number of segments
segNum = 24;

for(var i = 1; i < segNum; i ++)
{
	segArray[i] = instance_create_depth(x,y,depth+1,obj_ow_rockswimmer_segment);
	segArray[i].sprite_index = sp_rs_tail_v2;
	segArray[i].progen = id;
	//create unique look for last segment
	if(i=1){segArray[i].sprite_index = sp_rs_body;}
	if(i=segNum-1){segArray[i].sprite_index = sp_rs_bottom;}
}

fleeing = false;
fleeTimer = 0;
fleeTime = 240;

death = false;
deathAnim = false;
dAnimComplete = false;
dvar = 0;
dTimer = 0;
dTime = 10;
dSpawn = true;

comeBack = false;

minSpeed = 1;
topSpeed = 3;
emerge = false;

myAudM = audio_play_sound(so_rs_ambient,1,true);
myAudA = audio_play_sound(so_drill_inrock,1,true);
myAudS = -1;

audio_sound_gain(myAudM,0,0);
audio_sound_gain(myAudA,0,0);

deathAudio = so_meat_break;
drillAudio = so_drill_inmeat;

blastHit = true;

bHitTime = 0;
bHitTimer = 60;

dsTrig = false;
tsTrig = false;

activated = false;
forceActivate = false;
myPing = 0;