
if(obj_ow_player_tank.drillOn && death != true)
{
	HP--;
}

if(obj_ow_player_tank.drillOn)
{
	part_particles_create(global.P_System, x, y, global.blood, 1);
}