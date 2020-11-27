if(activeConvo = true && stor_complete = true) //change this to basically go active after we go to the next room
{
	//probably move the below to draw to GUI
draw_sprite_ext(sp_bigassBlackBG,0, 0,0,1,1,0,c_black,myAlpha);

	if(charCount < string_length(varOpeningTextCrawl))
	{
	charCount += 0.25;
	blinkyTimer = timer + 60;
	}
	else
	{
		if(blinkyTimer <= timer)
		{
			if(blinkyCursor = "")
			{
				blinkyCursor = "_";
				blinkyTimer = timer + 60;
			}
			else
			{
				blinkyCursor = "";
				blinkyTimer = timer + 60;
			}
		}
		draw_text_color(768, 520, varPressSpace, c_white,c_white,c_white,c_white,myAlpha);
		spaceCheeck = true;
	}
	
		textPart = string_copy(varOpeningTextCrawl,1,charCount) + blinkyCursor;
		draw_text_color(80,80,textPart, c_white,c_white,c_white,c_white,myAlpha);
		
		if(charCount < string_length(varOpeningTextCrawl) && random_magnitude)
		{
			keyHoldTimer ++;
			if(keyHoldTimer = 120)
			{
				fading = true;
			}
		}
		else
		{
			keyHoldTimer = 0;
		}

		if(spaceCheeck = true)
		{
			if(random_magnitude)
			{
				fading = true;
			}
		}

		if(fading = true)
		{
			myAlpha -= 0.01;
			if(myAlpha <= 0)
			{
				room_goto(rm_title_screen);
				instance_destroy(id);
			}
		}
}