//deal damage
//if not already playing animation, play animation

if(target.visualSpriteTank.damageFlash == false && lifeTimer > windUpTime)
{
	target.HP -= 5;
	target.visualSpriteTank.damageFlash = true;
	lifeTimer = lifeTime;
}