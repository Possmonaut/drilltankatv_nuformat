//states
//0 = do nothing
//1 = chasing
//2 = melee
//3 = fire sporebomb
//4 = death

//new code
//instead of using paths, lets just have this one move towards the player in small timed bursts.
//and just make it so it cannot pahse through walls. 

timer ++;
targetDir = point_direction(x+16,y+16,target.x+14,target.y+14);

var audGainFire = 0.5;
var audGainIdle = 0.5;
var audGainMelee = 0.25;
var audGainAlert = 0.5;
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

audio_sound_gain(myAudA,vDist*audGainIdle,100);

if(HP <= 0 || death = true || state = 4) //trigger death ALWAYS
{
	state = 4;
	velocity = 0;
	if(instance_exists(meleeSp)){instance_destroy(meleeSp);}
	if(HP<0){HP = 0;}
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

if(instance_exists(obj_ow_blast_manager)) // here is where we detect explosions
{
	if(distance_to_object(obj_ow_blast_manager) < 96 && state != 2 && state != 3) //if not doing things, start chase
	{
		state = 1;
	}
}

if(distance_to_object(obj_ow_player_tank) <= detectRange) //basic search behavior. if LOS and within distance, start chase
{
	if(collision_line(x+16,y+16,target.x+14,target.y+14,obj_ow_nopass,false,true) = -4)
	{
		if(state != 2 && state != 3)
		{
		state = 1;
		}
	}
}
else //if OUT of detect range, lose interest
{
	if(state != 0)
	{
		chaseTimer --;
		if(chaseTimer <= 0)
		{
			state = 0;
			chaseTimer = chaseTimerInterval;
			alerted = false;
		}
	}
}

if(stunTime > timer)
{
	exit;
}

if(state = 0) //sitting on spawn point
{
	velocity = 0;
	alerted = false;
}

if(state = 1) //chasing
{
	//need a pause timer in here to make it start / stop? 
	if(alerted = false)
	{
		var r = irandom(2);
		var j = audio_play_sound(alertAudList[r],1,false);
		audio_sound_gain(j,audGainAlert,0);
		alerted = true;
	}
	
	if(timer >= updateTimer)
	{
		var nDir = random_range(-30,30)
		angleDir = targetDir + nDir;
		updateTimer = timer + updateInterval;
		velocity = 1;
	}
	//in here have it change state according to player position
	//also change back OUT of state if player not detected after X 
	//if player not slowed and not in range and strike interval active
	//fire bomb
	//same for melee
	if(strikeTimer > strikeInterval && distance_to_object(obj_ow_player_tank) > rammingDistance && target.slowed = false)
	{
		state = 3;
	}
	
	if(distance_to_object(target) <= rammingDistance)
	{
		state = 2;
		velocity = 0;
	}
	
}

strikeTimer ++;

if(state = 3) //firing spore bomb
{	
	if(strikeTimer > strikeInterval || target.slowed = false)
	{
		if(distance_to_object(obj_ow_player_tank) > rammingDistance)
		{
			//var b = instance_create_depth(x+16,y+16,depth,obj_ow_abs_spore_bomb);
			//var xx = target.x+14+lengthdir_x(16,target.angleDir);
			//var yy = target.y+14+lengthdir_y(16,target.angleDir);
			//var n = point_direction(x+16,y+16,xx,yy);
			//b.angleDir = n;
			firing = true;
		}
		strikeTimer = 0;
		if(firing = false)
		{
		state = 1;
		}
	}
	
	if(firing = true)
	{
		if(visualSp.image_index > 0 && visualSp.image_index < 1 && visualSp.sprite_index = ctank_main_body)
		{
			visualSp.sprite_index = ctank_fire;
			visualSp.image_index = 0;
		}
		if(visualSp.image_index>3 && visualSp.image_index<4 && visualSp.sprite_index = ctank_fire && launched = false)
		{
			//set the firing position to be from the correct part of the sprite
			var xx = x+16+lengthdir_x(12,myDir-90); // 8 was 16
			var yy = y+16+lengthdir_y(12,myDir-90);
			part_particles_create(global.P_System, xx, yy, global.blood, 6);
			var b = instance_create_depth(xx,yy,target.depth+3,obj_ow_abs_spore_bomb);
			var n = point_direction(xx,yy,target.x+14,target.y+14);
			b.blastTime = (point_distance(xx,yy,target.x+14,target.y+14)+48) / b.velocity;
			b.angleDir = n;
			launched = true;
			var j = audio_play_sound(so_meat_break,1,false);
			audio_sound_gain(j,vDist*audGainFire,0);
			var k = audio_play_sound(so_generic_hit,1,false);
			audio_sound_gain(k,vDist*audGainFire,0);
			
		}
		if(visualSp.image_index > visualSp.image_number-1 && visualSp.sprite_index = ctank_fire)
		{
			visualSp.sprite_index = ctank_main_body;
			launched = false;
			firing = false;
			state = 1;
		}
	}
}

if(state = 2) //melee attacking (I guess we'll create a particle kind of like the monolith?)
{
	
	
	if(strikeTimer > strikeInterval)
	{	
		if(distance_to_object(obj_ow_player_tank) <= rammingDistance)
		{
		firing = true;
		}
		
		if(firing = false)
		{
		state = 1;
		}
	}
		myDir = targetDir;
		
	if(firing = true)
	{
		
		
		var xx = x+16+lengthdir_x(21,angleDir); //was 28
		var yy = y+16+lengthdir_y(21,angleDir);
		
		if(meleeSp = 0){meleeSp = instance_create_depth(xx,yy,depth-3,obj_ow_generic);
			meleeSp.sprite_index = ctank_spike;
			meleeSp.image_index = 0;
			var r = irandom(2);
			var j = audio_play_sound(alertAudList[r],1,false);
			audio_sound_gain(j,1*audGainMelee,0);
			audio_sound_pitch(j,1.5);
			var k = audio_play_sound(so_meat_break,1,false);
			audio_sound_gain(k,1*(audGainMelee+0.25),0);
			
			}
			else
			{
				meleeSp.x = xx;
				meleeSp.y = yy;
				meleeSp.image_angle = angleDir;
			}
		
		if(meleeSp.image_index>4 && meleeSp.image_index<11 && target.visualSpriteTank.damageFlash = false)
		{
			var px = xx+lengthdir_x(24,angleDir);
			var py = yy+lengthdir_y(24,angleDir);
			var t = collision_line(xx,yy,px,py,obj_ow_player_tank,false,true);
			draw_line(xx,yy,px,py);
			if(t != noone && target.visualSpriteTank.damageFlash = false){target.HP -= 10;
				target.visualSpriteTank.damageFlash = true;
				sc_shake_call(3,30,true);
					var r = random_range(0.9,1.3);
					var b = audio_play_sound(so_damage,1,false);
					audio_sound_gain(b,0.2,0);
					audio_sound_pitch(b,r);
				}
		}
		
		//meleeVar += meleeGain;
		
		if(meleeSp.image_index > meleeSp.image_number -1)
		{
			instance_destroy(meleeSp);
			meleeSp = 0;
			firing = false;
			//meleeVar = 0;
			state = 1;
		}
	}
	else
	{
		myDir = targetDir;
	}
}

if(state = 4)
{
	//need animation here 
	death = true;
}