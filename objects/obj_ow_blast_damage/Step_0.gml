//timer++;

if(instance_position(x+16, y+16, obj_ow_rock) != noone)
{
	//var kill1 = instance_position(x+16, y+16, obj_ow_rock.upObj);
	//var kill2 = instance_position(x+16, y+16, obj_ow_rock.downObj);
	var kill3 = instance_position(x+16, y+16, obj_ow_rock);
	var kill1 = kill3.upObj;
	var kill2 = kill3.downObj;
	var kill4 = kill3.myShadow;
	
	kill3.HP -= 3;
	
	if(kill3.HP = 0)
	{
		part_particles_create(global.P_System, kill3.x + 16, kill3.y + 16, global.rockDeath, 8);
		var xx = tilemap_get_cell_x_at_pixel(global.Tiles_1, kill3.x + 16, kill3.y + 16);
		var yy = tilemap_get_cell_y_at_pixel(global.Tiles_1, kill3.x + 16, kill3.y + 16);
		tilemap_set(global.Tiles_1, 0, xx, yy);
		instance_destroy(kill1);
		instance_destroy(kill2);
		instance_destroy(kill3);
		instance_destroy(kill4);

	}
}

if(instance_position(x+16, y+16, obj_ow_enemy_parent) != noone)
{
	//var kill1 = instance_position(x+16, y+16, obj_ow_rock.upObj);
	//var kill2 = instance_position(x+16, y+16, obj_ow_rock.downObj);
	var kill3 = instance_position(x+16, y+16, obj_ow_enemy_parent);
	var kill1 = kill3.upObj;
	var kill2 = kill3.downObj;
	var kill4 = kill3.myShadow;
	
	kill3.HP -= 3;
	
	if(kill3.HP = 0)
	{
		part_particles_create(global.P_System, kill3.x + 16, kill3.y + 16, global.rockDeath, 8);
		var xx = tilemap_get_cell_x_at_pixel(global.Tiles_1, kill3.x + 16, kill3.y + 16);
		var yy = tilemap_get_cell_y_at_pixel(global.Tiles_1, kill3.x + 16, kill3.y + 16);
		if(kill3.object_index = obj_ow_superheated_wall)
		{
			tilemap_set(global.Tiles_1, 7, xx, yy);
		}
		else
		{
			tilemap_set(global.Tiles_1, 0, xx, yy);
		}
		instance_destroy(kill1);
		instance_destroy(kill2);
		instance_destroy(kill3);
		instance_destroy(kill4);

	}
}

if(instance_position(x+16, y+16, obj_ow_player_tank) != noone)
{
var kill3 = instance_position(x+16, y+16, obj_ow_player_tank);
kill3.HP -= 5;
}
//if image_index = max, aka it played it's full anim, then kill self

//if(timer >= 30)
//{
instance_destroy(self);
//}