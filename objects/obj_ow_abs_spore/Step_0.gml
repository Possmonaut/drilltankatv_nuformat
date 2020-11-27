timer ++;

if(timer < lifeTime -60)
{
var gainModAmb = 0.5;

var vDist = sc_gainFalloff(384, 0);

audio_sound_gain(myAudA,vDist*gainModAmb,100);
}
else
{
	audio_sound_gain(myAudA,0,500);
}


if(HP <= 0 || timer > lifeTime)
{
	state = 4;
	//if(instance_exists(nlosPing)){instance_destroy(nlosPing);}
	death = true;
	var b = audio_play_sound(so_meat_break,1,false)
	audio_sound_gain(b,vDist*0.5,0);
	part_particles_create(global.P_System,x+16,y+16,global.meatChunk,8);
	instance_destroy();
	exit;
}

if(timer > updateInterval)
{
	var xx = target.x+14+lengthdir_x(14,target.angleDir);
	var yy = target.y+14+lengthdir_y(14,target.angleDir);
	angleDir = point_direction(x+16,y+16,xx,yy);
	velocity = spd;
	timer = 0;	
	audio_sound_pitch(myAudA,irandom_range(0.8,1.2));
}

if(velocity > 0)
{
	velocity -= veloDecay;
}

x+=cos(angleDir*2*pi/360)*velocity;
y+=-sin(angleDir*2*pi/360)*velocity;
