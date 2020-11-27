for(var i = 0; i < 250; i ++)
{
	for(var o = 0; o < 250; o ++)
	{
		var img = sc_autotile_image_16_lava(i*32,o*32);
		tilemap_set(bg_lava,img,i,o);
	
		tilemap_set(bg_gravel, irandom_range(1,48), i, o);
		
		if( i = 249 && o = 249)
		{
		filled = true;
		}
	}
}

if(filled = true)
{
	instance_destroy();
}