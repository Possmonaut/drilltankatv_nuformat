function scr_lineorder_1_89(argument0) {
	var target = argument0;


	if( vertice4 = noone)
			{
				var dir = point_direction(x,y,target.x+32,target.y+32);
				var castX = x+lengthdir_x(leng,dir);
				var castY = y+lengthdir_y(leng,dir);
				var lineCast = collision_line(target.x+32,target.y+32,castX, castY,obj_ow_nopass,false,true);
				if(lineCast = noone)
				{
					if(twoHit = true)
					{
					ds_list_add(verticeListX,target.x+31); //short
					ds_list_add(verticeListY,target.y+31);
					ds_list_add(verticeListX,castX);
					ds_list_add(verticeListY,castY); //long
					}
					else
					{
					ds_list_add(verticeListX,castX);
					ds_list_add(verticeListY,castY);
					ds_list_add(verticeListX,target.x+31);
					ds_list_add(verticeListY,target.y+31);
					}
				}
				else
				{
					ds_list_add(verticeListX,target.x+31);
					ds_list_add(verticeListY,target.y+31);
				}
			}

	if( vertice3 = noone)
			{
				var dir = point_direction(x,y,target.x-1,target.y+32);
				var castX = x+lengthdir_x(leng,dir);
				var castY = y+lengthdir_y(leng,dir);
				var lineCast = collision_line(target.x-1,target.y+32,castX, castY,obj_ow_nopass,false,true);
				if(lineCast = noone)
				{
					if(twoHit = true)
					{
					ds_list_add(verticeListX,target.x); //short
					ds_list_add(verticeListY,target.y+31);
					ds_list_add(verticeListX,castX);
					ds_list_add(verticeListY,castY); //long
					}
					else
					{
					ds_list_add(verticeListX,castX); //long 
					ds_list_add(verticeListY,castY); 
					ds_list_add(verticeListX,target.x);
					ds_list_add(verticeListY,target.y+31); //short
					}
					twoHit = true;

				}
				else
				{
					ds_list_add(verticeListX,target.x);
					ds_list_add(verticeListY,target.y+31);
				}
			}
		
	if( vertice1 = noone)
			{
				var dir = point_direction(x,y,target.x-1,target.y-1);
				var castX = x+lengthdir_x(leng,dir);
				var castY = y+lengthdir_y(leng,dir);
				var lineCast = collision_line(target.x-1,target.y-1,castX, castY,obj_ow_nopass,false,true);
				if(lineCast = noone)
				{
					if(twoHit = true)
					{
					ds_list_add(verticeListX,castX); //long
					ds_list_add(verticeListY,castY);
					ds_list_add(verticeListX,target.x); //short
					ds_list_add(verticeListY,target.y)
				
					}
					else
					{
					ds_list_add(verticeListX,target.x);
					ds_list_add(verticeListY,target.y)
					ds_list_add(verticeListX,castX);
					ds_list_add(verticeListY,castY);
					}
					twoHit = true;
				}
				else
				{
					ds_list_add(verticeListX,target.x);
					ds_list_add(verticeListY,target.y);
					//twoHit = false;
				}
			}
		
		if( vertice2 = noone)
			{
				var dir = point_direction(x,y,target.x+32,target.y-1);
				var castX = x+lengthdir_x(leng,dir);
				var castY = y+lengthdir_y(leng,dir);
				var lineCast = collision_line(target.x+32,target.y-1,castX, castY,obj_ow_nopass,false,true);
				if(lineCast = noone)
				{
					if(twoHit = true)
					{
					ds_list_add(verticeListX,target.x+31); //short
					ds_list_add(verticeListY,target.y);
					ds_list_add(verticeListX,castX); //long
					ds_list_add(verticeListY,castY);
					}
					else
					{
					ds_list_add(verticeListX,castX); //long
					ds_list_add(verticeListY,castY);
					ds_list_add(verticeListX,target.x+31);
					ds_list_add(verticeListY,target.y); //short
					}
					twoHit = true;
				}
				else
				{
				ds_list_add(verticeListX,target.x+31);
				ds_list_add(verticeListY,target.y);
				//twoHit = false;
				}
			}
		
		


}
