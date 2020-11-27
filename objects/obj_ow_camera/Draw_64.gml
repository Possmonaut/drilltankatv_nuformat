if(room = rm_setup || room=rm_deadth_screen || room = rm_victory_1)
{
	exit;
}



var cSkX = 0;
var cSkY = 0;

if(centerShake = true)
{
	var cSkX = guiShakeX;
	var cSkY = guiShakeY;
}



var windWMult = window_get_width() / (view_width * window_scale);
var windHMult = window_get_height() / (view_height * window_scale);

var scaledWidth = view_width * windWMult;
var scaledHeight = view_height * windHMult;

draw_healthbar(44,225,227,947,target.drillHeat,c_black,c_white,c_white,3,true,false); //heat meter //changed from black / black / gray
//draw position would be drillheat/100 * bar length * 0.5
//scale would just be drilheat / 100

draw_line_width_color(44, 227+10*7.22,225,227+10*7.22,5,c_black,c_black);//110 %
draw_line_width_color(44, 227+20*7.22,225,227+20*7.22,5,c_black,c_black); //100% line
draw_line_width_color(44, 227+40*7.22,225,227+40*7.22,3,c_black,c_black);//80%
draw_line_width_color(44, 227+60*7.22,225,227+60*7.22,2,c_black,c_black);//60%

var tHeat = target.drillHeat * 7.22;
draw_text_color(84+guiShakeX,clamp(907-tHeat,265,907)+guiShakeY,string(round(target.drillHeat * 1.2)) + "%",c_white,c_white,c_white,c_white,1); //heat percent

draw_rectangle_color(146,810,500,1010,c_black,c_black,c_black,c_black,false);
draw_text_transformed(156+guiShakeX,910+guiShakeY, string(round(364 + 2*target.drillHeat)) + "C",0.8,0.8,0); //heat temp

draw_rectangle_color(1623,164,1905,320,c_black,c_black,c_black,c_black,false);

var tBombStr = "";
tBombStr = string_format(target.bombs,2,0);
tBombStr = string_replace_all(string(tBombStr)," ","0");

draw_text_transformed(1666+guiShakeX,170+guiShakeY,tBombStr,5,5,3);
draw_text_transformed(1816+guiShakeX,230+guiShakeY,"/" + string(target.bombMax),1.5,1.5,3);


if(!instance_exists(obj_OLDTVFilter_Composite))
{
	//instance_create_depth(x,y,depth,obj_OLDTVFilter_Composite);
}

	global.static_offset += 0.001;
	if(global.static_offset > 1)
	{
		global.static_offset = 0;
	}


script_execute( scr_OLDTVFilter_Draw );

var _p = keyboard_check_released(vk_f10);
if(_p)
{debugToggle = !debugToggle;}
if(debugToggle)
{
	exit;
}

draw_sprite_ext(sp_gui_cover_1080_complete_v11,0,0+guiShakeX,0+guiShakeY,1,1,0,c_white,1); //<<<<<<<<<<<<<<<<<<<<<<<< actual HUD
draw_sprite_ext(sp_brightness_gradient,0,0+guiShakeX,0+guiShakeY,1,1,0,c_white,1);
//draw_sprite_ext(sp_center_screen_gradient,0,0+guiShakeX,0+guiShakeY,1,1,0,c_white,0.2);


//if(target.drillHeat >= 70){draw_sprite(sp_overheat_glass_overheat,0,1137,606);}

//shake and parallax behaviors go here 
/*
HP
RPM + tube
heat alert
DEPTH
misc display
cables?
*/

tHeat = 0;

//temp override display; fix me later 
draw_sprite(sp_override_indicator,0,1638+guiShakeX,579+guiShakeY);
draw_circle_color(1675+guiShakeX,612+guiShakeY,12,c_gray,c_gray,true);
draw_text(1691+guiShakeX,600+guiShakeY,"OVERRIDE");

	if(oHeat && target.override = false)
	{

	tHeat = 1;

	}
	else
	{
		
	}
	
	if(target.override = true)
	{
		draw_sprite_ext(sp_aoe_light_64,0,1675+guiShakeX,612+guiShakeY,1,1,0,c_white,0.5);
		draw_circle(1675+guiShakeX,612+guiShakeY,11,false);
	}

draw_sprite_ext(sp_gui_cover_1080_OH_flash,0,0,0,1,1,0,c_white,tHeat * 0.3); //overheat flash

//temp vent display
draw_sprite_ext(sp_heatvent,0,1610+guiShakeX,690+guiShakeY,0.15,0.15,0,c_white,1);
if(oHeat)
{
	ventTimer ++;
	if(ventTimer > 15)
	{
		if(ventAlert = false){ventAlert = true;}else{ventAlert = false;}
		ventTimer = 0;
	}
}
if(target.heatShutdown = true){ventAlert = true;}
if(target.heatShutdown = false && !oHeat){ventAlert = false;}


draw_sprite_ext(sp_heatvent_light,0,1610+guiShakeX,690+guiShakeY,0.15,0.15,0,c_white,ventAlert);
draw_sprite_ext(sp_aoe_light_128,0,1610+guiShakeX+38,690+guiShakeY+22,1,1,0,c_white,ventAlert*0.5);
draw_text(1703+guiShakeX,686+guiShakeY,"VENT");
draw_text(1703+guiShakeX,718+guiShakeY,"HEAT");


if(shake) //create 2 unique var pairs for below pairings. once shake is kill, approach all to 0
{
	pair0X = 0 + guiShakeX * 1;
    pair0Y = 0 + guiShakeY * 1;
	
	pair1X = 0 + guiShakeX * 2;
    pair1Y = 0 + guiShakeY * 2;
}
else
{
	pair0X = approach(0,0,0.3);
    pair0Y = approach(0,0,0.3);
	
	pair1X = approach(0,0,0.3);
    pair1Y = approach(0,0,0.3);
}

