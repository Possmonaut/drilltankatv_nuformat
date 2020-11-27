part_particles_create(global.P_System, x+16, y+16, global.crystalPart, 6);
part_particles_create(global.P_System, x+16, y+16, global.rockSpark, 6);

if(instance_exists(myPingAs))
{
	instance_destroy(myPingAs);
}

var clampAud = 0;

var t = collision_line(x+32,y+32,target.x+14,target.y+14,obj_ow_nopass_enemy,false,true);
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

var b = audio_play_sound(so_crys_break,1,false);
audio_sound_gain(b,vDist*0.5,0);