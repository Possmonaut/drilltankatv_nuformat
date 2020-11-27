x=target.x;
y=target.y;

timer ++;
/*
if(roomStart = true) //all this does is end the static burst at the beginning of the game and start playing musics
{
	 if(switchDelay < timer)
	 {
		 audio_stop_sound(musArray[0]);
		 currentTrack = random_range(1,audioMax);
		 audio_play_sound(musArray[currentTrack], 0, 0);
		 roomStart = false;
	 }
}
*/

if(keyboard_check_released(ord("O")))
{
	if(musicOn = true)
	{
		audio_stop_sound(musArray[currentTrack]);
		//play clicky sound
		musicOn = false;
	}
	else
	{
		//play clicky sound
		//fade in music
		audio_play_sound(musArray[currentTrack], 0, 0);
		musicOn = true;
	}
}

if(keyboard_check_released(ord("I")) && musicOn = true)
{
	if(staticChange = false)
	{
	audio_stop_sound(musArray[currentTrack]);
	currentTrack --;
	if(currentTrack < 1){currentTrack = audioMax;}
	switchDelay = timer + random_range(120, 180);
	staticPosition = irandom_range(0, 62);
	instStatic = audio_play_sound(musArray[0], 0, 1);
	audio_sound_set_track_position(instStatic, staticPosition);
	staticChange = true;
	}
}

if(keyboard_check_released(ord("P"))&& musicOn = true)
{
	if(staticChange = false)
	{
	audio_stop_sound(musArray[currentTrack]);
	currentTrack ++;
	if(currentTrack > audioMax){currentTrack = 1;}
	switchDelay = timer + random_range(120, 180);
	staticPosition = irandom_range(0, 62);
	instStatic = audio_play_sound(musArray[0], 0, 1);
	audio_sound_set_track_position(instStatic, staticPosition);
	staticChange = true;
	}
}

if(staticChange = true)
{
	if(switchDelay < timer)
	{
		audio_stop_sound(instStatic); //if weird bug change to musArray[0] instead of instStatic
		audio_play_sound(musArray[currentTrack], 0, 0);
		staticChange = false;
	}
}


///check for button presses, do timed stuff

if((audio_is_playing(musArray[currentTrack]) || audio_is_playing(instStatic)))
{}
else
{
	if(musicOn = true)
	{
		currentTrack ++;
		if(currentTrack > audioMax){currentTrack = 1;}
		switchDelay = timer + random_range(120, 180);
		staticPosition = irandom_range(0, 62);
		instStatic = audio_play_sound(musArray[0], 0, 1);
		audio_sound_set_track_position(instStatic, staticPosition);
		staticChange = true;
	}
}

//if reach end of song, play static, go to next song in list
//can also have song continue on invisible timer when off so it seems like a real radio 