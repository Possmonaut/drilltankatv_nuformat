draw_sprite_ext(sp_bigassBlackBG,0, 0,0,1,1,0,c_white,1);

if(activeConvo && stor_complete = false) //&& we did the transition from screen to screen
{
	//draw_sprite_ext(sp_bigassBlackBG,0, 0,0,1,1,0,c_white,1);
	if(fade.forward && fade.COMPLETE)
	{fade.back = true;
		}
		
	if(!fade.forward && !fade.back && !fade.COMPLETE)
	{
		var readLength = string_length(varOpeningTextCrawl);
		var readString = "";
	
		for(var i = 1; i < charCount; i++)
		{
			readString += string_char_at(varOpeningTextCrawl,i);
			var checkTest = "";
		}
		
		if(pause < timer)
		{

			if(charCount = readLength)
			{
				stor_complete = true;
				activeConvo = false;
				spaceCheeck = true;
				//draw blink timer thingy
			}
			else
			{
				readString += blinkyCursor;
			}
	
			charCount += 0.5;
			if(!audio_is_playing(amb_trans_beep))
			{
				var _b = audio_play_sound(amb_trans_beep,1,false);
				audio_sound_gain(_b,0.01,0);
				var _r = random_range(1,1.1);
				audio_sound_pitch(_b,_r);
			}
			
			if(string_char_at(varOpeningTextCrawl,charCount) = "\n")
			{
				pause = timer + 60;
				charCount += 1;
			}
	
		}
	
	draw_text(128,128,readString);
	
	}
}


if(spaceCheeck)
{
	var text = "";
	text += varOpeningTextCrawl;
	blinkyTimer ++;
	keyHoldTimer ++;
	if(blinkyTimer > 60)
	{
		if(blinkyTimer > 120)
		{
			blinkyTimer = 0;
		}
		text = varOpeningTextCrawl + blinkyCursor;
	}
	draw_text(128,128,text);
	if(keyHoldTimer > 120)
	{
		var bum = display_get_gui_width() /2;
		draw_text(bum,768,"PRESS SPACE TO CONTINUE");
	}
	
}


if(activeConvo = true && stor_complete = true) //change this to basically go active after we go to the next room
{
	//draw_sprite_ext(sp_bigassBlackBG,0, 0,0,1,1,0,c_black,myAlpha);
		if(obj_save_boy.triggerList[|0] = false && loadTrig = false)
		{
			if(instance_exists(obj_ow_tutorial_controller))
			{
			obj_ow_tutorial_controller.fadeDone = true;
			}
			fade.back = true; //if adding the title crawl back in, delete this 
		}	//if adding the title crawl back in, delete this 
	
	
	
		if(loadTrig = true)
		{
			//if(obj_save_boy.triggerList[|2] != rm_new_demo)
			//{
			//	room_goto(obj_save_boy.triggerList[|2]);
			//}
			
			if(instance_exists(obj_ow_tutorial_controller))
				{
					obj_ow_tutorial_controller.fadeDone = true;
					obj_ow_tutorial_controller.descendAnim = true;
					obj_save_boy.loadTrigger = true;
					fade.back = true;
					
				}
			
			if(obj_ow_player_tank.tutComplete = true)
			{
				obj_ow_camera.x = obj_ow_player_tank.x;
				obj_ow_camera.y = obj_ow_player_tank.y;
				fade.back = true;
			}
			loadTrigger = false;
		}
		
		if(fade.COMPLETE = true)
		{
		fade.forward = false;
		fade.back = true;
		instance_destroy();
		audio_group_set_gain(soundEffects,global.audioGain,240);
		audio_stop_sound(openTheme);
		}	
}
//change this to not start fading until the elevator has confirmed done with it's dumb animations. then TP cam, then fade in
if(fade.back){titleSprite = false;}

if(titleSprite)
{
	myAlpha = 1;
	//draw_sprite_ext(sp_bigassBlackBG,0, 0,0,1,1,0,c_white,1);

	seisDrawY ++;

	draw_sprite_ext(sp_title_screen_seismograph,0,704+title_offsetW,64+title_offsetH-seisDrawY,1,1,0,c_white,1);
	draw_sprite_ext(sp_title_screen_seismograph,0,704+title_offsetW,64+title_offsetH-(seisDrawY)+640,1,1,0,c_white,1);

	if(seisDrawY >= seisDrawYMax)
	{
		seisDrawY = 0;
	}

	draw_sprite_ext(sp_title_screen_placeholder1_resize,0,0,0,1,1,0,c_white,myAlpha);
	draw_text_color(140+title_offsetW, 630+title_offsetH, varPressSpace, c_white,c_white,c_white,c_white,myAlpha);
	draw_text_color(140+title_offsetW, 690+title_offsetH, "To Start", c_white,c_white,c_white,c_white,myAlpha);
	draw_text_color(420+title_offsetW, 630+title_offsetH, "ESC to Exit", c_white,c_white,c_white,c_white,myAlpha);

	if(loadOp)
	{
	draw_text_color(420+title_offsetW, 690+title_offsetH, "f1 to load", c_white,c_white,c_white,c_white,myAlpha);
	}
	draw_text_color(128+title_offsetW, 736+title_offsetH, "DM feedback to @possmonaut on Twitter",c_white,c_white,c_white,c_white,myAlpha);

	buttonFlash ++;

	if(buttonFlash > 30)
	{buttonActive = !buttonActive;
		buttonFlash = 0;
		}

	if(buttonActive)
	{
		if(loadTrig)
		{
			draw_rectangle(833,845,1022,874,false);
		}

		if(activeConvo)
		{
			draw_rectangle(577,781,766,810,false);
			draw_rectangle(577,845,766,874,false);
		}
	}

	if(escHold)
	{
		draw_healthbar(833,781,1022,810,(escHoldTimer/180)*100,c_black,c_white,c_white,0,true,false);
	}

//draw_sprite_ext(sp_title_screen_placeholder1_trailer,0,0,0,1,1,0,c_white,myAlpha);
}

//staticTimer += staticGain;
//draw_sprite_ext(sp_tv_static,staticTimer,0,0,1,1,0,c_white,1);

if(fade.forward = false && fade.COMPLETE = true)
{
	//activeConvo = true
	//stor_complete = true;
}
