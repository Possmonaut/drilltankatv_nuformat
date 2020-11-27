


timer ++;
if(smokeTimer <= timer)
{
	part_particles_create(global.P_System,x + (mySize /2), y + (mySize / 2), global.smokeParticle, irandom_range(1,3));
	smokeTimer = timer + 20;
}

velocity -= 0.3;
if(velocity > 0)
{
	x+=cos(angleDir*2*pi/360)*velocity;
	y+=-sin(angleDir*2*pi/360)*velocity;
}

if(life <= timer)
{
	instance_destroy(id);
}