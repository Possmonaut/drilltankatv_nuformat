draw_rectangle(0,0,96,16,true);
draw_text(0,0,tempText);

if(saveTrigger)
{
	draw_text(128,8,"saving...");
	saveTrigger = false;
}

if(loadTrigger)
{
	draw_text(128,8,"loading...");
	loadTrigger = false;
}

if(eraseTrigger)
{
	draw_text(128,8,"erasing...");
	eraseTrigger = false;
}

draw_text(8,24,"Press Enter to save");
draw_text(8,40,"Press F1 to load");
draw_text(8,56,"Press F2 to erase save data");

if(displayTrigger != "")
{
	draw_text(8,72,displayTrigger);
}

//drawDisplay text w/ special line spacing 

//draw_text(mouse_x,mouse_y,string(tilemap_get_at_pixel(tilemap,mouse_x,mouse_y)));