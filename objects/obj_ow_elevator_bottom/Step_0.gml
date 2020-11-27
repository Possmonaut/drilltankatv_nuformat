//fix me when you get the chance 

//wait until fade / tutorial dead
//create sparks from 4 corners
//shake screen
//wait
//open door
//remove door blocks
//shake when door fully opened 
//after player leaves
//close door
//shake
//create new blocks to prevent reentry

var cCheck = collision_rectangle(x-270,y-270,x+270,y+270,player,false,true);

//if(!audio_is_playing(so_elevator_loop) && !landTrig)
//{
//	myAmb = audio_play_sound(so_elevator_loop,1,true);
//}



if(!instance_exists(obj_ow_tutorial_controller))
{
	if(cCheck = noone)
	{
		image_index = 4;
		animGain = 4;
	}
	else
	{
	landTrig = true;
	}
}

if(landTrig && !landComp)
{
	player.velocity = 0;
	player.angleDir = 270;
	
	landTimer ++;
	if(audio_exists(myAmb))
	{
	audio_sound_gain(myAmb,0,1000);
	}
	
	if(!instance_exists(obj_ow_ocean_handler))
	{
		instance_create_depth(x,y,depth,obj_ow_ocean_handler);
	}
	
	if(fade.COMPLETE = true)
	{
		if(sparkTrig = false)
		{
			part_particles_create(global.P_System, x-270, y-270, global.rockDeath, 6);
			part_particles_create(global.P_System, x-270, y+270, global.rockDeath, 6);
			part_particles_create(global.P_System, x+270, y-270, global.rockDeath, 6);
			part_particles_create(global.P_System, x+270, y+270, global.rockDeath, 6);
			
			sc_shake_call(3,10,true);
			var b = audio_play_sound(so_bomb_blast,1,false);
			audio_sound_gain(b,0.3,0);
			audio_stop_sound(myAmb);

			sparkTrig = true;
		}
	}
	
	if(landTimer > landTime)
	{
		animGain += gainInt;
		image_index = round(animGain);
		if(animGain > 3)
		{
		sc_shake_call(3,5,true); //fix this; it's power, duration, and center
		var b = audio_play_sound(so_damage,1,false);
		audio_sound_gain(b,0.5,0);
		landComp = true;
		landTimer = 0;
		}
	}
}

if(cCheck = noone && landComp && landTrig && !returnTrig)
{
		animGain -= gainInt;
		image_index = floor(animGain);
		if(animGain <= 0)
		{
			returnTrig = true;
			sc_shake_call(5,5,true);
		}
}