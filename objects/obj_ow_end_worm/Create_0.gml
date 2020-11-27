depth = 52;

trackPListX = ds_list_create();
trackPListY = ds_list_create();
listSize = 6;

init = true;

target = obj_ow_player_tank;

timer = 0;
updateTime = 20;
updateInt = 0;
timerMax = 20*100;

angleDir = 0;
spd = target.axMaxFSpeed;
baseSpd = target.axMaxFSpeed;

segArray[0] = id;

//number of segments
segNum = 8;
segDir = 0;
dSpd = 0.5;

atkInt = 0;
attakTime = 600;
atkMode = false;

windUpTimer = 0;
windUpTime = 120;

atkPX = 0;
atkPY = 0;

for(var i = 1; i < segNum; i ++)
{
	segArray[i] = instance_create_depth(x,y,depth+1,obj_ow_generic);
	segArray[i].sprite_index = sp_seg_temp_animated;
	segArray[i].progen = id;
	//create unique look for last segment
	//if(i=segNum-1){segArray[i].sprite_index = sp_rs_bottom;}
}

endX = 5124; //replace this with the coords of the endpoint trigger;
endY = 1011;

headAnim = 0;
hAnimInt = 3/60;
headAnimMax = sprite_get_number(sp_head_swap_animated);

rockAud = 0;
myAudB = 0;
smashGain = 1;

bumpGain = 1;

myAmbAud = audio_play_sound(so_drill_inrock,1,true);
audio_sound_gain(myAmbAud,0,0);

myAmbChase = audio_play_sound(so_endworm_amb,1,true);
audio_sound_gain(myAmbChase,0,0);

myBite = 0;

sineGain = -0.5;

shkMod = 1.5;
shkStr = 0;