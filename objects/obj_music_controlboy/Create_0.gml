target = obj_ow_player_tank;

image_alpha = 0;
timer = 0;
roomStart = true;
switchDelay = random_range(60, 180);
staticPosition = irandom_range(0, 62);
musicOn = false;
currentTrack = 1;
staticChange = false;
instStatic = 0;

//add all music to an array
//etc etc

audioMax = 4;
musArray[0] = snd_radio_static; //length, 63.22s
musArray[1] = mus_aesop_rock_dirt;
musArray[2] = mus_stobarts_blues;
musArray[3] = mus_they_came_from_underground;
musArray[4] = mus_this_game;

//audio_sound_set_track_position(musArray[0], staticPosition);
//audio_play_sound(musArray[0], 0, false);

//gonna wanna change this so that it doesn't play automatically at the beginning of the game