//pair0
draw_sprite(sp_speedometer_gauge1,0,pair0X,pair0Y-16);
draw_sprite(sp_depth_complete1,0,pair0X,pair0Y-16);
//possibly needle here 


//pair1
draw_sprite(sp_HP_gauge_complete_v21,0,pair1X-16,pair1Y-16);
draw_sprite(sp_rpm_gauge_complete1,0,pair1X-16,pair1Y-16);
//note: 16 PNT offset if because the sprite was increased from a 1920x1080 sprite by 32 pixels


if(currHP != target.HP)
{
	if(currHP > target.HP)
	{
		currHP -= 0.1;
	}
	else
	{
		currHP += 0.1;
	}
}

var tHP =  (((100 - currHP) * 0.01) * 265) + 116; //2.5 is the starting position, last digit is ending position
var tRPM = (((100 - (target.drillStopTimer * 1.66)) * 0.01) * 265) + 95;
var tKPh = (((100 - (abs(target.velocity) * 40)) * 0.01) * 245) + 95;

draw_sprite_ext(sp_needle,0,350+pair1X,150+pair1Y,1,1,tHP,c_white,1); //HP needle
draw_sprite_ext(sp_lower_guage_needle_center,0,350+pair1X,150+pair1Y,1,1,0,c_white,1); 
draw_sprite_ext(sp_lower_guage_needle,0,1617+pair1X,839+pair1Y,1,1,tRPM,c_white,1); //RPM needle
draw_sprite_ext(sp_lower_guage_needle_center,0,1617+pair1X,839+pair1Y,1,1,0,c_white,1);
draw_sprite_ext(sp_lower_guage_needle,0,1443+pair0X,882+pair0Y,0.8,0.8,tKPh,c_white,1); //KPH needle
draw_sprite_ext(sp_lower_guage_needle_center,0,1443+pair0X,882+pair0Y,0.8,0.8,0,c_white,1);


var tString = fathoms;
if(room = rm_ocean_1){tString += 500;}
if(room = rm_crystal_1){tString += 1000;}
if(room = rm_fungal_1){tString += 1500;}
if(room = rm_final_boss_1){
	//tString = 3000;
	var h = 3000/8000;
	var o = obj_ow_rs_end2vic;
	var t = distance_to_object(o);
	tString = t * h;
	}
tString = string(tString);

draw_text_transformed(532+pair0X,56+pair0Y,string_char_at(tString,0),2,2,0); //depth aka nixies
draw_text_transformed(597+pair0X,56+pair0Y,string_char_at(tString,1),2,2,0);
draw_text_transformed(650+pair0X,61+pair0Y,string_char_at(tString,2),2,2,0);
draw_text_transformed(720+pair0X,61+pair0Y,string_char_at(tString,3),2,2,0);

//draw_sprite_ext(sp_load_sprite_light,0,1686+guiShakeX,445+guiShakeY,1,1,0,c_white,chargeEmpty); //empty
//draw_sprite_ext(sp_load_empty,0,1681,535,1,1,0,c_white,1);
if(chargeEmpty)
{
	draw_circle_color(1686+guiShakeX,445+guiShakeY,12,c_white,c_white,false);
	//draw_circle_color(1686+guiShakeX,445+guiShakeY,14,c_black,c_black,true);
	//draw_circle_color(1686+guiShakeX,445+guiShakeY,16,c_white,c_white,true);
	draw_sprite_ext(sp_aoe_light_64,0,1686+guiShakeX,445+guiShakeY,1,1,0,c_white,0.5);
}
draw_circle_color(1686+guiShakeX,445+guiShakeY,13,c_gray,c_gray,true);

//draw_sprite_ext(sp_load_sprite_light,0,1740+guiShakeX,445+guiShakeY,1,1,0,c_white,chargeLoad); //load
//draw_sprite_ext(sp_load_load,0,1758,528,1,1,0,c_white,1); //load
if(chargeLoad)
{
	draw_circle_color(1740+guiShakeX,445+guiShakeY,12,c_white,c_white,false);
	//draw_circle_color(1740+guiShakeX,445+guiShakeY,14,c_black,c_black,true);
	//draw_circle_color(1740+guiShakeX,445+guiShakeY,16,c_white,c_white,true);
	draw_sprite_ext(sp_aoe_light_64,0,1740+guiShakeX,445+guiShakeY,1,1,0,c_white,0.5);
}
draw_circle_color(1740+guiShakeX,445+guiShakeY,13,c_gray,c_gray,true);

//draw_sprite_ext(sp_load_sprite_light,0,1793+guiShakeX,444+guiShakeY,1,1,0,c_white,chargeReady); //ready
//draw_sprite_ext(sp_load_ready,0,1835,528,1,1,0,c_white,1); //ready
if(chargeReady)
{
	draw_circle_color(1793+guiShakeX,444+guiShakeY,12,c_white,c_white,false);
	//draw_circle_color(1793+guiShakeX,444+guiShakeY,14,c_black,c_black,true);
	//draw_circle_color(1793+guiShakeX,444+guiShakeY,16,c_white,c_white,true);
	draw_sprite_ext(sp_aoe_light_64,0,1793+guiShakeX,444+guiShakeY,1,1,0,c_white,0.5);
}
draw_circle_color(1793+guiShakeX,444+guiShakeY,13,c_gray,c_gray,true);

//draw_sprite_ext(sp_heat_gradient,0,44,947-(((target.drillHeat*0.01) * 722)*0.5),1,target.drillHeat*0.01,0,c_white,0.5); //draws a simple lighting effect for the heatbar

//start @ 722 then love space according to 