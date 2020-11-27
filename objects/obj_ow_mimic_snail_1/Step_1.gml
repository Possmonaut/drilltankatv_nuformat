//run the data for states and calculate paths 
//state:
//0 = nothing (listening)
//1 = swipe
//2 = emerge
//3 = chase
//4 = return
//5 = settle
//6 = death

timer ++;
tAngle = point_direction(x+16,y+16,target.x+14,target.y+14);
tDist = point_direction(x+16,y+16,target.x+14,target.y+14);

if(state = 0)
{}

if(state = 1)
{
	//if arm not emerged
	//emerge
	//if arm is emerged 
	//swipe in arc at +90 tAngle to - 90 tAngle
	//create hitbox that is centered on tAngle but at 90 degrees (perpendicular)
	//return to state 0
	
}

if(state = 2)
{
	//play emerging animation and then switch to state 3
}

if(state = 3)
{
	if(timer >= updateTimer)
	{
		target_x = tilemap_get_cell_x_at_pixel(global.Tiles_1,target.x,target.y);
		target_y = tilemap_get_cell_y_at_pixel(global.Tiles_1,target.x,target.y);
		//I dunno why but you need those +16s in the below code because ???
		if(mp_grid_path(global.mp_grid32,myPath,x+16,y+16,(target_x*32)+16,(target_y*32)+16,true) = true)
		{
			path_start(myPath,mySpeed,path_action_stop,false);
		}
		else
		{
			path_end();
		}
		updateTimer = timer + updateInterval;
	}
	
	//if x dist from player
	//stop and shift state to 1
	//shift to state 4
	//going to want to store the movement angle of this path and move in linear pull motions more or less 
}

if(state = 4)
{
	//if player if outside run range and has been for x 
	//begin return (we're gonna want to try and hijack state 3)
	//else
	//shift state back to 3 
	//if still in state
	//reset potision back to original emergence point and begin pathing towards that 
	//if at said point
	//shift to state 5 
}

if(state = 5)
{
	//burrow animation. set state to 0
}

if(state = 6)
{
	//we are dead. play animations, create corpses, etc 
}