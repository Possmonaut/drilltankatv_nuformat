if(instance_exists(obj_ow_tutorial_controller))
{
	if(obj_ow_tutorial_controller.fadeDone = false)
	{
		exit;
	}
}


x=target.x;
y=target.y;

timer ++;

escKey = keyboard_check_released(vk_escape);
escKeyHold = keyboard_check(vk_escape);


//draw_text_color(72, 50, fps,c_red,c_red,c_red,c_red,1);
//draw_text_color(72, 80, fps_real,c_red,c_red,c_red,c_red,1);

//clean this below bit up
//draw_set_color(c_black);
//draw_button(64, 0, 1023, 128, 1);
//draw_set_color(c_white);

//camera veiwport size: 1024 x 768

//you'll need to change some of the variables here to have the bar smoothly move / down when the value shifts in the main object
/*
var accelDecel = obj_ow_player_tank.velocity;
var drillAccel = obj_ow_player_tank.drillStopTimer;
if(overHeating != true){var drillHeat = obj_ow_player_tank.drillHeat;}
else{var drillHeat = 0;}
var topSpeed = 3; //change this later to read from the tank

if(accelDecel < 0){ accelDecel *= -1;}

if(obj_ow_player_tank.drilling = true){drillAccel += irandom_range(-30, 20)}
if(drillAccel >= 60){drillAccel = 60;}

if(targetAccel < accelDecel){targetAccel += 0.025;}
if(targetAccel > accelDecel){targetAccel -= 0.025;}

if(targetDrillAccel < drillAccel){targetDrillAccel += 1;}
if(targetDrillAccel > drillAccel){targetDrillAccel -= 1;}


//the below chunk flashes the heat bar if we're overheating
/*
if(drillHeat >= 75 && overHeating = false && heatTimer <= timer)
{overHeating = true; drillHeat = 0; 
	draw_text_ext(1000, 232, "W A R N I N G !!! O V E R H E A T I N G !!!", 20, 30);
	heatTimer = timer + 20;
	}

if(overHeating = true)
{ 
	if(heatTimer <= timer)
	{	
		overHeating = false;
		drillHeat = obj_ow_player_tank.drillHeat;
		
		heatTimer = timer + 20;
	}
}



//left side

draw_set_color(c_black);
draw_button(0, 0, 64, 767, 1);
draw_set_color(c_white);
//accel / decel
draw_healthbar(10, 50, 20, 653, (targetAccel / topSpeed) * 100, c_black, c_white, c_white, 3, 1, 1);
//drill accel / decel
draw_healthbar(25, 50, 35, 653 , (targetDrillAccel / 60) * 100, c_black, c_white, c_white, 3, 1, 1);

draw_text(3,669,"over \nride");
draw_circle(32,742,20,true);

if(target.override = true)
{
	draw_circle(32,742,20,false);
}

//draw_healthbar(40, 50, 55, 717, (drillHeat / 100) * 100, c_black, c_white, c_white, 3, 1, 1);

//display the below on left side if above or below a certain threshhold
if(target.forwardSpeed >= 2 && (keyboard_check(vk_right) || (keyboard_check(vk_left))))
{
	draw_text(74, 32, "WARNING: REDUCE SPEED!");
}

//if(target.drillHeat > 74){
//	draw_text(74, 48, "WARNING: OVERHEATING");
//}

//right side
draw_set_color(c_black);
draw_button(960, 0, 1024, 767, 1);
draw_set_color(c_white);

draw_text_transformed(964, 16, "Hull: ", 1, 1, 0);// need to make this bigger
draw_text_transformed(972, 32, string(round(target.HP)), 1.5, 1.5, 0);

draw_text(964, 72, "Gear: ");
draw_text(980, 88, string(round(target.velocity)));

draw_text(964, 112, "$$$: ");
draw_text(980, 128, string(target.paycheck));

draw_text(964, 152, "Ore:");
draw_text(980, 168, string(target.ore));

draw_text(964, 192, "Bomb:");
draw_text(980, 208, string(target.bombs));

if(target.velocity > 3 && speedAlertTimer <= timer){ //for turbo
	if(speedFlash = true)
	{
		speedFlash = false;
	}
	else
	{
		speedFlash = true;
	}
	speedAlertTimer = timer + 20;
}

//if(speedFlash = true && target.velocity > 2)
//{draw_text_ext(976, 192, "W A R N I N G !! R E D U C E !! S P E E D !!", 20, 30);}

if(target.drillHeat > target.safeTemp && heatAlertTimer <= timer){
		if(heatFlash = true)
	{
		heatFlash = false;
	}
	else
	{
		heatFlash = true;
	}
	
	if(target.drillHeat > target.overTemp)
	{
		heatAlertTimer = timer + 10;
	}
	else
	{
		heatAlertTimer = timer + 20;
	}
}
else
{
	heatFlash = false;	
}

//if(heatFlash = true && target.drillHeat > 74){
//	draw_text_ext(1004, 192, "W A R N I N G !! O V E R H E A T I N G !!", 20, 30);
//}

if(heatFlash = false) //healthbar is 469 in size
{
draw_healthbar(964, 248, 1020, 717, (drillHeat / 100) * 100, c_black, c_black, c_white, 3, 1, 1);
}
else
{
draw_healthbar(964, 248, 1020, 717, (drillHeat / 100) * 100, c_black, c_black, c_black, 3, 1, 1);
}

draw_line(964,389,1020,389); //overheat
draw_text(964,397,"OVER \nHEAT");
draw_line(964,295,1020,295); //meltdown
draw_text(964,303,"MELT \nDOWN");

draw_text(964, 736, "HEAT");
draw_text(964, 704, drillHeat);
*/


