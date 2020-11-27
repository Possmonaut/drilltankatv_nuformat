draw_set_color(c_black);
draw_button(64, 0, 1023, 128, 1);
draw_set_color(c_white);

draw_text(74, 0, "l/r = rotate, up/down = accel / decel, x = stop, space = DRILL!"); 
draw_text(74, 16, "Gear: " + string(round(forwardSpeed)));

if(forwardSpeed >= 2 && (keyboard_check(vk_right) || (keyboard_check(vk_left))))
{
	draw_text(74, 32, "WARNING: REDUCE SPEED!");
}

if(drillHeat > 74){
	draw_text(74, 48, "WARNING: OVERHEATING");
}

