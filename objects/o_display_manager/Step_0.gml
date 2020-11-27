if(room = rm_new_demo)
{
	if(turnOffBG)
	{
		alarm[1] = 1;
		turnOffBG = false;
		cRoom = room;
	}
}

if(room != cRoom)
{
	alarm[1] = 1;
	turnOffBG = false;
	cRoom = room;
}