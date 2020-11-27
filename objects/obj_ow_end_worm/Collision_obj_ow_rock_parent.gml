//make them explode into rock chunks, and slightly slow down the worm 

var target = other;

part_particles_create(global.P_System, target.x +16, target.y +16, global.rockDeath, 8);
var xx = tilemap_get_cell_x_at_pixel(global.Tiles_1, target.x, target.y+global.blockGenofst);
			var yy = tilemap_get_cell_y_at_pixel(global.Tiles_1, target.x, target.y+global.blockGenofst);
				tilemap_set(global.Tiles_1, 0, xx, yy);
				tilemap_set(global.Tiles_Lower,0,xx,yy);
				tilemap_set(global.Tiles_Upper,0,xx,yy);
				tilemap_set(global.Tiles_Middle,0,xx,yy);
				tilemap_set(global.Shadow_Lower,0,xx,yy); //sets the lower shadow to 0
				if(target.dsTrig = true){instance_create_depth(target.x,target.y,target.depth,target.deathSpawn);}
				if(target.tsTrig = true){tilemap_set(global.Tiles_1,target.tileSpawn,xx,yy);}
				var pingDest = instance_position(target.x,target.y,obj_ow_ping_block);
				var crackTarg = instance_position(target.x+16,target.y+16,obj_ow_timer_generic);
				if(crackTarg != noone)
				{instance_destroy(crackTarg);}
				instance_destroy(pingDest);
				instance_destroy(target);
				
				if(rockAud < 3)
				{
				var b = audio_play_sound(so_rock_break,1,false);
				audio_sound_gain(b,smashGain,0);
				var r = random_range(0.7,1.3);
				audio_sound_pitch(b,r);
				rockAud += 1;
				}
				
				sc_shake_call(0.5,60,true);
				
spd = 0.5;
				//if this breaks something, you'll need to change target to something else 
				