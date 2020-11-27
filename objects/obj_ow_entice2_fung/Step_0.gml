if(!depthSet)
{
	if(instance_exists(obj_ow_player_tank))
	{
		depth = obj_ow_player_tank.visualSpriteDrill.depth -1;
		lowerPath.depth = obj_ow_player_tank.visualSpriteTank.treadLeft.depth+1;
		depthSet = true;
	}
}


