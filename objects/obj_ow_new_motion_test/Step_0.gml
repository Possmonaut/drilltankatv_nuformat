timer ++;

visualSpriteDrill.x = x+16;
visualSpriteDrill.y = y+16;



key_up = keyboard_check(vk_up);
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);

if(key_up)
{
if(velocity<5)velocity += acc;
}

if(rPause = false)
{
if(key_left)
	{
	angleDir+=2;
	visualSpriteDrill.image_angle +=2;
	if(angleDir = 0 || angleDir = 90 || angleDir = 180 || angleDir = 270){rPause = true; dirTimer = timer + 10;}
	}
	if(key_right)
	{
	angleDir-=2;
	visualSpriteDrill.image_angle -=2;
	if(angleDir = 0 || angleDir = 90 || angleDir = 180 || angleDir = 270){rPause = true; dirTimer = timer + 10;}
	}
}

if(rPause = true)
{
	if(dirTimer < timer){rPause = false;}
}


if(!key_up)
{
if(velocity>0)velocity -= acc;
}

if(angleDir > 360)
{angleDir = 0;}

if(angleDir < 0)
{angleDir = 360;}

collisionVeloX= cos(angleDir*2*pi/360)*velocity;
collisionVeloY= -sin(angleDir*2*pi/360)*velocity;

if(place_meeting(x + collisionVeloX, y, obj_ow_move_test_rock)){
	while(!place_meeting(x+ collisionVeloX,y,obj_ow_move_test_rock))
	{
		x+=collisionVeloX;
	}
	
	velocity = 0;
}

if(place_meeting(x, y + collisionVeloY, obj_ow_move_test_rock)){
	while(!place_meeting(x, y+collisionVeloY,obj_ow_move_test_rock))
	{
		y+=collisionVeloY;
	}
	
	//y-=sign(velocity);
	velocity = 0;
}

x+=cos(angleDir*2*pi/360)*velocity;
y+=-sin(angleDir*2*pi/360)*velocity;