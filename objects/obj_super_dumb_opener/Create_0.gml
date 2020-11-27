depth = -1000;
fade_alpha = 1;
if(variable_global_exists("opener"))
{
	if(!global.opener)
	{
	instance_create_depth(x,y,depth,obj_super_dumb_fader);
	instance_destroy();
	}
}
else
{
global.opener = true;
}
titleOpener = false;
openerTimer = 0;
otrigger1 = true;
alarm[0] = 2;
fSpeed = 0.0075;