if(activeConvo = true && stor_complete = true)
{
	draw_set_color(c_black);
	draw_button(70, 560, 970, 760, false);
	draw_set_color(c_white);
	//draw_text_ext for auto wrapping


	if(charCount < string_length(NPC_dialogue[# NPCID, currentPage]))
	{
	charCount += 0.5;
	}
	
		textPart = string_copy(page_array[currentPage], 0, charCount);
		if(page_array[currentPage] = "") {textPart = "Error: no text found"};
		draw_text(80,570,textPart);
		}
else
{
charCount = 0;	
}


//debug text below
if(obj_init.debug = true)
{
	//draw debug_var, debug_var2
	
}