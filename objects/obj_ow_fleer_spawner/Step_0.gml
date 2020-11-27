if(point_distance(x+16,y+16,target.x+14,target.y+14) > spawnDist && !distChk)
{
	var spawnChk = 0;
	for(var i = 0; i < spawnNum; i ++)
	{
		if(instance_exists(mySpawns[i]))
		{
			spawnChk ++;	
		}
	}
	
	if(spawnChk = spawnNum)
	{
		instance_destroy();
	}
	
	distChk = true;
}