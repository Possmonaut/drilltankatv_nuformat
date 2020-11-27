if(!instance_exists(mySpawn)) //if our spawn is destroyed, stay spawned in to prevent more grinders from 
{

} //being spawned @ this location, at least until room reset
else
{
	if(mySpawn.death = true)
	{
		spawnDeath = true;
	}
	
	if(spawnDeath)
	{
		if(point_distance(target.x,target.y,mySpawn.x,mySpawn.y) >= myDist)
		{
			instance_destroy(mySpawn);
		}
	}
	
	if(spawnDeath != true)
	{
		if(distance_to_object(obj_ow_player_tank) >= myDist)
		{
			if(point_distance(target.x,target.y,mySpawn.x,mySpawn.y) >= myDist)
			{
				instance_destroy(mySpawn);
				instance_destroy();
			}
		}
	}
	

}