///////<<<<<<<<<<<<<<<<<<<<< esc menu, fix this later 

/*
draw_rectangle_color(escTabOffset,esc_menuH - escTab_H,escTabOffset + escTab_H,esc_menuH,c_black,c_black,c_black,c_black,false);
draw_rectangle(escTabOffset,esc_menuH - escTab_H,escTabOffset + escTab_H,esc_menuH,true);
draw_text(escTabOffset,esc_menuH - escTab_H, "esc");
*/

//1024, 768

//this is for the esc menu

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
	draw_rectangle_color(0,panelY,esc_menuW,esc_menuH,c_black,c_black,c_black,c_black,false);
	draw_rectangle(0,panelY,esc_menuW,esc_menuH,true);
	draw_text(74, panelY + 64, "l/r = rotate, up/down = accel / decel, x = stop, space = DRILL!");
	draw_text(74, panelY + 96, "R = Radar");
	draw_text(74, panelY + 128, "F = Demo Charge");
	draw_text(74, panelY + 160, "M = Radar Map");
	draw_text(74, panelY + 192, "O = Over Ride");
	draw_text(74, panelY + 256, "Hold ESC to exit");
	draw_text(74, panelY + 288, "Goal: \n Bore through the walls of the cavern system to try and find \n an escape route");
	//hold esc to close game
	//if esc_key_hold = true && esc_key_hold_timer <= timer
	//close game 
	if(escKeyHold)
	{
		escKeyTimer ++;
		//add a little filling bar here
		draw_rectangle_color(74,panelY + 248,74 + escKeyTimer*2,panelY + 288,c_white,c_white,c_white,c_white,false);
		draw_rectangle_color(74,panelY + 248,74 + 240,panelY + 288,c_white,c_white,c_white,c_white,true);
		if(escKeyTimer = 120)
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
	draw_rectangle_color(0,panelY,esc_menuW,esc_menuH,c_black,c_black,c_black,c_black,false);
	draw_rectangle(0,panelY,esc_menuW,esc_menuH,true);
	draw_text(74, panelY + 64, "l/r = rotate, up/down = accel / decel, x = stop, space = DRILL!");
	draw_text(74, panelY + 96, "R = Radar");
	draw_text(74, panelY + 128, "F = Demo Charge");
	draw_text(74, panelY + 160, "M = Radar Map");
	draw_text(74, panelY + 192, "O = Over Ride");
	draw_text(74, panelY + 256, "Hold ESC to exit");
	draw_text(74, panelY + 288, "Goal: \n Bore through the walls of the cavern system to try and find \n an escape route");
	}
}

	
