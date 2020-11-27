//generate and handle audio volumes and such

//https://docs.yoyogames.com/source/dadiospice/002_reference/game%20assets/sounds/audio_channel_num.html

target = obj_ow_player_tank;

audio_group_load(ambMusic);
audio_group_load(soundEffects);

fade = false;

lavaMod = 0.5;
lavaAmb = -1;

cRoom=0;

global.audioGain = 3;
global.blipVol = 0.01;

audio_group_set_gain(ambMusic,3,0);
audio_group_set_gain(soundEffects,3,0);

debugAudio = 0;
debugAudGain = 0.5;

depressTimer = 0;