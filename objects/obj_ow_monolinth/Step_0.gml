//states
//0 = idle wander
//1 = chasing
//2 = attacking 
//3 = eating
//4 = death

//new code
//needs to generate blocks behhind it, blocks needs to break down after X with unique animation
//needs to create "break" explosions in cardinal coordinates that appear the same as the main body
//and use the same death aniamtion (shattering) 
//and then us the BURST effect for movement 
//on death, just collapse into a normal block

timer ++;
moveTimer ++;

if(death2 = true)
	{
		exit;
	}

if(HP <= 0 || death = true)
{
	state = 4;
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

var gainModA = 0.1;
var gainModE = 0.5;
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

audio_sound_gain(myAudA,vDist*gainModA,100);

//if(state != 2){visualSp.mDir = direction;}
if(state = 1 || state = 2)
{
//visualSp.mDir = point_direction(x,y,target.x,target.y);
}
else
{
	//visualSp.mDir = direction;
}
//visualSp.x = x + 16;
//visualSp.y = y + 16;
if(instance_exists(obj_ow_blast_manager)) // here is where we detect explosions
{
	if(distance_to_object(obj_ow_blast_manager) < 96)
	{
		state = 1;
	//part_particles_create(global.P_System, x+16, y+16, global.crystalPart, 6);
	//part_particles_create(global.P_System, x+16, y+16, global.rockSpark, 6);
	}
}

if(collision_line(x+16,y+16,target.x+14,target.y+14,obj_ow_nopass,false,true) = noone)
{
	activeDraw=1;
}
else
{
	activeDraw=0;
}

//visualSp.image_angle = direction - 90;
//drillCollider.image_angle = direction - 90;

if(distance_to_object(obj_ow_player_tank) <= detectRange)
{
	if(collision_line(x+16,y+16,target.x,target.y,obj_ow_nopass_enemy,false,true) = noone)
	{
		if(state != 2)
		{
		state = 1;
		}
	}
}
else
{
	if(state != 3)
	{
		chaseTimer --;
		if(chaseTimer <= 0)
		{
			state = 0;
			chaseTimer = chaseTimerInterval;
		}
	}
}

if(state = 0) //nothing
{
		if(moveTimer > idleMoveTime)
	{
		var pd = irandom(359);
		var px = x+16+lengthdir_x(32,pd);
		var py = y+16+lengthdir_y(32,pd);
		var tx = tilemap_get_cell_x_at_pixel(global.Tiles_1,px,py);
		var ty = tilemap_get_cell_y_at_pixel(global.Tiles_1,px,py);
		if(instance_position(px,py,obj_ow_nopass_enemy) = noone)
		{
		x = tx*32;
		y = ty*32;
		}
		moveTimer = 0;
		animTimer = 0;
		animDir = irandom(359);
		partBurst = false;
	}
}

var subDir = animDir;

if(state = 1) //chasing and block generating
{
	if(moveTimer = 45)
	{
		var b = audio_play_sound(so_mono_move,1,false);
		audio_sound_gain(b,vDist*gainModE,0);
		audio_sound_pitch(b,2);
	}
	
	if(moveTimer > moveTime)
	{
		var pd = point_direction(x+16,y+16,target.x+14,target.y+14);
		var px = x+16+lengthdir_x(32,pd);
		var py = y+16+lengthdir_y(32,pd);
		var tx = tilemap_get_cell_x_at_pixel(global.Tiles_1,px,py);
		var ty = tilemap_get_cell_y_at_pixel(global.Tiles_1,px,py);
		if(instance_position(px,py,obj_ow_nopass_enemy) = noone)
		{
		x = tx*32;
		y = ty*32;
		}
		moveTimer = 0;
		animTimer = 0;
		animDir = irandom(359);
		partBurst = false;
		//var b = audio_play_sound(so_mono_move,1,false);
		//audio_sound_gain(b,vDist*gainModE,0);
		//audio_sound_pitch(b,2);
	}
}


if(state = 3) //we do not use state 3 
{

}

if(state = 4)
{
	//need animation here 
	//instance_destroy();
	death = true;
}

//generates monolinth blocks behind this entity
var xx = tilemap_get_cell_x_at_pixel(global.Tiles_1,x,y);
var yy = tilemap_get_cell_y_at_pixel(global.Tiles_1,x,y);
if(xx != prevPntX || yy != prevPntY)
{
	if(instance_position(prevPntX*32,prevPntY*32,obj_ow_monolinth_block) = noone)
	{
		var b = instance_create_depth(prevPntX*32,prevPntY*32,depth,obj_ow_monolinth_block);
		b.myDir = subDir;
		b.depth = depth + irandom_range(-1,1); //so they're not so sequencial 
	}
	prevPntX = xx;
	prevPntY = yy;
}