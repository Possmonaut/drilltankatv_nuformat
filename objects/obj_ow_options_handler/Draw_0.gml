if(global.debug)
{
	//var inst = instance_place(mouse_x,mouse_y,all);

	//if(inst != noone)
	//{
		//draw_text(mouse_x,mouse_y,inst.depth);
	//}
	
	var l = layer_get_id("Tiles_1");

	var mT = layer_tilemap_get_id(l);

	var bum = tilemap_get_at_pixel(mT,mouse_x,mouse_y);
	
	var tx = tilemap_get_cell_x_at_pixel(mT,mouse_x,mouse_y);
	var ty = tilemap_get_cell_y_at_pixel(mT,mouse_x,mouse_y);
	
	var bumC = tilemap_get(mT,tx,ty);
	
	
	
	//if(mouse_check_button(mb_left))
	//{
	//	tilemap_set_at_pixel(mT,1,mouse_x,mouse_y);
	//}
	
	var buttfart = instance_position(mouse_x,mouse_y,obj_ow_rock_parent);
	
	if(buttfart !=noone)
	{
		bum = buttfart.depth;
	}
	
	//draw_text(mouse_x,mouse_y,bum);
	//draw_text(mouse_x,mouse_y+32,bumC);
	
	//var p = tilemap_get_at_pixel(global.Shadow_Lower,mouse_x,mouse_y);
	//draw_text(mouse_x,mouse_y+64,string(p));
	
	collision_point_list(mouse_x,mouse_y,all,true,true,drawList,true);
	var lSiz = ds_list_size(drawList);
	draw_text(mouse_x,mouse_y-20,lSiz);
	for(var i = 0; i < lSiz;i++)
	{
		draw_text(mouse_x,mouse_y+(i*20),object_get_name(drawList[|i].object_index));
	}
	
	ds_list_clear(drawList);
}