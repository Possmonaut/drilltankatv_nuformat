if(room = rm_setup|| room=rm_deadth_screen || room = rm_victory_1)
{
	exit;
}


var _x = camera_get_view_x(view);
var _y = camera_get_view_y(view);

var cSkX = 0;
var cSkY = 0;

if(centerShake = true)
{
	var cSkX = guiShakeX;
	var cSkY = guiShakeY;
}

draw_sprite(sp_gui_cover_1080_center_stable,0,_x+cSkX,_y+cSkY);
draw_sprite_ext(sp_center_circle_rotator,0,_x+960+guiShakeX,_y+540+guiShakeY,1,1,target.angleDir,c_white,1); //rotator; trigger to tank angle

if(target.colliderDrill.jammed = true){
	jamTimer++;
	if(jamTimer > jamTime)
	{
		jamTimer = 0;
		jamFlash = !jamFlash;
	}
	if(jamFlash)
	{
		var _b = string_width("DRILL JAMMED");
		var _n = string_height("DRILL JAMMED");
		//draw_set_color(c_white);
		draw_rectangle(_x+377+cSkX,_y+791+cSkY,_x+389+(_b*1.75)+cSkX,_y+803+_n+cSkY,false);
		draw_text_transformed_color(_x+383+cSkX,_y+791+cSkY,"DRILL JAMMED",1.75,1.75,0,c_black,c_black,c_black,c_black,1);
	}
	
	}
	
	//HUD doodads
if(target.heatShutdown = false){draw_text(_x+383+cSkX,_y+833+cSkY,"reactor shielded");}
if(target.heatShutdown = true && target.drillHeat <= 20){draw_text(_x+383+cSkX,_y+833+cSkY,"vents closing...");}
if(target.heatShutdown = true && target.drillHeat > 20){draw_text(_x+383+cSkX,_y+833+cSkY,"vents open");}

if(saveAlpha > 0){
	draw_sprite_ext(sp_saveboy,0,_x+1253+cSkX,_y+897+cSkY,1,1,0,c_white,saveAlpha);
	draw_text_color(_x+1200+cSkX,_y+930+cSkY,"data saved...",c_white,c_white,c_white,c_white,saveAlpha);
	saveAlpha -= 0.001;
}

if(volAlpha > 0)
{
	var txt = "";
	if(volGain)
	{txt = "vol -";}
	else
	{txt = "vol +";}
	draw_text_color(_x+417+cSkX,_y+531+cSkY,txt,c_white,c_white,c_white,c_white,volAlpha);
	volAlpha -= 0.025;
}

if(instance_exists(obj_ow_test_radar_mapper_d2))
{
	var radarDir = obj_ow_test_radar_mapper_d2.rotateDir;
	
	if(radarDir = 0)
	{
		radarPosGain *= -1;
	}
	
	var position = 0;
	if(radarPosGain = -1)
	{position = (radarDir/360) *100}
	else
	{position = 100 - ((radarDir/360) *100)}
	if(obj_ow_test_radar_mapper_d2.keypress = false)
	{position = 1;}
	
	draw_healthbar(_x+383+cSkX,_y+921+cSkY,_x+583+cSkX,_y+953+cSkY,position,c_black,c_white,c_white,0,true,true);
}

draw_healthbar(_x+477+cSkX,_y+180+cSkY,_x+633+cSkX,_y+196+cSkY,target.velocity * 100,c_black,c_white,c_white,0,true,false);
draw_healthbar(_x+477+cSkX,_y+212+cSkY,_x+593+cSkX,_y+228+cSkY,abs(target.angleAccel) * 100,c_black,c_white,c_white,0,true,false);
dotTimer ++;
var dotNum = floor(dotTimer / 100);
if(dotTimer > 398){dotTimer = 0;}
for(var o = 0; o < dotNum; o++)
{
	draw_sprite(sp_very_nice_circle,0,_x+477+cSkX+(o*32),_y+260+cSkY);
}


draw_healthbar(_x+1200+cSkX,_y+980+cSkY,_x+1450+cSkX,_y+996+cSkY,(target.drillStopTimer*0.0166) * 100,c_black,c_white,c_white,1,true,false);


var tDoshStr = "";
tDoshStr = string_format(target.paycheck,5,0);
tDoshStr = string_replace_all(string(tDoshStr)," ","0");

var tOreStr = "";
tOreStr = string_format(target.ore*100,4,0);
tOreStr = string_replace_all(string(tOreStr)," ","0");

draw_text_transformed(_x+383+cSkX,_y+865+cSkY, "$$$: " + tDoshStr,1,1,0); //cash
draw_text_transformed(_x+383+cSkX,_y+897+cSkY, "ORE: " + tOreStr + " KG",1,1,0); // ore

