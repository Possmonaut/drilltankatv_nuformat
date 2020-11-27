if(distance_to_object(target) > checkDist)
{
	audio_sound_gain(myAudA,0,0);
	exit;
}


var audGainIdle = 0.5;
var clampAud = 0;

var t = collision_line(x+32,y+32,target.x+14,target.y+14,obj_ow_nopass_enemy,false,true);
if(t != noone)
{
	clampAud = 0.1;
}
else
{
	clampAud = 1;
}

var vDist = sc_gainFalloff(384, 0);
if(vDist > clampAud){vDist = clampAud;}

audio_sound_gain(myAudA,vDist*audGainIdle,100);