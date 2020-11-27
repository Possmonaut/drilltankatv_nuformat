if(obj_ow_player_tank.velocity > 0.5){ obj_ow_player_tank.velocity = 0.5;}

/*
if(obj_ow_player_tank.drillOn && death != true)
{
	HP--;
}
*/

if(obj_ow_player_tank.drillOn)
{
	part_particles_create(global.P_System, x, y, global.rockSpark, 1);
}