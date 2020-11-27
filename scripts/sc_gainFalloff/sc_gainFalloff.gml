// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//arguement 0 = max dist (distance at which gain will be set to 0)
//argument 1 = modifier 

function sc_gainFalloff(argument0,argument1){
	var vDist = distance_to_object(obj_ow_player_tank);
	if(vDist > argument0){vDist = argument0;}
	vDist = (1-(vDist / argument0)) + argument1;
	return vDist;
}