depth = 200 - 10;
eRad = 0;
radMax = 120;

target = obj_ow_player_tank;

circleSize = 0.5;
circleAlpha = 1;

myArm = instance_create_depth(x+384,y+128,depth-3,obj_ow_repair_arm_test);

myAudA = audio_play_sound(so_depot_probe_alert,1,true);
audio_sound_gain(myAudA,0,0);

checkDist = 256*2;