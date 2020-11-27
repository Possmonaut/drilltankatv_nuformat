function scr_rock_vibrate(argument0) {
	argument0 = 0;
	var scr_target = argument0;
	var vib = irandom_range(-10,10);
	var vibAxis = irandom(1);

	if (vibAxis = 0) 
	{scr_target.x += vib;}
	else
	{scr_target.y += vib;}







}
