if(instance_exists(mySpawn))
{
	if(distance_to_object(obj_ow_player_tank) > myDist)
	{
		if(point_distance(target.x+14,target.y+14,mySpawn.x+16,mySpawn.y+16) > myDist)
		{
			instance_destroy(mySpawn);
			instance_destroy();
		}
	}
	
	if(mySpawn.death2 && spawnDeath = false)
	{
		spawnDeath = true;
		instance_destroy(mySpawn);
	}
}