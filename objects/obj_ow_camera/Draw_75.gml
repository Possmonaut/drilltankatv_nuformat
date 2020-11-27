if(room = rm_setup|| room=rm_deadth_screen || room = rm_victory_1)
{
	exit;
}


if(instance_exists(obj_ow_tutorial_controller))
{
	if(obj_ow_tutorial_controller.fadeDone = false)
	{
		exit;
	}
}

//draw_sprite_ext(sp_bigassBlackBG,0,0,0,2,2,0,c_black,0.5);

x=target.x;
y=target.y;

timer ++;
/*
escKey = keyboard_check_released(vk_escape);
escKeyHold = keyboard_check(vk_escape);

if(escKey)
{
 if(panelOpen == true)
 {panelOpen = false;}
 else
 {panelOpen = true;}
}

if(panelOpen = true)
{
	if(panelY != panelMaxY)
		{	
		panelY += (panelMaxY - panelY) / slideSpeed;
		//escTabY = panelY - 32;
		//escTabY2 = panelY;
		}
	draw_rectangle_color(1,panelY,esc_menuW,esc_menuH,c_black,c_black,c_black,c_black,false);
	draw_rectangle(1,panelY,esc_menuW,esc_menuH,true);
	draw_text(74, panelY + 64, "Left / Right = Rotate Left or Right");
	draw_text(74, panelY + 96, "Up = Accelerate forwards");
	draw_text(74, panelY + 128, "Down = Accelerate backwards");
	draw_text(74, panelY + 160, "Space = Drill / Dock at Depot");
	draw_text(74, panelY + 192, "F = Launch Demo Charge / Trigger Demo Charge");
	draw_text(74, panelY + 224, "V = Vent Heat");
	draw_text(74, panelY + 256, "X = Emergency Brake");
	draw_text(74, panelY + 288, "Hold ESC to exit");
	draw_text(74, panelY + 320, "O = Override (disable heat shut off in favor of manual heat venting)");
	draw_text(74, panelY + 384, "M = Radar Map");
	draw_text(74, panelY + 416, "R = Radar Toggle");
	draw_text(74, panelY + 448, "T = Toggle Transponder");
	draw_text(74, panelY + 480, "f8 / f9 = Volume down / volume up");
	
	//hold esc to close game
	//if esc_key_hold = true && esc_key_hold_timer <= timer
	//close game 
	if(escKeyHold)
	{
		escKeyTimer ++;
		//add a little filling bar here
		draw_rectangle_color(74,panelY + 280,74 + escKeyTimer*2,panelY + 320,c_white,c_white,c_white,c_white,false);
		draw_rectangle_color(74,panelY + 280,74 + 360,panelY + 320,c_white,c_white,c_white,c_white,true);
		draw_text_color(74,panelY + 288,"exiting...",c_black,c_black,c_black,c_black,1);
		if(escKeyTimer = 180)
		{
		game_end();
		}
	}
	else
	{
		escKeyTimer = 0;
	}
}
else
{
	if(panelY != esc_menuH)
	{
	panelY += (esc_menuH - panelY) / slideSpeed;
	//escTabY = panelY - 32;
	//escTabY2 = panelY;
	draw_rectangle_color(1,panelY,esc_menuW,esc_menuH,c_black,c_black,c_black,c_black,false);
	draw_rectangle(1,panelY,esc_menuW,esc_menuH,true);
	draw_text(74, panelY + 64, "Left / Right = Rotate Left or Right");
	draw_text(74, panelY + 96, "Up = Accelerate forwards");
	draw_text(74, panelY + 128, "Down = Accelerate backwards");
	draw_text(74, panelY + 160, "Space = Drill / Dock at Depot");
	draw_text(74, panelY + 192, "F = Launch Demo Charge / Trigger Demo Charge");
	draw_text(74, panelY + 224, "V = Vent Heat");
	draw_text(74, panelY + 256, "X = Emergency Brake");
	draw_text(74, panelY + 288, "Hold ESC to exit");
	draw_text(74, panelY + 320, "O = Override (disable heat shut off in favor of manual heat venting)");
	draw_text(74, panelY + 384, "M = Radar Map");
	draw_text(74, panelY + 416, "R = Radar Toggle");
	draw_text(74, panelY + 448, "T = Toggle Transponder");
	draw_text(74, panelY + 480, "f8 / f9 = Volume down / volume up");
	}
}
*/

centerShake = false;