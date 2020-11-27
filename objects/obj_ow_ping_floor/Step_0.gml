//timer ++;
if(sprite_index = sp_ore_ping_block)
{
	depth = -2;
}

if(activated)
{
	fadeVal += 0.005;
	image_alpha = fadeVal;
}

if(image_alpha >=1 && activated)
{
	activated = false;
	fadeVal = 0.15;
}

if(forceActivate)
{
	fadeVal = 0.15;
	image_alpha = fadeVal;
	forceActivate = false;
	activated = true;
}
