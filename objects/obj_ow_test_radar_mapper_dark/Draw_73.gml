if(radarComplete = false)
{
	draw_line(x, y, x + lengthdir_x(512, rotateDir), y + lengthdir_y(512, rotateDir));
	draw_set_alpha(0.9);
	draw_line(x, y, x + lengthdir_x(512, rotateDir-1), y + lengthdir_y(512, rotateDir-1));
	draw_set_alpha(0.6);
	draw_line(x, y, x + lengthdir_x(512, rotateDir-2), y + lengthdir_y(512, rotateDir-2));
	draw_set_alpha(0.3);
	draw_line(x, y, x + lengthdir_x(512, rotateDir-3), y + lengthdir_y(512, rotateDir-3));
	draw_set_alpha(1);
	//note: code this to look better in the future. make it so they "catch up" to the first line
	//using camera code
	
	draw_circle(x, y, 512, true);
}

//draw_text(x, y, rotateDir);