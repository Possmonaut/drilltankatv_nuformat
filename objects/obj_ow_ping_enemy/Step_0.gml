timer ++;

if(activated)
{
	fadeVal -= 0.005;
	image_alpha = 0.4 + fadeVal;
}

if(image_alpha <= 0 && activated)
{
	instance_destroy();
}

if(timer > 300)
{
	instance_destroy();
}