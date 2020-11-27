swapTimer = 0;
swapTime = 6 * 60;
myAlpha = 0;
depth = -100;

menu = false;
load = false;

timer = 0;

//sp_vict 1-6

spriteNum = 5;
currSp = 0;
spriteList[0] = 0;
for(var i = 0; i < spriteNum+1; i++)
{
	spriteList[i] = 0;
}

spriteList[0] = sp_vict_1;
spriteList[1] = sp_vict_2;
spriteList[2] = sp_vict_3;
spriteList[3] = sp_vict_4;
spriteList[4] = sp_vict_5;
spriteList[5] = sp_vict_6;

/*
if(instance_exists(obj_ow_camera))
		{
			instance_destroy(obj_ow_camera);
			instance_destroy(obj_save_boy);
			instance_destroy(obj_ow_particle_handler);
			instance_destroy(obj_ow_fade_handler);
			instance_destroy(o_display_manager);
			instance_destroy(obj_ow_transponder_controller_temp);
		}
		
		room_goto(rm_setup);
		instance_destroy(id);
		*/
		
myAud = -1;
myAudC = -1;

audGain = 0.5;

audGainTrig = false;

whiteY = -1080;

//1920 x 1080, mult by 7.5

//have some kind of prefacing drone?

blurbTime = 0;
blurbStTimer = 0;
blurbDone = false;
blurbCount = 0;

dataTime = 0;
dataDone = false;
dataCount = 0;

thankTime = 5600;
thankDone = false;
thankCount = 0;

mainMenuTime = thankTime + 600;
charCount = 0;

escapeText = "ESCAPED";

/*
triggerList[|13] = 0; //ore mined
triggerList[|14] = 0; //blackboxes found
triggerList[|15] = 0; //money earned 
triggerList[|16] = 0; // time played 
*/

var time = obj_save_boy.triggerList[|16] / 60; //total seconds
var sTime = time % 60; //seconds
time = time / 60; // minutes
//var mTime = time % 60;
//time = (time - mTime) / 60; 

var bboxNum = 0;

for(i = 0; i < 50; i ++)
{
	bboxNum += obj_save_boy.triggerList[|17+i];
}

dataText = "Ore Collected: " + string(obj_save_boy.triggerList[|13]) + "\nBlackboxes Located: " + string(bboxNum) + " / " + string(obj_save_boy.bboxMax) + "\nMoney Earned: " + string(obj_save_boy.triggerList[|15]) + "\nTime Played: " + string(time) + "m : " + string(sTime) + "s";

thankText = "THANK YOU FOR PLAYING!"

skip = false;

//gpu_set_texfilter(true);

animTotal = 0;
animSpeed = sprite_get_number(sp_vict_animate_resize) / (5*60);