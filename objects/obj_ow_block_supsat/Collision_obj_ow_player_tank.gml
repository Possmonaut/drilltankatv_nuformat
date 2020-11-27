if(other.velocity > 0.5){ other.velocity = 0.5;}

if(target.visualSpriteTank.damageFlash == false && death != true && animTimer > animMax*0.5)
{
	target.HP -= 5;
	target.visualSpriteTank.damageFlash = true;
}

cDest = true;
instance_destroy();