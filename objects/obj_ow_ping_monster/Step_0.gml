//timer ++;

if(activated)
{
	fadeVal -= 0.005;
	image_alpha = fadeVal;
}

if(image_alpha <= 0 && activated)
{
	activated = false;
	fadeVal = 0.85;
}

if(forceActivate)
{
	fadeVal = 0.85;
	image_alpha = fadeVal;
	forceActivate = false;
	activated = true;
}
