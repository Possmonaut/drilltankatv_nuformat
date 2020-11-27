onBoard = position_meeting(target.bbox_left, target.bbox_top, obj_ow_elevator);
onBoard = position_meeting(target.bbox_right, target.bbox_top, obj_ow_elevator);
onBoard = position_meeting(target.bbox_left, target.bbox_bottom, obj_ow_elevator);
onBoard = position_meeting(target.bbox_right, target.bbox_bottom, obj_ow_elevator);

if(onBoard)
{
	target.visualSpriteTank.depth = depth - 2;
	target.visualSpriteDrill.depth = depth -3;
	target.visualSpriteTank.treadLeft.depth = -1;
	target.visualSpriteTank.treadRight.depth = -1;
}

shakeTimer ++;
if(onBoard && target.controlPause = true && shakeTimer >= shakeInterval)
{
	sc_shake_call(1,5,true);
	shakeTimer = 0;
}

if(!instance_exists(obj_ow_tutorial_controller)) //for testing DARK
{
	if(image_index < 7 && ascend = false)
	{
		image_index += 0.1;
		target.controlPause = true;
	}
	else
	{
		if(crashTrig)
		{
			crashTrig = false;
			obj_ow_camera.shake  =true;
			obj_ow_camera.shakeDur = 10;
			target.controlPause = false;
		}
		
		
		if(!onBoard && point_distance(x+172,y+172,target.x,target.y) > 302)
		{
			ascend = true;
			//kill colliders in contact with sqaure bbox 
		}
		
		if(ascend)
		{
			
			if(depth_reset = true)
			{
				target.depth = 500;
				target.visualSpriteTank.depth = target.depth - 1;
				target.visualSpriteDrill.depth = target.depth -2;;
				target.visualSpriteTank.treadLeft.depth = target.depth;
				target.visualSpriteTank.treadRight.depth = target.depth;
				depth_reset = false;
			}
			
			
			if(image_index != 0)
			{
				image_index -= 0.1;
			}
			
			if(image_index = 0.9)
			{
				for(var i = 0; i < 11; i++)
				{
					for(var o = 0; o < 11; o++)
					{
						tilemap_set_at_pixel(global.Tiles_1,0,(32*i) + targetX,(32*o)+targetY);
					}
				}
				
				collision_rectangle_list(targetX,targetY,targetX+sprite_width,targetY+sprite_height,obj_ow_nopass_block,false,true,colliders,false);
				for(var p = 0; p < ds_list_size(colliders);p++)
				{
					instance_destroy(colliders[|p]);
				}
				
			}

			
			
			
			if(image_index = 0)
			{
				y -= descendSpeed;
				if(y <= elevatorY)
				{
					ds_list_destroy(colliders);
					instance_destroy();
				}
			}
		}
	}
}