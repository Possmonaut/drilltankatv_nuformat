timer ++;

if(timer > deathTime)
{
	instance_destroy();
}

/*
if(!instance_exists(myPingAs))
{
	instance_create_depth(x,y,obj_ow_auto_tile_dark.depth+1,obj_ow_ping_floor);
}