target = obj_ow_player_tank;
spawnDist = 512;
spawnNum = irandom_range(3,6);
spawned = false;
despawn = false;
image_alpha = 0;

for(var i = 0; i < spawnNum; i++)
{
	mySpawns[i] = 0;
}

for(var i = 0; i < spawnNum; i ++)
{
		var _x = irandom_range(-64,64);
		var _y = irandom_range(-64,64);
		var b  = instance_create_depth(x+16+_x,y+16+_y,target.depth+20,obj_ow_fleer);
		b.progen = id;
		mySpawns[i] = b;
}

distChk = false;