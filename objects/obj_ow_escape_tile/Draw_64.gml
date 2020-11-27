if(global.endSequence = true)
{
	if(myAlpha <= 1 && stage1 = false)
	{
	draw_sprite_ext(sp_bigassWhiteBG,0,0,0,1,1,0,c_white,myAlpha)
	myAlpha += 0.005;
	if(myAlpha >= 1)
		{
		stage1 = true;
		}
	}
	
	if(stage1 = true)
	{
	draw_sprite_ext(sp_bigassBlackBG,0,0,0,1,1,0,c_white,1)
	draw_sprite_ext(sp_bigassWhiteBG,0,0,0,1,1,0,c_white,myAlpha)
	myAlpha -= 0.005;
	if(myAlpha = 0)
		{
		room_goto(rm_vinctorny_screen);
		}
	}
	
	
}