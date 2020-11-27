landTrig = false;
landComp = false;
returnTrig = false;
fade = obj_ow_fade_handler;
sparkTrig = false;
gainInt = 4/60;
animGain = 0;
player = obj_ow_player_tank;

landTimer = 0;
landTime = 360;

myAmb = audio_play_sound(so_elevator_loop,1,true);
audio_sound_gain(myAmb,0,0);
audio_sound_gain(myAmb,0.025,500);

aud_check_trig = 0;

if(audio_is_playing(myAmb))
{
	aud_check_trig = 1;
}