if(instance_exists(obj_ow_player_tank))
{
	if(obj_ow_player_tank.controlBool = 0)
	{
	escKey = keyboard_check_released(vk_escape);
	escKeyHold = keyboard_check(vk_escape);
	}
	else
	{
				if(gamepad_button_check_released(0,gp_start)){
				escKey = true;}
				else
				{escKey = false;}
				
				if(gamepad_button_check(0,gp_start)){
				escKeyHold = true;}
				else{escKeyHold = false;}
	}
}

if(escKey)
{
 if(panelOpen == true)
 {panelOpen = false;}
 else
 {panelOpen = true;}
}

var borderx1 = _x+cSkX+378;
var borderx2 = _x+cSkX+1537;
var bordery1 = _y+cSkY+panelY;
var bordery2 = _y+cSkY+1001;
var panx = borderx1+74+32;
var pany = _y+cSkY+64+panelY;
var panMaxY = 72;
draw_set_font(pixelette14);

if(panelOpen = true)
{
	if(panelY != panMaxY)
		{	
		panelY += (panMaxY - panelY) / slideSpeed;
		//escTabY = panelY - 32;
		//escTabY2 = panelY;
		//panelY = panMaxY;
		}
		
		
		
	draw_rectangle_color(borderx1,bordery1,borderx2,bordery2,c_black,c_black,c_black,c_black,false);
	draw_rectangle(borderx1,bordery1,borderx2,bordery2,true);
	draw_text(panx, pany + 64, "Left / Right = Rotate Left or Right");
	draw_text(panx, pany + 96, "Up = Accelerate forwards");
	draw_text(panx, pany + 128, "Down = Accelerate backwards");
	draw_text(panx, pany + 160, "Space = Drill / Dock at Depot");
	draw_text(panx, pany + 192, "F = Launch Demo Charge / Trigger Demo Charge");
	draw_text(panx, pany + 224, "V = Vent Heat");
	draw_text(panx, pany + 256, "X = Emergency Brake");
	draw_text(panx, pany + 288, "Hold ESC to exit");
	draw_text(panx, pany + 320, "O = Override (disable heat shut off in favor of manual heat venting)");
	draw_text(panx, pany + 384, "M = Radar Map");
	draw_text(panx, pany + 416, "R = Radar Toggle");
	draw_text(panx, pany + 448, "T = Toggle Transponder");
	draw_text(panx, pany + 480, "f8 / f9 = Volume down / volume up");
	
	//hold esc to close game
	//if esc_key_hold = true && esc_key_hold_timer <= timer
	//close game 
	if(escKeyHold)
	{
		escKeyTimer ++;
		//add a little filling bar here
		draw_rectangle_color(panx,pany + 280,panx + escKeyTimer*2,pany + 320,c_white,c_white,c_white,c_white,false);
		draw_rectangle_color(panx,pany + 280,panx + 360,pany + 320,c_white,c_white,c_white,c_white,true);
		draw_text_color(panx,pany + 288,"exiting...",c_black,c_black,c_black,c_black,1);
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
	if(panelY < 1000)
	{
	panelY += (1001 - panelY) / slideSpeed;
	//escTabY = panelY - 32;
	//escTabY2 = panelY;
	//panelY = bordery2;
	
	draw_rectangle_color(borderx1,bordery1,borderx2,bordery2,c_black,c_black,c_black,c_black,false);
	draw_rectangle(borderx1,bordery1,borderx2,bordery2,true);
	draw_text(panx, pany + 64, "Left / Right = Rotate Left or Right");
	draw_text(panx, pany + 96, "Up = Accelerate forwards");
	draw_text(panx, pany + 128, "Down = Accelerate backwards");
	draw_text(panx, pany + 160, "Space = Drill / Dock at Depot");
	draw_text(panx, pany + 192, "F = Launch Demo Charge / Trigger Demo Charge");
	draw_text(panx, pany + 224, "V = Vent Heat");
	draw_text(panx, pany + 256, "X = Emergency Brake");
	draw_text(panx, pany + 288, "Hold ESC to exit");
	draw_text(panx, pany + 320, "O = Override (disable heat shut off in favor of manual heat venting)");
	draw_text(panx, pany + 384, "M = Radar Map");
	draw_text(panx, pany + 416, "R = Radar Toggle");
	draw_text(panx, pany + 448, "T = Toggle Transponder");
	draw_text(panx, pany + 480, "f8 / f9 = Volume down / volume up");
	}
}

draw_set_font(pixelette16);