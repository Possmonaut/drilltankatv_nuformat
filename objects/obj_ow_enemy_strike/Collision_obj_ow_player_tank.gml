/// @description Insert description here
// You can write your code in this editor
if(image_index == 3)
{
	obj_ow_player_tank_sp.damageFlash = true;
	obj_ow_player_tank.HP -= 10;
	instance_destroy(id);
}