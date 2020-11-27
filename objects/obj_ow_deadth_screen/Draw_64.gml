if(myAlpha > 0 && swapTimer = 0)
{
	myAlpha -= 0.01;
}



var midWX = window_get_width() * 0.5;
var midWY = window_get_height() * 0.5;
var midSX = sprite_get_width(sp_dead_screen) * 0.5;
var midSY = sprite_get_height(sp_dead_screen) * 0.5;

//var posX = midWX - midSX;
//var posY = midWY - midSY;

var posX = midWX;
var posY = midWY;

draw_set_font(pixelette32);

draw_sprite_ext(sp_bigassBlackBG,0,0,0,1,1,0,c_white,1);
draw_text_color(posX-(string_width(dieText)*0.5), posY -300,dieText, c_white,c_white,c_white,c_white,1);
draw_text_color(posX-(string_width(returnText)*0.5), posY+200,returnText, c_white,c_white,c_white,c_white,1);
//draw_text_color(posX-(string_width(loadText)*0.5), posY +300, loadText, c_white,c_white,c_white,c_white,1);
draw_sprite_ext(sp_bigassBlackBG,0,0,0,1,1,0,c_white,myAlpha);

draw_set_font(pixelette16);

if(swapTimer = 0)
{
	if(keyboard_check(vk_space))
	{
		menu = true;
		swapTimer ++;
		audio_group_set_gain(ambMusic,0,500);
	}
	//if(keyboard_check(vk_f1))
	//{
		//load = true;
		//swapTimer ++;
	//}
}

if(swapTimer > 0)
{
	swapTimer ++;
	myAlpha += 0.01;
	
	if(myAlpha = 1 && menu)
	{
		audio_group_stop_all(soundEffects);
		audio_group_stop_all(ambMusic);
		audio_group_set_gain(ambMusic,1,0);
		audio_group_set_gain(soundEffects,1,0);
		
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
		
		room_goto(rm_setup);
		instance_destroy(id);
	}
	
	if(myAlpha == 1 && load)
	{
		obj_save_boy.openLoad = true;
		obj_save_boy.roomSwap = true;
	}
}

//draw_text(0,0,string(instance_number(all)));