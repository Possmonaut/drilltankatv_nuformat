if(activated && reset != true)
{
	fadeVal = fadeReset;
	reset = true;
}

if(activated)
{
	fadeVal += 0.005;
	image_alpha = fadeVal;
}

if(image_alpha >= 1 && activated)
{
	activated = false;
	image_alpha = 1;
	reset = false;
}
