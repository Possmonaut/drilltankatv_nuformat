if(distance_to_object(target) > checkDist)
{
	exit;
}

var _x = camera_get_view_x(view)+(obj_ow_camera.iWidth/2);
var _y = camera_get_view_y(view)+(obj_ow_camera.iHeight/2);

var FX = _x;
var FY = _y;

if(shake = false)
{
	letterTimer ++;
	draw_text_color(FX, FY - letterTimer, "+" + string(oreLoss*10) + " CREDITS", c_black, c_black, c_black,c_black,1);
	draw_text_color(FX + 4, FY + 4 - letterTimer, "+" + string(oreLoss*10) + " CREDITS", c_white, c_white, c_white,c_white,1);
	if(letterTimer >= 120)
	{
		letterTimer = 0;
		shake = true;
	}
	
}

if(onDepo)
{
	if(docked)
	{

		
		draw_set_color(c_black);
		draw_button(FX, FY-256, FX + 288, FY - 224, buttonArrayActive[1]);
		draw_set_color(c_white);
		draw_text(FX+8, FY-256, "Hold Space to Repair");
		draw_set_color(c_black);
		draw_button(FX, FY-224, FX + 288, FY - 192, buttonArrayActive[2]);
		draw_set_color(c_white);
		draw_text(FX+8, FY-224, "Buy demo charges");
		draw_set_color(c_black);
		draw_button(FX, FY-192, FX + 288, FY - 160, buttonArrayActive[3]);
		draw_set_color(c_white);
		draw_text(FX+8, FY-192, "Exit");
		
		draw_sprite(sp_enemy_marker,0, FX + 288, FY - 288 + (32 * buttonArray));
	}
	else
	{
		draw_text(FX+8, FY-160, "Press Space to Dock");
	}
	//lock controls
	//three buttons
	//repair
	//buy demo charges
	//exit
	//also, pressing escape will kick them out
	//same thing as the other game system
	//display and move buttons
	//use a simple button grid
}