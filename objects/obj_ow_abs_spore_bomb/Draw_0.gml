draw_self();

if(detonate)
{
	
	depth = shiftDepth;
	if(image_index < sprite_get_number(ctank_web))
	{
		image_index += frameGain;
	}
	if(timer > lifeTime -120)
	{
		image_alpha -= alphaLoss;
		image_xscale -= alphaLoss * 2;
		image_yscale -= alphaLoss * 2;
		slowDist -= alphaLoss * 72;
	}
}
else
{
	image_index = 0;
}