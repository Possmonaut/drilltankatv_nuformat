if(collision_line(x + 1, y+1, target.x +1, target.y + 1, obj_ow_nopass, false, true) = noone)
{ LOSconfirm ++;}
if(collision_line(x + 31, y+1, target.x +31, target.y + 1, obj_ow_nopass, false, true) = noone)
{ LOSconfirm ++;}
if(collision_line(x + 1, y+31, target.x +1, target.y + 31, obj_ow_nopass, false, true) = noone)
{ LOSconfirm ++;}
if(collision_line(x + 31, y+31, target.x +31, target.y + 31, obj_ow_nopass, false, true) = noone)
{ LOSconfirm ++;}

if(y <= target.y && LOSconfirm = 4) //need this is a DLOS check 
{ depth = 9;}
else
{ depth = 30;} 

/*

timer ++;
path_end(); //end path after moving 32 pixels. if the instance doesn't move at all, might have to move this to the top.


if(distance_to_object(obj_ow_player_tank) <= outOfRange)
{detectTimer ++;} //this gives the player aboutt a second before enemy detects them


if(distance_to_object(obj_ow_player_tank) > outOfRange)
{detectTimer ++;} //this gives the player aboutt a second before enemy detects them



if(detectTimer > 180)
{
	if(collision_line(x + 16, y + 16, target.x + 16, target.y + 16, obj_ow_nopass, false, true) = noone)
	{ LOSconfirm ++; }
	
	if(LOSconfirm > 0)
	{	state = 1;
		} //move towards player with some basic obstacle avoidance
		
	if(LOSconfirm = 0 && distance_to_object(obj_ow_player_tank) = outOfRange)
	{
		state = 0;
	}
		
	LOSconfirm = 0;
	detectTimer = 0;
}

if(state = 0)
{

} 

if(state = 1) // use pathfinding to pursue until player is x away. if x away, count down and return to state 0 after coutn down
{
	if(moveTimer < timer)
	{
		
		if(point_distance(x+ 16, y + 16, target.x + 16, target.y + 16) <= 48)
		{

			if(obj_ow_player_tank_sp.damageFlash == true || stunned == true)
			{
			moveTimer = timer + 60;
			stunned = false;
			}
			else
			{
			instance_create_depth(target.x, target.y, -3, obj_ow_enemy_strike);
			moveTimer = timer + 60;
			}
		}
		else
		{

			if(mp_grid_path(global.mp_grid32, myPath, x + 16, y + 16, target.x + 16, target.y + 16, 0) = false)
			{
			path_end();
			}
			else
			{
			mp_grid_path(global.mp_grid32, myPath, x + 16, y + 16, target.x + 16, target.y + 16, 0);
			path_start(myPath, 32, path_action_continue, 0); //start patth, move 32 pixels
			moveTimer = timer + 60;
			}
		}
	}
}


