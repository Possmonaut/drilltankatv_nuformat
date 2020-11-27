timer ++;

var b = point_distance(x,y,target.x+14,target.y+14);

if(timer > blastTime)
{
	if(timer = blastTime+1)
	{
		var b = audio_play_sound(so_meat_break,1,false);
		var p = random(1.5);
		audio_sound_gain(b,0.5,0);
		audio_sound_pitch(b,p);
	}
	
	detonate = true;
}

if(detonate)
{
	if(b < slowDist)
	{
		target.slowed = true;
	}
}
else
{
part_particles_create(global.P_System,x+4,y+4,global.trailParticle,1);

if(timer > wallImmune)
{
var bbox_side = 0;

collisionVeloX= cos(angleDir*2*pi/360)*velocity;
collisionVeloY= -sin(angleDir*2*pi/360)*velocity;


	if(place_meeting(x + collisionVeloX, y, obj_ow_nopass)){
		while(!place_meeting(x+ collisionVeloX,y,obj_ow_nopass))
		{
			x+=collisionVeloX;
		}
	
	velocity = 0;
	}

	if(place_meeting(x, y + collisionVeloY, obj_ow_nopass)){
		while(!place_meeting(x, y+collisionVeloY,obj_ow_nopass))
		{
			y+=collisionVeloY;
		}
	
	velocity = 0;
	}

		var veloTrigger = 0;
		
		if(collisionVeloX > 0)
		{
			bbox_side = bbox_right;
		}
		else
		{
			bbox_side = bbox_left;
		}
		
		if(tilemap_get_at_pixel(global.Tiles_1,bbox_side + collisionVeloX, bbox_top) != 0 || tilemap_get_at_pixel(global.Tiles_1,bbox_side + collisionVeloX, bbox_bottom) != 0)
		{
			if(collisionVeloX > 0)
			{
				x = x;
			}
			else
			{
				x = x;
			}
			veloTrigger ++;
		}
		
		if(collisionVeloY > 0)
		{
			bbox_side = bbox_bottom;
		}
		else
		{
			bbox_side = bbox_top;
		}
		if(tilemap_get_at_pixel(global.Tiles_1, bbox_right,bbox_side + collisionVeloY) != 0 || tilemap_get_at_pixel(global.Tiles_1, bbox_left,bbox_side + collisionVeloY) != 0)
		{
			if(collisionVeloY > 0)
			{
				y = y;
			}
			else
			{
				y = y;
			}
			veloTrigger ++;
		}
		
		if(veloTrigger != 0)
		{
			velocity = 0;
		}
		
if(velocity = 0)
{
detonate = true;
}
}

x+=cos(angleDir*2*pi/360)*velocity;
y+=-sin(angleDir*2*pi/360)*velocity;
}

if(timer > lifeTime)
{
	//do fade animation
	instance_destroy();
}