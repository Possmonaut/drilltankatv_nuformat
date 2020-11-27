var gainModGrind = 0.60; //worm aud
var gainModBite = 0.30; //drill rumble aud
var clampAud = 0;

var t = collision_line(x+16,y+16,target.x+14,target.y+14,obj_ow_nopass_enemy,false,true);
if(t != noone)
{
	clampAud = 0.1;
}
else
{
	clampAud = 1;
}

var vDist = sc_gainFalloff(384, 0);
var vDist2 = sc_gainFalloff(384, 0);
if(vDist > clampAud){vDist = clampAud;}

audio_sound_gain(myAmbChase,vDist2*gainModGrind,250);
audio_sound_gain(myAmbAud,vDist*gainModBite,250);
