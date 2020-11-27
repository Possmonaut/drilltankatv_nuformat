//argument 0 = drillheat
//1 = x
//2 = y
//3 = extra particles (for final burst)
function sc_steam_burst(argument0,argument1,argument2,argument3){

			part_system_depth(global.P_System,obj_ow_player_tank.depth);
			
			for(var i = 0; i < 4; i ++)
			{
			var stNum = floor(argument0 * 0.04);
			part_type_speed(global.ventSteam, 1+(argument0 * 0.01), 2.5+(argument0 * 0.01), -0.05, 0);
			part_type_direction(global.ventSteam,90*i,(90*i)+45,0,0);
			part_particles_create(global.P_System, argument1+14, argument2+14, global.ventSteam, stNum+argument3);
			}
			
			part_system_depth(global.P_System, obj_ow_particle_handler.depth);

}