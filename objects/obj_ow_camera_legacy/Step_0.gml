if(room != curRoom)
{
	view_camera[0] = camera;
	x = follow.x;
	y = follow.y;
	curRoom = room;
	xTo = follow.x;
	yTo = follow.y;
	camSpeed = 1;
}
else
{
	if(x = follow.x && y = follow.y)
	{
	camSpeed = 25;
	}
}

x += (xTo - x) / camSpeed;
y += (yTo - y) / camSpeed;

xTo = follow.x; //you can change follow to make the camera move to different objects
yTo = follow.y;

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);

if(shake){
    shakeDur --;
    x += choose(-shakeForce,shakeForce);
    y += choose(-shakeForce,shakeForce);
    if(shakeDur <= 0){
        shake = false;
		if(shakeForce > 1){shakeForce --;}
        shakeDur = 5;
    }
}else{
    x = approach(x,0,0.3);
    y = approach(y,0,0.3);
}

/*
if(keyboard_check_released(ord("M")))
{
	shake = true;
}
*/