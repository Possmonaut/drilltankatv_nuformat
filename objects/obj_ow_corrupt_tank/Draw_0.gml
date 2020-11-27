visualSp.x = x+16;
visualSp.y = y+16;
visualSp.image_angle = myDir;

treadLeft.x = x +16- lengthdir_x(trdOfst,myDir+90);
treadLeft.y = y+16 - lengthdir_y(trdOfst,myDir+90);

treadRight.x = x+16 + lengthdir_x(trdOfst,myDir+90);
treadRight.y = y+16 + lengthdir_y(trdOfst,myDir+90);

treadLeft.image_angle = myDir - 90;
treadRight.image_angle = myDir - 90;

if(treadTimer < timer)
{
part_type_size(global.treadPart,1.5,1.5,0,0);
part_type_orientation(global.treadPart,myDir,myDir,0,0,false);
part_particles_create(global.P_System,treadRight.x,treadRight.y,global.treadPart,1);
part_particles_create(global.P_System,treadLeft.x,treadLeft.y,global.treadPart,1);
part_type_size(global.treadPart,1,1,0,0);
treadTimer = timer +15;
}


treadLeft.image_speed = trdSpd * velocity;
treadRight.image_speed = trdSpd * velocity;

if(trTurn > 0) //turning left
{
treadRight.image_speed -= (trdSpd * 0.25 * trTurn);
}
if(trTurn < 0)
{
treadLeft.image_speed += (trdSpd * 0.25 * trTurn);
}


if(death2 = true)
	{
		if(HP <= 0)
		{
			//create chunk particles 
			//stop drawing death sprite
			//stop drawing ALL sprites
			//remove collisions by changing collision sprites to n/a
			sprite_index = noone;
			mask_index = noone;
			activeDraw = 0;
		}
		death = true;
	}
	
if(state = 4)
{
	audio_sound_gain(myAudA,0,1000);
	depth = visualSp.depth+1;

	if(dTimer < dTime *2)
	{
		dTimer ++;
		if(dTimer = 1)
		{
			var r = irandom(2);
			var j = audio_play_sound(alertAudList[r],1,false);
			audio_sound_gain(j,0.5,0);
			audio_sound_pitch(j,0.25);
		}
	}
	else
	{
		death2 = true;
	}
	
	if(dTimer > dTime)
	{
		if(death2 = false || HP > 0)
		{
		var xxscale = (((dTimer-dTime)* 0.0033) *3);
		var yyscale = (((dTimer-dTime)* 0.0033) *3);
		if(dFrame <= dFrameTot)
			{
				dFrame += dFrameGain;
				draw_sprite_ext(sp_death_splat_2,dFrame,x+16,y+16,xxscale,yyscale,dDir,c_white,1);
				HP = 150;
			}
			else
			{
				d2Frame += d2FrameGain;
				draw_sprite_ext(sp_death_splat_pulse,d2Frame,x+16,y+16,xxscale,yyscale,dDir,c_white,1);
			}
		}
	}
}