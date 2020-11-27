if(myAlpha <= 1 && swapTimer = 0)
{
	myAlpha += 0.01;
}

var midWX = window_get_width() * 0.5;
var midWY = window_get_height() * 0.5;
var midSX = sprite_get_width(sp_dead_screen) * 0.5;
var midSY = sprite_get_height(sp_dead_screen) * 0.5;

var posX = midWX - midSX;
var posY = midWY - midSY;

draw_sprite_ext(sp_dead_screen,0,posX,posY,1,1,0,c_white,myAlpha);
draw_text_color(posX, posY + 520, "press space to return to the main menu", c_white,c_white,c_white,c_white,myAlpha);

if(swapTimer = 0)
{
	if(keyboard_check(vk_space))
	{
		menu = true;
		swapTimer ++;
	}
	
	if(keyboard_check(vk_f1))
	{
		load = true;
		swapTimer ++;
	}
}

if(swapTimer > 0)
{
	swapTimer ++;
	myAlpha -= 0.01;
	if(myAlpha = 0 && menu)
	{
		if(instance_exists(obj_ow_camera))
		{
			instance_destroy(obj_ow_camera);
			instance_destroy(obj_save_boy);
			instance_destroy(obj_ow_particle_handler);
			instance_destroy(obj_ow_fade_handler);
			instance_destroy(o_display_manager);
			instance_destroy(obj_ow_transponder_controller_temp);
		}
		
		room_goto(rm_setup);
		instance_destroy(id);
	}
}

draw_text(0,0,string(instance_number(all)));