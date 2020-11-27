if(!instance_exists(mySpawn) && spawnDeath = false) //if our spawn is destroyed, stay spawned in to prevent more grinders from 
{
	if(distance_to_object(target) < myDist * 0.5)
	{
	mySpawn = instance_create_depth(x,y,depth,obj_ow_mimc_snail_v4);
	mySpawn.progen = id;
	}
} //being spawned @ this location, at least until room reset
else
{
	if(instance_exists(mySpawn))
	{
		if(mySpawn.death == true)
		{
			spawnDeath = true;
		}
	}
	
	if(spawnDeath)
	{
			instance_destroy(mySpawn);
	}
	
	if(spawnDeath = false)
	{
		if(distance_to_object(obj_ow_player_tank) >= myDist)
		{
			mySpawn.comeBack = true;
			if(isHome = true)
			{
				instance_destroy(mySpawn);
				mySpawn = -4;
			}
		}
		else
		{
			mySpawn.comeBack = false;
		}
	}
}


isHome = false;