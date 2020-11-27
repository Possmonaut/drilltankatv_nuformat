

draw_self();
draw_text(x, y, angleDir);
draw_text(x, y - 20, RPosX);
draw_text(x, y - 40, RPosY);




draw_circle( x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir), 5, false);
draw_circle( x + 16 +  lengthdir_x(18, angleDir - 30), y + 16 + lengthdir_y(18,angleDir - 30), 5, false);
draw_circle( x + 16 +  lengthdir_x(18, angleDir + 30), y + 16 + lengthdir_y(18,angleDir + 30), 5, false);


RPosX = x + 16 +  lengthdir_x(32, angleDir);
RPosY = y + 16 + lengthdir_y(32,angleDir);


//draw_circle(RPosX - 16, RPosY - 16, 5, false);