x=target.x+16;
y=target.y+16;


for(var i = 0; i < 180; i ++)
{
	collision_line_list(x, y, x + lengthdir_x(sweepLength, rotateDir), y + lengthdir_y(sweepLength, rotateDir), obj_ow_nopass, false, true, radarList, true);
	var listLeng = ds_list_size(radarList);
	for(var o = 0; o <  listLeng; o ++)
	{
		if(variable_instance_exists(radarList[|o],"distMultC"))
		{//this means that if a monster is in the way of a block (but doesn't cast a shadow) it don't block LOS 
			//to blocks behind it 
			if(o = losCheck) 
			{
			
				ds_list_add(blockList,radarList[|o]);
			}
			else
			{
						var lightLevel = radarList[|o].distMultC;
						if(lightLevel <= 0)
						{}
						else
						{
						lightLevel -= 0.1;
						}
				//radarList[|o].image_alpha = lightLevel;
				//radarList[|o].upObj.image_alpha = lightLevel;
				//radarList[|o].downObj.image_alpha = lightLevel;
				//radarList[|o].myShadow.active = false; //change this to also fade later
				//here, add in a distance check for the distmult shader
				//scr_distMult(radarList[|o]);
				radarList[|o].distMultC = lightLevel;
				if(radarList[|o].upObj != -4)
				{
				radarList[|o].upObj.distMultC = lightLevel;
				radarList[|o].downObj.distMultC = lightLevel;
				}
				radarList[|o].myShadow.active = false; //change this to also fade later
			}
		}
		else
		{
			losCheck ++;
		}
	}
	
	losCheck = 0; 
	rotateDir += 2;
	ds_list_clear(radarList);
}

var listLeng2 = ds_list_size(blockList);

for(var p = 0; p < listLeng2; p ++)
{
	
		var lightLevel = blockList[|p].distMultC;
		if(lightLevel >= 1)
		{}
		else
		{
			lightLevel += 0.1;
		}
		/*
		blockList[|p].image_alpha = lightLevel;
		blockList[|p].upObj.image_alpha = lightLevel;
		blockList[|p].downObj.image_alpha = lightLevel;
		blockList[|p].myShadow.active = true;
		*/
		blockList[|p].distMultC = lightLevel;
		if(blockList[|p].upObj != -4)
		{
		blockList[|p].upObj.distMultC = lightLevel;
		blockList[|p].downObj.distMultC = lightLevel;
		}
		blockList[|p].myShadow.active = true;	
}

losCheck = 0;
rotateDir = 0; 
ds_list_clear(radarList);
ds_list_clear(blockList);