

if(HP < 0)
{
	exit;
}

if(forceActivate)
{
	if(!instance_exists(myPing))
	{
	myPing = instance_create_depth(x,y,depth,obj_ow_radar_blip_enemy);
	forceActivate = false;
	}
	else
	{
		instance_destroy(myPing);
	}
}

var gainModAmb = 0.75;
var gainModFire = 0.5;
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
if(vDist > clampAud){vDist = clampAud;}

audio_sound_gain(myAudA,vDist*gainModAmb,100);

if(distance_to_object(target) > myDist)
{

}

if(sporeOut < 0){sporeOut = 0;}

if(distance_to_object(target < spawnDist))
{
	if(collision_line(x+16,y+16,target.x+14,target.y+14,obj_ow_nopass_enemy,false,true) = noone)
	{
		fire = true;
	}
}

if(fire = true)
{
	spawnTimer ++;
	if(spawnTimer > spawnTime)
	{
		if(animFrame = 0)
		{
			fireAnim = true;
			currSp = sp_spore_chimney_fire;
			fire = false;
			launched = false;
			spawnTimer = 0;
		}
	}
}

if(fireAnim = true)
{
	fireTimer += fireInt;
	if(fireTimer > fireAnimFrames)
	{
		animFrame = 0;
		fireTimer = 0;
		fireAnim = false;
		fire = false;
		currSp = sp_spore_chimney;
	}
	
	animFrame = floor(fireTimer);
	
	if(animFrame = 5 && launched = false)
	{
		if(instance_number(obj_ow_abs_spore) < sporeNum)
		{
			if(sporeOut < sporeNum)
			{
				part_particles_create(global.P_System, x+16, y+16, global.blood, 6);
				var b = instance_create_depth(x,y,depth-1,obj_ow_abs_spore);
				b.progen = id;
				sporeOut ++;
				if(!audio_is_playing(myAudMeat) || myAudMeat == -1)
				{
				myAudMeat = audio_play_sound(so_meat_break,1,false)
				audio_sound_gain(myAudMeat,vDist*gainModFire,0);
				}
			}
		}
		else
		{
			if(sporeOut < sporeSubNum)
			{
				part_particles_create(global.P_System, x+16, y+16, global.blood, 6);
				var b = instance_create_depth(x,y,depth-1,obj_ow_abs_spore);
				b.progen = id;
				sporeOut ++;
				if(!audio_is_playing(myAudMeat) || myAudMeat == -1)
				{
					myAudMeat = audio_play_sound(so_meat_break,1,false)
					audio_sound_gain(myAudMeat,vDist*gainModFire,0);
				}
			}
		}
		launched = true;
	}
}