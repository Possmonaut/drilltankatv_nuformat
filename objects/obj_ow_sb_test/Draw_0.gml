if(HP < 0)
{
	deathTimer ++;
	segArray[1].image_xscale += 0.01;
	segArray[1].image_yscale += 0.01;
	
	if(deathTimer > deathTime && death2 == false)
	{
	part_particles_create(global.P_System, x+16, y+16, global.blood, 12);
	part_particles_create(global.P_System, x+16, y+16, global.meatChunk, 6);
	var b = instance_create_depth(x,y,depth-1,obj_ow_toxin_cloud);
	b.image_angle = irandom(359);
	if(audio_is_playing(myAudA))
	{
		audio_stop_sound(myAudA);
	}
	var p = audio_play_sound(so_bomb_blast,1,false);
	var t = audio_play_sound(so_meat_break,1,false);
	death2 = true;
	for(var i = 0; i < segNum; i ++)
	{
		segArray[i].image_alpha = 0;
	}
	}
}


//if(instance_exists(nlosPing))
//{
//	if(nlosPing.image_alpha <= 0)
	//{
	//	nlosPing.x = x-16;
		//nlosPing.y = y-16;
	//}
//}


if(collision_line(x,y,target.x+14,target.y+14,obj_ow_nopass,false,true) = noone)
{
	activeDraw=1;
	//if(instance_exists(nlosPing)){
	//nlosPing.image_alpha = 0;
	//}
}
else
{
	activeDraw=0;
}

var xx = segArray[1].x + lengthdir_x(8,segArray[1].direction+45);
var yy = segArray[1].y + lengthdir_y(8,segArray[1].direction+45);

part_particles_create(global.P_System, xx, yy, global.hairPart, 1);

xx = segArray[1].x + lengthdir_x(4,segArray[1].direction-65);
yy = segArray[1].y + lengthdir_y(4,segArray[1].direction-65);

part_particles_create(global.P_System, xx, yy, global.hairPart, 1);

draw_sprite_ext(sp_sb_head,0,x+16,y+16,1,1,segDir,c_white,activeDraw);