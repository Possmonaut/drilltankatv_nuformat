//if time up
//play death animation

lifeTimer ++;

if(lifeTimer > lifeTime)
{
	instance_destroy();
}