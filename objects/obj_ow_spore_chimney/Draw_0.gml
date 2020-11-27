//drraw self draw particles
//draw extra particles when spawning spores

if(fireAnim = false)
{
	idleTimer ++;
	if(idleTimer > idleTime){
		animFrame ++; 
		idleTimer = 0; 
		if(animFrame > idleAnimFrames)
		{
			animFrame = 0;
			part_particles_create(global.P_System, x+16, y+16, global.blood, 6);
		}
	}
	
draw_sprite_ext(currSp,animFrame,x+16,y+16,1,1,dir,c_white,1);
}
else
{
	draw_sprite_ext(currSp,animFrame,x+16,y+16,1,1,dir,c_white,1);
}
