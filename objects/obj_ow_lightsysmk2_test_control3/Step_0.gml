
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
			
		
		//can turn this into a for loop later

		sortTest[# 0,0] = collision_line(x,y,target.x-1,target.y-1,obj_ow_nopass,false,true);
		sortTest[# 1,0] = collision_line(x,y,target.x+32,target.y-1,obj_ow_nopass,false,true);
		sortTest[# 2,0] = collision_line(x,y,target.x-1,target.y+32,obj_ow_nopass,false,true);
		sortTest[# 3,0] = collision_line(x,y,target.x+32,target.y+32,obj_ow_nopass,false,true);
		
		sortTest[# 0,1] = target.x-1;
		sortTest[# 1,1] = target.x+32;
		sortTest[# 2,1] = target.x-1;
		sortTest[# 3,1] = target.x+32;
		
		sortTest[# 0,2] = target.y-1;
		sortTest[# 1,2] = target.y-1;
		sortTest[# 2,2] = target.y+32;
		sortTest[# 3,2] = target.y+32;
		
		
		for(var p = 0; p < 4; p++)
		{
			if(sortTest[# p,0] = noone)
			{
				pointSortGrid[# 0,pPlus] = sortTest[# p,1]; //x
				pointSortGrid[# 1,pPlus] = sortTest[# p,2]; //y
				pointSortGrid[# 2,pPlus] = point_direction(x,y,sortTest[# p,1],sortTest[# p,2]); //direction
				pointSortGrid[# 3,pPlus] = point_distance(x,y,sortTest[# p,1],sortTest[# p,2]); //distance
				var dir = point_direction(x,y,sortTest[# p,1],sortTest[# p,2]);
				var castX = x+lengthdir_x(leng,dir);
				var castY = y+lengthdir_y(leng,dir);
				var lineCast = collision_line(sortTest[# p,1],sortTest[# p,2],castX, castY,obj_ow_nopass,false,true);
				
				if(lineCast = noone)
				{
					pPlus++;
				pointSortGrid[# 0,pPlus] = castX;
				pointSortGrid[# 1,pPlus] = castY;
				pointSortGrid[# 2,pPlus] = dir
				pointSortGrid[# 3,pPlus] = leng;
				}
				pPlus ++;
				
			}
		}
		drawPlus = pPlus;
		
		
		
		ds_grid_sort(pointSortGrid,3,false);
		ds_grid_sort(pointSortGrid,2,true);
		
		swap_grid[# 0,0] = pointSortGrid[# 0,4];
		swap_grid[# 0,1] = pointSortGrid[# 1,4];
		swap_grid[# 0,2] = pointSortGrid[# 2,4];
		swap_grid[# 0,3] = pointSortGrid[# 3,4];
		
		swap_grid[# 1,0] = pointSortGrid[# 0,5];
		swap_grid[# 1,1] = pointSortGrid[# 1,5];
		swap_grid[# 1,2] = pointSortGrid[# 2,5];
		swap_grid[# 1,3] = pointSortGrid[# 3,5];
		
		pointSortGrid[# 0,4] = swap_grid[# 1,0];
		pointSortGrid[# 1,4] = swap_grid[# 1,1];
		pointSortGrid[# 2,4] = swap_grid[# 1,2];
		pointSortGrid[# 3,4] = swap_grid[# 1,3];
		
		pointSortGrid[# 0,5] = swap_grid[# 0,0];
		pointSortGrid[# 1,5] = swap_grid[# 0,1];
		pointSortGrid[# 2,5] = swap_grid[# 0,2];
		pointSortGrid[# 3,5] = swap_grid[# 0,3];
		
		
		for(var a = 0; a < 5; a++)
		{
			if(pointSortGrid[# 0,a] = 0 || pointSortGrid[# 0,a] = undefined)
			{
			}
			else
			{
				ds_list_add(verticeListX, pointSortGrid[# 0, a]);
				ds_list_add(verticeListY, pointSortGrid[# 1, a]);
			}
		}
		
		
		
		//change this to IF no collision confirmed, cast another line from said point to check if any other
		//blocks. if no other blocks, then length_dir out by 512 or 256 

		}
		
	}
	
}

twoHit = false;