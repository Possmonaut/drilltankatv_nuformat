ds_grid_destroy(botCircle);
ds_grid_destroy(midCircle);
ds_grid_destroy(topCircle);
instance_destroy(bigassBG);

for(var i = 0; i < 3; i++)
{
	if(instance_exists(tunnelList[|i]))
	{
		instance_destroy(tunnelList[|i]);
	}
}

ds_list_destroy(tunnelList);

struts.depth = -101;
engines.depth = -102;