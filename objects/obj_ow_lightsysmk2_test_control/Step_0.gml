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
	if(radarList[|0] = undefined)
	{
	}
	else
	{
	blockList[|blCurrentFill] = radarList[|0];
	blCurrentFill++;
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
			
		var dirTest = point_direction(x,y,target.x+16,target.y+16);
		
		vertice1 = collision_line(x,y,target.x-1,target.y-1,obj_ow_nopass,false,true);
		vertice2 = collision_line(x,y,target.x+32,target.y-1,obj_ow_nopass,false,true);
		vertice3 = collision_line(x,y,target.x-1,target.y+32,obj_ow_nopass,false,true);
		vertice4 = collision_line(x,y,target.x+32,target.y+32,obj_ow_nopass,false,true);
		
		//change this to IF no collision confirmed, cast another line from said point to check if any other
		//blocks. if no other blocks, then length_dir out by 512 or 256 
		
		if(dirTest > 0 && dirTest < 90){scr_lineorder_1_89(target);}
		
		if(dirTest > 90 && dirTest < 180){scr_lineorder_91_179(target);}
		
		if(dirTest > 180 && dirTest < 270){scr_lineorder_181_269(target);}
		
		if(dirTest > 270 && dirTest < 360){scr_lineorder_271_359(target);}
		}
		
	}
	
}

twoHit = false;