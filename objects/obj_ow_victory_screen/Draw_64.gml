//

/*
hold on white for a bit while the theme plays in
fade from white via a scrolling gradient
show the end screen
end blurb
end data scroll on
thanks for playing!
press space to return to main menu
fade out, then run main menu

give players the option to skip by pressing space (state = DONE, then space again = goto main menu)
*/

/*
if(myAlpha <= 1 && swapTimer = 0)
{
	myAlpha += 0.01;
}
*/

var midWX = window_get_width() * 0.5;
var midWY = window_get_height() * 0.5;
var midSX = sprite_get_width(sp_dead_screen) * 0.5;
var midSY = sprite_get_height(sp_dead_screen) * 0.5;

var posX = midWX - midSX;
var posY = midWY - midSY;

/*
draw_sprite_ext(spriteList[currSp],0,posX,posY,4,4,0,c_white,myAlpha);
if(currSp = spriteNum)
{
draw_text_color(posX, posY + 520, "press space to return to the main menu", c_white,c_white,c_white,c_white,myAlpha);
}
*/

if(keyboard_check_released(vk_space))
{
	if(skip = false)
	{
	skip = true;
	timer = mainMenuTime;
	}
}

animTotal += animSpeed;

draw_sprite_ext(sp_vict_animate_resize,animTotal,0,0,1,1,0,c_white,1);

if(whiteY < 1080) 
{whiteY += 0.5;}
if(skip)
{whiteY += 1.5;}

draw_sprite_ext(sp_vict_white_screen,0,0,whiteY,7.5,7.5,0,c_white,1);

if(whiteY > 440 || skip)
{
	//start reading end blurb 
	//type out ESCAPE for now 
	
		var readLength = string_length(escapeText)+1;
		if(skip){blurbCount = readLength;}
		
		if(blurbCount != readLength)
		{
			blurbStTimer ++;
			if(blurbStTimer > 20)
			{
				blurbStTimer = 0;
				blurbCount ++;
			}
		}
	
	
		var readString = "";
	
		for(var i = 1; i < blurbCount; i++)
		{
			readString += string_char_at(escapeText,i);
		}
	
	draw_set_font(pixelette84);
	
		draw_text_transformed_color(250,122,readString,1.05,1.05,0,c_black,c_black,c_black,c_black,1); //6.2
		draw_text_transformed(256,128,readString,1,1,0); //6
}

if(whiteY > 879 || skip)
{

		var readLength = string_length(dataText)+1;
		if(skip){dataCount = readLength;}
		if(dataCount != readLength)
		{
			dataCount += 0.5;
		}
	
		var readString = "";
	
		for(var i = 1; i < floor(dataCount); i++)
		{
			readString += string_char_at(dataText,i);
		}
	
		draw_set_font(pixelette32);
		draw_text_transformed_color(122,394,readString,1.01,1.01,0,c_black,c_black,c_black,c_black,1);
		draw_text_transformed(128,400,readString,1,1,0);
	
}

if(timer > thankTime)
{
	//read thankTime
		
		
		var readLength = string_length(thankText)+1;
	
		if(skip){thankCount = readLength;}
		if(thankCount != readLength)
		{
			blurbStTimer ++;
			if(blurbStTimer > 10)
			{
				blurbStTimer = 0;
				thankCount ++;
			}
		}
	
	
		var readString = "";
	
		for(var i = 1; i < thankCount; i++)
		{
			readString += string_char_at(thankText,i);
		}
	
		draw_text_transformed_color(122,944,readString,1.05,1.05,0,c_black,c_black,c_black,c_black,1);
		draw_text_transformed(128,950,readString,1,1,0);
	
		//or if button pressed, read it all out 
}

if(timer > mainMenuTime) //or other variable gets tripped
{
	draw_set_font(pixelette16);
	draw_text_transformed_color(122,994,"press space to return to the main menu",1.05,1.05,0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(128, 1000, "press space to return to the main menu",1,1,0,c_white,c_white,c_white,c_white,1);

	//if(swapTimer = 0 && myAlpha = 0)
	//{
		if(keyboard_check(vk_space))
		{
			menu = true;
			swapTimer ++;
		}
	//}

	if(swapTimer > 0)
	{	audio_sound_gain(myAud,0,1500);
		if(myAudC != -1)
		{
		audio_sound_gain(myAudC,0,1500);
		}
		draw_sprite_ext(sp_bigassWhiteBG,0,0,0,1,1,0,c_white,myAlpha);
		swapTimer ++;
		myAlpha += 0.005;
		if(myAlpha = 1 && menu)
		{	
			if(menu)
			{
				if(instance_exists(obj_ow_camera))
				{
				instance_destroy(obj_ow_camera);
				instance_destroy(obj_save_boy);
				instance_destroy(obj_ow_particle_handler);
				instance_destroy(obj_ow_fade_handler);
				instance_destroy(o_display_manager);
				instance_destroy(obj_ow_transponder_controller_temp);
				instance_destroy(obj_audio_controlboy);
				}
			draw_set_font(pixelette10);
			audio_stop_sound(myAud);
			if(myAudC != -1)
			{
			audio_stop_sound(myAudC);
			}
			room_goto(rm_setup);
			instance_destroy(id);
			}
		}
	}

}
