//scan around
//check vertice LOS of each LOS obj, store those
//then draw shadows via said vertices 
//then have all objects draw afterwards 

x = mouse_x;
y = mouse_y;
topLeftcblock.x = x-288;
topLeftcblock.y = y-288;
topRightcblock.x = x+256;
topRightcblock.y = y-288;
botLeftcblock.x = x-288;
botLeftcblock.y = y+256;
botRightcblock.x = x+257
botRightcblock.y = y+257;


for(var i = 0; i < 180; i ++)
{
collision_line_list(x, y, x + lengthdir_x(512, rotateDir), y + lengthdir_y(512, rotateDir), obj_ow_nopass, false, true, radarList, true);
if(blockList[|blCurrentFill - 1] != radarList[|0])
{
	if(radarList[|0] = undefined || radarList[|0].object_index = obj_ow_lightsysmk2_test_block)
	{
	}
	else
	{
	blockList[|blCurrentFill] = radarList[|0];
	blCurrentFill++;
	ds_list_add(verticeListX,radarList[|0].x);
	ds_list_add(verticeListY,radarList[|0].y);
	//get length to 
	//you forgot you can just ds_list_add you dingus
	}
}
rotateDir += 2; //changed from +2. if you're missing blocks, this might be it 
ds_list_clear(radarList);
//add only the FIRST entry from this list 
}

rotateDir = 0;
blCurrentFill = 1;

//so do the below, but when moving onto the non-corner blocks, use a series of scripts to do the correct reading
//of the vertices based on angle from the player. 0,45,90,135,180,225,270,315,360

/*
var listLength = ds_list_size(blockList);

for(var o = 0; o < listLength +1; o ++)
{
	if(blockList[|o] = undefined || blockList[|o] = 0)
	{
	}
	else
	{	
		var target = blockList[|o];
		if(blockList[|o].object_index = obj_ow_lightsysmk2_test_corner_block)
		{
			//change this to lenghtDir out a certain distance using the corner coordinates
			if(blockList[|o] = topLeftcblock) 
			{
				//var vertice = collision_line(x,y,x-256,y-256,obj_ow_nopass,false,true);
				//if(vertice = noone)
				//{
					var dir = point_direction(x,y,x-256,y-256);
					dir1 = dir;
					ds_list_add(verticeListX,x+lengthdir_x(leng,dir));
					ds_list_add(verticeListY,y+lengthdir_y(leng,dir));
				//}
			}
			if(blockList[|o] = topRightcblock)
			{
				//var vertice = collision_line(x,y,x+256,y-256,obj_ow_nopass,false,true);
				//if(vertice = noone)
				//{
					var dir = point_direction(x,y,x+256,y-256);
					dir2 = dir;
					ds_list_add(verticeListX,x+lengthdir_x(leng,dir));
					ds_list_add(verticeListY,y+lengthdir_y(leng,dir));
				//}
			}
			if(blockList[|o] = botLeftcblock)
			{
				//var vertice = collision_line(x,y,x-256,y+256,obj_ow_nopass,false,true);
				//if(vertice = noone)
				//{
					var dir = point_direction(x,y,x-256,y+256);
					dir3 = dir;
					ds_list_add(verticeListX,x+lengthdir_x(leng,dir));
					ds_list_add(verticeListY,y+lengthdir_y(leng,dir));
				//}
			}
			if(blockList[|o] = botRightcblock)
			{
				//var vertice = collision_line(x,y,x+256,y+256,obj_ow_nopass,false,true);
				//if(vertice = noone)
				//{
					var dir = point_direction(x,y,x+256,y+256);
					dir4 = dir;
					ds_list_add(verticeListX,x+lengthdir_x(leng,dir));
					ds_list_add(verticeListY,y+lengthdir_y(leng,dir));
				//}
			}
		}
		else
		{
			
		var vertice1 = collision_line(x,y,target.x-1,target.y-1,obj_ow_nopass,false,true);
		var vertice2 = collision_line(x,y,target.x+32,target.y-1,obj_ow_nopass,false,true);
		var vertice3 = collision_line(x,y,target.x-1,target.y+32,obj_ow_nopass,false,true);
		var vertice4 = collision_line(x,y,target.x+32,target.y+32,obj_ow_nopass,false,true);
		
		//change this to IF no collision confirmed, cast another line from said point to check if any other
		//blocks. if no other blocks, then length_dir out by 512 or 256 
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
				ds_list_add(verticeListX,target.x);
				ds_list_add(verticeListY,target.y)
				ds_list_add(verticeListX,castX);
				ds_list_add(verticeListY,castY);
				}
				else
				{
				ds_list_add(verticeListX,castX); //long
				ds_list_add(verticeListY,castY);
				ds_list_add(verticeListX,target.x); //short
				ds_list_add(verticeListY,target.y)
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
		
		}
		
	}
	
}

twoHit = false;