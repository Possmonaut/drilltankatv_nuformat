part_particles_create(global.P_System,x+4,y+4,global.trailParticle,1);

var bbox_side = 0;

//so check for collision with objects. if no enemy object detected, move to tile check

collisionVeloX= cos(angleDir*2*pi/360)*velocity;
collisionVeloY= -sin(angleDir*2*pi/360)*velocity;

//check projected position for enemies and tiles
//store in array

//if(place_meeting(x + collisionVeloX, y, obj_ow_enemy_parent) || place_meeting(x, y + collisionVeloY, obj_ow_enemy_parent))
//{

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
	if(place_meeting(x + collisionVeloX, y, obj_ow_enemy_passable)){
		while(!place_meeting(x+ collisionVeloX,y,obj_ow_enemy_passable))
		{
			x+=collisionVeloX;
		}
	
	velocity = 0;
	}

	if(place_meeting(x, y + collisionVeloY, obj_ow_enemy_passable)){
		while(!place_meeting(x, y+collisionVeloY,obj_ow_enemy_passable))
		{
			y+=collisionVeloY;
		}
	
	velocity = 0;
	}
//}

/*
else
{
	if(place_meeting(x + collisionVeloX, y, obj_ow_nopass) || place_meeting(x, y + collisionVeloY, obj_ow_nopass))
	{
		
		*/
		var veloTrigger = 0;
		
		if(collisionVeloX > 0)
		{
			bbox_side = bbox_right;
		}
		else
		{
			bbox_side = bbox_left;
		}
		
		if(tilemap_get_at_pixel(global.Tiles_1,bbox_side + collisionVeloX, bbox_top) > 16 || tilemap_get_at_pixel(global.Tiles_1,bbox_side + collisionVeloX, bbox_bottom) > 16)
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
		if(tilemap_get_at_pixel(global.Tiles_1, bbox_right,bbox_side + collisionVeloY) > 16 || tilemap_get_at_pixel(global.Tiles_1, bbox_left,bbox_side + collisionVeloY) > 16)
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
	target.activeBomb = instance_create_depth(x, y, depth, obj_ow_demo_charge);
	//var vDist = clamp(distance_to_object(target),0,256);
	//vDist = abs(1-(vDist / 256));
	var b = audio_play_sound(so_rock_break,2,false);
	//audio_sound_gain(b,vDist,0);
	instance_destroy(id);
}

x+=cos(angleDir*2*pi/360)*velocity;
y+=-sin(angleDir*2*pi/360)*velocity;