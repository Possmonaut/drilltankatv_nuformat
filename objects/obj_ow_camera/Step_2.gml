#macro view view_camera[0]

if(room = rm_setup || room=rm_deadth_screen || room = rm_victory_1)
{
	exit;
}


var fScreen = keyboard_check_released(ord("P"));
var plusScrn = keyboard_check_released(ord("L"));
var minuScrn = keyboard_check_released(ord("K"));
var setTestReso = keyboard_check_released(ord("J"));

var windWMult = window_get_width() / (view_width * window_scale);
var windHMult = window_get_height() / (view_height * window_scale);

var scaledWidth = view_width * windWMult;
var scaledHeight = view_height * windHMult;

//remove me before release! 
if(plusScrn)
{
	view_width *= 2;
	view_height *= 2;
	alarm[0] = 1;
}

if(minuScrn)
{
	view_width *= 0.5;
	view_height *= 0.5;
	alarm[0] = 1;
}

if(fScreen)
{
	if(fScreenCheck = false)
	{
		fScreenCheck = true;
		window_set_fullscreen(true);
		alarm[0] =1;
	}
	else
	{
		fScreenCheck = false;
		window_set_fullscreen(false);
		alarm[0] =1;
	}
}

if(instance_exists(target))
{
	
	var _x = 0;
	var _y = 0;
	
	if(shake){
	guiShakeX = choose(-shakeForce,shakeForce);
	guiShakeY = choose(-shakeForce,shakeForce);
	if(centerShake = true)
	{
		//note: remove these majgic numbers and set them as IDEAL VIEW WIDTH / HEIGHT
	    _x += (target.x - view_width /2) - ((iWidth*0.5) - (view_width*0.5)) + guiShakeX;
	    _y += (target.y - view_height /2) - ((iHeight*0.5) - (view_height*0.5)) + guiShakeY;
	}
	else
	{
		_x += (target.x - view_width /2) - ((iWidth*0.5) - (view_width*0.5));
	    _y += (target.y - view_height /2) - ((iHeight*0.5) - (view_height*0.5));
	}
	shakeDur --;
	shakeForce -= shakeForceDecay;
	
	if(shakeDur < 0){shakeDur = 0;}
	if(shakeForce < 0){shakeForce = 0;}
    if(shakeDur <= 0){
        shake = false;
		shakeForce = 0;
    }
	gamepad_set_vibration(0, shakeForce*0.5, shakeForce*0.5);
}else{
	 _x = approach((target.x - view_width /2) - ((iWidth*0.5) - (view_width*0.5)),0,0.3);
	 _y = approach((target.y - view_height /2) - ((iHeight*0.5) - (view_height*0.5)),0,0.3);
	 guiShakeX = approach(0,0,0.3);
	 guiShakeY = approach(0,0,0.3);
}
	
	var stpX = camera_get_view_x(view);
	var stpY = camera_get_view_y(view);
	if(stopFollow)
	{
		camera_set_view_pos(view,stpX,stpY);
	}
	else
	{
		camera_set_view_pos(view,_x,_y);
	}
	stopFollow = false;
}