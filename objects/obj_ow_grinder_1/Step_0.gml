timer ++;

if(timer >= idleTimer)
{
	behaveChange = true;
	idleTimer = timer + random_range(180, idleInterval);
}


if(angleDir != updateAngle)
{
	if(updateAngle > angleDir){angleDir += 2;}
	else
	{angleDir -= 2;}
}


x+=cos(angleDir*2*pi/360)*spd;
y+=-sin(angleDir*2*pi/360)*spd;

drillCollider.x = x + 16 + lengthdir_x(16,angleDir);
drillCollider.y = y + 16 + lengthdir_y(16,angleDir);
drillCollider.image_angle = angleDir + 90;

visualSp.x = x + 16;
visualSp.y = y + 16;

collision_rectangle_list(drillCollider.bbox_left,drillCollider.bbox_top,drillCollider.bbox_right,drillCollider.bbox_bottom,obj_ow_rock_parent,false,true,drillArray,false);

var listLeng = ds_list_size(drillArray);

for(var i = 0; i < listLeng; i ++)
{
	if(instance_exists(drillArray[|i]))
	{
		drilling = true;
	}
}

if(behaveChange)
{
if(backUpTimer = 0){spd = -0.25;}
backUpTimer ++;
if(backUpTimer >= backUpTimerMax)
{
	behaveChange = false;
	backUpTimer = 0;
	updateAngle = angleDir + irandom_range(-180,180); //here you wanna use the update angle thing
	spd = topSpd;
	
}

drilling = false;
}

//if we're digging

if(drilling)
{
	spd = slowSpd; //either that or reduce the speed significantly
	for(var i = 0; i < listLeng; i++)
	{
		if(instance_exists(drillArray[|i]))
		{
			if(drillArray[|i].drillable)
			{
				if(drillArray[|i].object_index = obj_ow_superheated_wall)
				{
				}
				else
				{
				drillArray[|i].HP -= drillDamage;
				}
			}
		}
	}
}
else
{
	if(behaveChange = false)
	{
	spd = topSpd;
	}
}

//go through and if HP = 0 do the thing that places it behind the borer
if(drilling)
{
for(var i = 0; i < listLeng; i++)
	{
		if(instance_exists(drillArray[|i] && drillArray[|i].HP <=0))
		{
			var xx = drillArray[|i].x + lengthdir_x(96,angleDir + 180); //where we're putting the tile
			var yy = drillArray[|i].y + lengthdir_y(96,angleDir + 180);
			var tileTarg = tilemap_get_at_pixel(global.Tiles_1,xx,yy); //targeted location
			if(tileTarg = 0)
			{
				var tileFrom = tilemap_get_at_pixel(global.Tiles_1,drillArray[|i].x,drillArray[|i].y);
				tilemap_set_at_pixel(global.Tiles_1,tileFrom,xx,yy);
			}
			tilemap_set_at_pixel(global.Tiles_1,0,drillArray[|i].x,drillArray[|i].y);
			instance_destroy(drillArray[|i]);
			tilerUpdate = true;
		}
	}
}


ds_list_clear(drillArray);
drilling = false;
if(tilerUpdate = true)
{
	obj_ow_auto_tile_dark.update = true;
}
tilerUpdate = false;