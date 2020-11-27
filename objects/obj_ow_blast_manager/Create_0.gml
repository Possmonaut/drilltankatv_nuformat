//this object handles the visual timing of explosions
target = 0;
timer = 0;
depth = depth -1;

xscale = 1;
yscale = 1;

image_alpha = 0;
circleSize = 0;
circleAlpha = 1;

for(var i = 0; i < 9; i ++)
{
	for(var o = 0; o < 2; o ++)
	{
		smoke_grid[i,o] = 0;
	}
}


smokeRand = 0;
smokeTimer = 0;

blastTrigger = false;
blastArray = ds_list_create();

blastRadius = 40;

//var vDist = clamp(distance_to_object(target),0,256);
//vDist = abs(1-(vDist / 256));
//var b = audio_play_sound(so_bomb_blast,2,false);
//audio_sound_gain(b,vDist,0);