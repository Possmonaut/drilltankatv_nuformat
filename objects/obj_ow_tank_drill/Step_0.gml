/// @description Insert description here
// You can write your code in this editor
jammed = false;

crnrArray[|0] = instance_position(bbox_left,bbox_top,obj_ow_nopass);
crnrArray[|1] = instance_position(bbox_right,bbox_top,obj_ow_nopass);
crnrArray[|2] = instance_position(bbox_left,bbox_bottom,obj_ow_nopass);
crnrArray[|3] = instance_position(bbox_right,bbox_bottom,obj_ow_nopass);

crnrArray[|4] = instance_position(bbox_left,bbox_top,obj_ow_enemy_passable);
crnrArray[|5] = instance_position(bbox_right,bbox_top,obj_ow_enemy_passable);
crnrArray[|6] = instance_position(bbox_left,bbox_bottom,obj_ow_enemy_passable);
crnrArray[|7] = instance_position(bbox_right,bbox_bottom,obj_ow_enemy_passable);

for(var i = 0; i < 4; i ++)
{
	if(instance_exists(crnrArray[|i]))
	{
		if(crnrArray[|i].drillable = false)
		{
			jammed = true;
		}
	}
}